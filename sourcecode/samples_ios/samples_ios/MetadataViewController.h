//
//  MetadataViewController.h
//  samples_ios
//
//  Created by zhang baocai on 11/3/12.
//
//

#import <UIKit/UIKit.h>
#import "OSS.h"
@interface MetadataViewController : UIViewController
{

}
@property(strong,nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) OSSClient * client;
@property(strong,nonatomic) NSString * bucketName;
@property(strong,nonatomic) NSString * key;
@end
