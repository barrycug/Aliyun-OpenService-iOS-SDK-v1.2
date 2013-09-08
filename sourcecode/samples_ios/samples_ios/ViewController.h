//
//  ViewController.h
//  samples_ios
//
//  Created by baocai zhang on 12-8-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
#import <AliyunOpenServiceSDK/OSS.h>
#import <AliyunOpenServiceSDK/OTS.h>
 */
#import "ECSClient.h"
#import "OSS.h"
#import "OTS.h"

@interface ViewController : UIViewController
{
    OSSClient * _client;
    OTSClient * _otsClient;
    ECSClient * _ecsClient;
    NSIndexPath *_indexPath ;
}
@property (strong,nonatomic) IBOutlet UITableView * tableView;
@property (strong,nonatomic) NSMutableArray * buckets;
@end
