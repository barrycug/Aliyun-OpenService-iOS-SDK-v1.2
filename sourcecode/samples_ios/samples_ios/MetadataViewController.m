//
//  MetadataViewController.m
//  samples_ios
//
//  Created by zhang baocai on 11/3/12.
//
//

#import "MetadataViewController.h"

@interface MetadataViewController ()

@end

@implementation MetadataViewController
@synthesize client = _client;
@synthesize tableView = _tableView;
@synthesize bucketName = _bucketName;
@synthesize key = _key;
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
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //if results is not nil and we have results, return that number
    int rtn =0;

     
	return rtn;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    return nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
