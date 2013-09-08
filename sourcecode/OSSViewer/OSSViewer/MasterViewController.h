//
//  MasterViewController.h
//  OSSViewer
//
//  Created by zhang baocai on 11/4/12.
//  Copyright (c) 2012 igis.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSS.h" 

@class DetailsViewController;

@interface MasterViewController : UITableViewController
{
    OSSClient * _client;
    NSIndexPath *_indexPath ;
}
@property (strong,nonatomic) NSMutableArray * buckets;
@property (strong,nonatomic) DetailsViewController *detailViewController;
@end
