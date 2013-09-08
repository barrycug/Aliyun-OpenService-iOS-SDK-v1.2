//
//  ECSInstanceMonitorData.m
//  samples_ios
//
//  Created by zhang baocai on 9/4/13.
//
//

#import "ECSInstanceMonitorData.h"

@implementation ECSInstanceMonitorData
@synthesize  bpsRead = _bpsRead;
@synthesize  bpsWrite = _bpsWrite;
@synthesize  cpu = _cpu;
@synthesize  instanceId = _instanceId;
@synthesize  internetBandwidth = _internetBandwidth;
@synthesize  internetFlow = _internetFlow;
@synthesize  internetRX = _internetRX;
@synthesize  internetTX = _internetTX;
@synthesize  intranetBandwidth = _intranetBandwidth;
@synthesize  intranetFlow = _intranetFlow;
@synthesize  intranetRX = _intranetRX;
@synthesize  intranetTX = _intranetTX;
@synthesize  iopsRead = _iopsRead;
@synthesize  iopsWrite = _iopsWrite;
@synthesize  memory = _memory;
@synthesize  timeStamp = _timeStamp;
-(void)dealloc
{
    [_instanceId release]; _instanceId = nil;
    [_timeStamp release]; _timeStamp = nil;
    [super dealloc];
    
}
-(id)initWithBPSRead:(int)bpsRead
            bpsWrite:(int)bpsWrite
                 cpu:(int)cpu
          instanceId:(NSString*)instanceId
   internetBandwidth:(int)internetBandwidth
        internetFlow:(int)internetFlow
          internetRX:(int)internetRX
          internetTX:(int)internetTX
   intranetBandwidth:(int)intranetBandwidth
        intranetFlow:(int)intranetFlow
          intranetRX:(int)intranetRX
          intranetTX:(int)intranetTX
            iopsRead:(int)iopsRead
           iopsWrite:(int)iopsWrite
              memory:(int)memory
           timeStamp:(NSString*)timeStamp
{
    if (self = [super init]) {
        _bpsRead = bpsRead;
        _bpsWrite = bpsWrite;
        _cpu = cpu;
        _instanceId = [instanceId retain];
        _internetBandwidth = internetBandwidth;
        _internetFlow = internetFlow;
        _internetRX = internetRX;
        _internetTX = internetTX;
        _intranetBandwidth = intranetBandwidth;
        _intranetFlow = intranetFlow;
        _intranetRX = intranetRX;
        _intranetTX = intranetTX;
        _iopsRead = iopsRead;
        _iopsWrite = iopsWrite;
        _memory = memory;
        _timeStamp = [timeStamp retain];
    }
    return self;
}
@end
