//
//  ECSInstanceStatus.m
//  samples_ios
//
//  Created by zhang baocai on 9/1/13.
//
//

#import "ECSInstanceStatus.h"

@implementation ECSInstanceStatus
@synthesize instanceId = _instanceId;
@synthesize instanceStatusItemType = _instanceStatusItemType;
-(void)dealloc
{
    [_instanceId release];_instanceId = nil;
    [super dealloc];
}
-(id) initWithInstanceStatusItemType:(ECSInstanceStatusItemType)type
                            instanceId:(NSString*)instanceId
{
    if (self = [super init]) {
        _instanceStatusItemType = type;
        _instanceId = [instanceId retain];
    }
    return self;
}
@end
