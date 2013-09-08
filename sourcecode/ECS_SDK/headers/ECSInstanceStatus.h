//
//  ECSInstanceStatus.h
//  samples_ios
//
//  Created by zhang baocai on 9/1/13.
//
//

#import <Foundation/Foundation.h>
#import "ECSBaseType.h"
@interface ECSInstanceStatus : NSObject
{
    ECSInstanceStatusItemType  _instanceStatusItemType;
    NSString *_instanceId;
}
@property(nonatomic,assign)ECSInstanceStatusItemType  instanceStatusItemType;
@property(nonatomic,retain)NSString *instanceId;
-(id) initWithInstanceStatusItemType:(ECSInstanceStatusItemType)type
                            instanceId:(NSString*)instanceId;
@end
