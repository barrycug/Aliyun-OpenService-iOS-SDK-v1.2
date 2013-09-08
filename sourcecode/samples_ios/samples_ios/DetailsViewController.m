//
//  DetailsViewController.m
//  samples_ios
//
//  Created by baocai zhang on 12-10-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DetailsViewController.h"
#import "MBProgressHUD.h"
#import "TextViewController.h"
#import "ImageViewController.h"
#import "UIImage+fixOrientation.h"

@interface DetailsViewController ()<OSSClientDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,MBProgressHUDDelegate>

@end

@implementation DetailsViewController
@synthesize tableView = _tableView;
@synthesize client = _client;
@synthesize bucketName = _bucketName;
@synthesize objects = _objects;
@synthesize prefix = _prefix;
@synthesize folders = _folders;
-(void) dealloc
{
    self.client = nil;
    self.tableView = nil;
    self.bucketName = nil;
    self.objects = nil;
    self.prefix = nil;
    self.folders = nil;
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _objects = [[NSMutableArray alloc] initWithCapacity:10];
    _folders = [[NSMutableArray alloc] initWithCapacity:10];
    
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Objects";
    
    UIBarButtonItem * addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd  target:self action:@selector(addOSSObject:)];
    [self.navigationItem setRightBarButtonItem:addItem];
    
    _client.delegate = self;
    ListObjectsRequest * lor = [[ListObjectsRequest alloc] initWithBucketName:self.bucketName prefix:self.prefix marker:nil maxKeys:0 delimiter:@"/"];
    [_client listObjects:lor];
    [lor release];
    lor = nil;
}
-(void) addOSSObject:(id) sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                initWithTitle:@"创建Object类型"
                                  delegate:self
                                cancelButtonTitle:@"取消"
                               destructiveButtonTitle:nil
                                 otherButtonTitles:@"文件夹", @"拍照",@"图库",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            [self addFolder];
        }
            break;
        case 1:
        {
            [self addPictureFromCamera];
        }
        case 2:
        {
            [self addPictureFromPhotoLibrary];
        }
            break;
        default:
            break;
    }
}


-(void) addFolder
{
    UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"输入文件夹名称" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
    [alert release];
}
#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    /* ok button */
    if (buttonIndex == 1) {
        UITextField * textField = [alertView textFieldAtIndex:0];
        if (textField.text != nil && ![textField.text isEqualToString:@""]) {
            NSString *strKey = [NSString stringWithFormat:@"%@%@/",self.prefix,textField.text];
            NSLog(@"%@",strKey);
            ObjectMetadata * objMetadata = [[ObjectMetadata alloc] init];
            [_client putObject:self.bucketName key:strKey data:nil objectMetadata:objMetadata];
            [objMetadata release];
        }        
    }
}
-(void)OSSObjectPutObjectFinish:(OSSClient*) client result:(PutObjectResult*) result
{
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    //folder
    if ([result.key endsWith:@"/"]) {
        [self.folders addObject:result.key];
    }
    else
    {
        OSSObjectSummary * obj= [[OSSObjectSummary  alloc] initWithBucketName:self.bucketName key:result.key eTag:nil size:0 lastModified:nil storageClass:nil owner:nil];
        [self.objects addObject:obj];
        [obj release];
    }
    
    [self.tableView reloadData];

}

-(void)OSSObjectPutObjectFailed:(OSSClient*) client error:(OSSError*) error
{
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    [self showError:error];
}
-(void) showError:(OSSError*) error
{    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error.errorMessage delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
    [alert show];
    [alert release];
    alert = nil;
}
-(void) addPictureFromCamera
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];

        picker.delegate = self;
            
        //设置拍照后的图片可被编辑
        picker.allowsEditing = NO;
        picker.sourceType = sourceType;
        
        [self presentModalViewController:picker animated:YES];
        [picker release];
    }
    else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

-(void)addPictureFromPhotoLibrary
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = NO;
    [self presentModalViewController:picker animated:YES];
    [picker release];
}
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];

    NSString *imageId;
    NSString *imageType;

    [picker dismissModalViewControllerAnimated:YES];
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        //先把图片转成NSData
         
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        image = [image fixOrientation];
        
        NSURL *url = [info objectForKey: @"UIImagePickerControllerReferenceURL"];
    
        
        imageId = [url absoluteString];
        NSArray *tmpArray = [imageId componentsSeparatedByString: @"="];
        imageId = [tmpArray objectAtIndex:1];
        imageType = [tmpArray objectAtIndex:2];
        NSArray *tmpArray2 = [imageId componentsSeparatedByString: @"&"];
        imageId = [tmpArray2 objectAtIndex:0];

        NSString *fileName;
        NSDate * date = [NSDate date];
        
        NSData *data;
    
        if (UIImagePNGRepresentation(image) == nil)

        {
            data = UIImageJPEGRepresentation(image, 1.0);

        }
        else
        {
            data = UIImagePNGRepresentation(image);
            imageType = @"png";
        }
        if (imageId == nil || [imageId isEqualToString:@""]) {
            NSString *strTime =[NSString stringWithFormat:@"%ld",(long)date.timeIntervalSinceReferenceDate];
            fileName = [[NSString alloc] initWithFormat: @"photo%@.%@", strTime, imageType];
        }
        else
        {
            fileName = [[NSString alloc] initWithFormat: @"%@.%@", imageId, imageType];
        }
   
        


        // No need to retain (just a local variable)
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.labelText = @"图片上传中...";
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            // Do a taks in the background
            [self putObject:fileName data:data];
            // Hide the HUD in the main tread
            });


        
    }

}
- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [hud removeFromSuperview];

}

-(void) putObject:(NSString * )fileName data:(NSData*) data
{
    _client.delegate = self;
    NSString *strKey = [NSString stringWithFormat:@"%@%@",self.prefix,fileName];
    NSLog(@"%@",strKey);
    ObjectMetadata * objMetadata = [[ObjectMetadata alloc] init];
    [_client putObject:self.bucketName key:strKey data:data objectMetadata:objMetadata];
    [objMetadata release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    //这里写你手指横向滑动需要处理的事件
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        _indexPath = [indexPath retain];
        NSString *strKey = @"";
        if (indexPath.row < [self.folders count]) {
            strKey = [self.folders objectAtIndex:indexPath.row];
        }
        else
        {
            OSSObjectSummary * obj = [self.objects objectAtIndex:indexPath.row-[self.folders count]];
            strKey = obj.key;
        }
        _client.delegate = self;
        [_client deleteObject:self.bucketName key:strKey];
        
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
-(void)OSSObjectDeleteObjectFinish:(OSSClient*) client bucketName:(NSString*) bucketName key:(NSString*)key
{
    if (_indexPath != nil) {
        if (_indexPath.row < [self.folders count]) {
            [self.folders removeObjectAtIndex:_indexPath.row];
        }
        else
        {
            [self.objects removeObjectAtIndex:_indexPath.row-[self.folders count]];
        }
        
        // Delete the row from the data source.
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:_indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [_indexPath release];
    }
    
    _indexPath = nil;
}
-(void)OSSObjectDeleteObjectFailed:(OSSClient*) client error:(OSSError*) error
{
    [self showError:error];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //if results is not nil and we have results, return that number
    int rtn =0;

    rtn = [self.folders count] +[self.objects count];

   

	return rtn;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    NSString *strIndex;
    if (indexPath.row < [self.folders count]) {
        NSString *strFolder = [self.folders objectAtIndex:indexPath.row];
       NSArray *sSplit = [strFolder componentsSeparatedByString:@"/"]; 
       strIndex =[NSString stringWithFormat:@"%@",[sSplit objectAtIndex:[sSplit count]-2] ];
    //    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.imageView.image = [UIImage imageNamed:@"folder.png"];
    }
    else {
        OSSObjectSummary * obj = [self.objects objectAtIndex:indexPath.row-[self.folders count]];
        NSArray *sSplit2 = [obj.key componentsSeparatedByString:@"/"]; 
        NSString *strKey;
        if ([sSplit2 count] >1) {
             strKey =[NSString stringWithFormat:@"%@",[sSplit2 objectAtIndex:[sSplit2 count]-1] ];
        }
        else {
            strKey= obj.key;
        }
        cell.imageView.image = [UIImage imageNamed:@"file.png"];
        strIndex =[NSString stringWithFormat:@"%@",strKey];
    }
   
	cell.textLabel.text = strIndex;
    cell.textLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row < [self.folders count]) {
        NSString * str = [self.folders objectAtIndex:indexPath.row];
        DetailsViewController * detailsVC = [[DetailsViewController alloc] initWithNibName:@"DetailsViewController" bundle:nil];
        detailsVC.client = _client;
        detailsVC.bucketName = self.bucketName;
        detailsVC.prefix = str;
        [self.navigationController pushViewController:detailsVC animated:YES];
        [detailsVC release];
    }
    else
    {
        OSSObjectSummary * obj = [self.objects objectAtIndex:indexPath.row-[self.folders count]];
        NSArray *sSplit2 = [obj.key componentsSeparatedByString:@"/"];
        NSString *strKey;
        if ([sSplit2 count] >1) {
            strKey =[NSString stringWithFormat:@"%@",[sSplit2 objectAtIndex:[sSplit2 count]-1] ];
        }
        else {
            strKey= obj.key;
        }
        if([[strKey lowercaseString] hasSuffix:@".txt"] || [[strKey lowercaseString] hasSuffix:@".png"] || [[strKey lowercaseString] hasSuffix:@".jpg"])
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            hud.labelText = @"数据获取中...";
           // [self fetchObject:self.bucketName key:obj.key];
            
            dispatch_async(dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL), ^{
                // Do a taks in the background
                [self fetchObject:self.bucketName key:obj.key];
                
            });
             

            
        }     
    }
   	
}

-(void) fetchObject:(NSString*) bucketName key:(NSString*) key
{
    _client.delegate = self;
    [_client fetchObject:bucketName key:key];
}
-(void)OSSObjectFetchObjectFinish:(OSSClient*) client result:(OSSObject*) result
{
     [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    if([[result.key lowercaseString] hasSuffix:@".txt" ])
    {
        TextViewController * textVC = [[TextViewController alloc] initWithNibName:@"TextViewController" bundle:nil];
        
        NSString* aStr = [[[NSString alloc] initWithData:result.objectContent encoding:NSASCIIStringEncoding] autorelease];
        textVC.text = aStr;
        [self.navigationController pushViewController:textVC animated:YES];
        [textVC release];
    }
    else if([[result.key lowercaseString] hasSuffix:@".png"] || [[result.key lowercaseString] hasSuffix:@".jpg"])
    {
        ImageViewController * imageVC = [[ImageViewController alloc] initWithNibName:@"ImageViewController" bundle:nil];
        imageVC.image = [UIImage imageWithData:result.objectContent ];
        [self.navigationController pushViewController:imageVC animated:YES];
        [imageVC release];
    }
}

-(void)OSSObjectFetchObjectFailed:(OSSClient*) client error:(OSSError*) error
{
     [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    [self showError:error];
}
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
   
	
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)bucketListObjectsFinish:(OSSClient*) client result:(ObjectListing*) result
{
    NSArray * objs = result.objectSummaries; 
    //去掉和prefix 同名的对象
    NSMutableArray * newobjs = [NSMutableArray arrayWithCapacity:[objs count]];
    for (int j =0; j< [objs count]; j++) {
        OSSObjectSummary * objSummary = [objs objectAtIndex:j];
        if (![objSummary.key isEqualToString:self.prefix]) {
            [newobjs addObject:objSummary];
        }
    }
    [self.objects addObjectsFromArray: newobjs];    
    [self.folders addObjectsFromArray: result.commonPrefixes];
    [self.tableView reloadData];
}

-(void)bucketListObjectsFailed:(OSSClient*) client error:(OSSError*) error
{
    
    [self showError:error];
}

@end
