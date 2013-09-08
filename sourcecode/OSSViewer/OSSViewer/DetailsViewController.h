//
//  DetailsViewController.h
//  samples_ios
//
//  Created by baocai zhang on 12-10-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UITableView.h>
#import "OSS.h"

@interface DetailsViewController : UIViewController
{
   NSIndexPath *_indexPath ;
    int _index;
}
@property(strong,nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) OSSClient * client;
@property(strong,nonatomic) NSString * bucketName;
@property(strong,nonatomic) NSString * prefix;
@property(strong,nonatomic) NSMutableArray * objects;
@property(strong,nonatomic) NSMutableArray * folders;
-(void) refresh;

@end
