//
//  MasterViewController.m
//  OSSViewer
//
//  Created by zhang baocai on 11/4/12.
//  Copyright (c) 2012 igis.me. All rights reserved.
//
//在此处修改自己的aliyun OSS服务的 AccessID 和AccessKey

#define accessid @"9e0g1wvcoc9889d4c685iyq3"
#define accesskey @"MzxWwbrsHrFxnQCgY3ET8suIqck="

#import "MasterViewController.h"

#import "DetailsViewController.h"

@interface MasterViewController ()<OSSClientDelegate> {
    
}
@end

@implementation MasterViewController
@synthesize buckets = _buckets;
@synthesize detailViewController =_detailViewController;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Buckets";
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    return self;
}
							
- (void)dealloc
{

    [_client release];
    _client = nil;
    [super dealloc];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBucket:)] autorelease];
    self.navigationItem.rightBarButtonItem = addButton;
    
    _client = [[OSSClient alloc] initWithAccessId:accessid andAccessKey:accesskey];
    _client.delegate = self;
       _indexPath = nil;

    _buckets = [[NSMutableArray alloc] initWithCapacity:20];
    [self listBucket];
}
-(void) listBucket
{
    [_client listBuckets];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) addBucket:(id) sender
{
    UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"输入新Bucket名称" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
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
            _client.delegate = self;
            [_client createBucket:textField.text];
        }
        
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    self.navigationItem.title = @"Buckets";
    [super viewDidAppear:animated];
    _client.delegate = self;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
	int rtn=0;
	
	rtn = [self.buckets count];
	
	
	return rtn;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    Bucket *bucket = [self.buckets objectAtIndex:indexPath.row];
    
	NSString *strIndex =[NSString stringWithFormat:@"%@",bucket.name];
	cell.textLabel.text = strIndex;
    //   cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	cell.imageView.image = [UIImage imageNamed:@"bucket.png"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        _indexPath = [indexPath retain];
        Bucket * bucket = [self.buckets objectAtIndex:indexPath.row];
        _client.delegate = self;
        [_client deleteBucket:bucket.name];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    Bucket *bucket = [self.buckets objectAtIndex:indexPath.row];
    
	
    self.detailViewController.client = _client;
    self.detailViewController.bucketName = bucket.name;
    self.detailViewController.prefix = @"";
    [self.detailViewController refresh];

	
}
 /*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}
  */
-(void)bucketListFinish:(OSSClient*) client result:(NSArray*) bucketList
{
    [self.buckets addObjectsFromArray: bucketList];
    [self.tableView reloadData];
}

-(void)bucketListFailed:(OSSClient*) client error:(OSSError*) error
{
    [self showError:error];
    
}
-(void)bucketDeleteFinish:(OSSClient*) client result:(NSString*) bucketName
{
    if (_indexPath != nil) {
        [self.buckets removeObjectAtIndex:_indexPath.row];
        // Delete the row from the data source.
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:_indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [_indexPath release];
    }
    
    _indexPath = nil;
}

-(void)bucketDeleteFailed:(OSSClient*) client error:(OSSError*) error
{
    [self showError:error];
}
-(void)bucketCreateFinish:(OSSClient*) client result:(Bucket*) bucket
{
    // NSLog(@"%@",bucket.name);
    [self.buckets addObject:bucket];
    [self.tableView reloadData];
    
}

-(void)bucketCreateFailed:(OSSClient*) client error:(OSSError*) error
{
    [self showError:error];
}
-(void) showError:(OSSError*) error
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error.errorMessage delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
    [alert show];
    [alert release];
    alert = nil;
}
@end
