//
//  ECSInstanceType.m
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import "ECSInstanceType.h"

@implementation ECSInstanceType
@synthesize cpuCoreCount = _cpuCoreCount;
@synthesize memorySize = _memorySize;
@synthesize instanceTypeId = _instanceTypeId;
-(void) dealloc
{
    [_instanceTypeId release]; [_instanceTypeId release];
    [_memorySize release]; [_memorySize release];
    [super dealloc];
}
-(id)initWithCPUCoreCount:(int)cpuCoreCount
           instanceTypeId:(NSString *)instanceTypeId
               memorySize:(NSString *)memorySize
{
    if (self = [super init]) {
        _cpuCoreCount = cpuCoreCount;
        _instanceTypeId = [instanceTypeId retain];
        _memorySize = [memorySize retain];
    }
    return self;
}
@end
