//
//  ECSInstanceMonitorData.h
//  samples_ios
//
//  Created by zhang baocai on 9/4/13.
//
//

#import <Foundation/Foundation.h>
/*
 <InstanceMonitorData>
 <BPSRead>0</BPSRead>
 <BPSWrite>2867</BPSWrite>
 <CPU>2</CPU>
 <InstanceId>AY130828101740048aee</InstanceId>
 <InternetBandwidth>2</InternetBandwidth>
 <InternetFlow>99</InternetFlow>
 <InternetRX>99</InternetRX>
 <InternetTX>0</InternetTX>
 <IntranetBandwidth>6</IntranetBandwidth>
 <IntranetFlow>370</IntranetFlow>
 <IntranetRX>370</IntranetRX>
 <IntranetTX>0</IntranetTX>
 <IOPSRead>0</IOPSRead>
 <IOPSWrite>0</IOPSWrite>
 <Memory>512</Memory>
 <TimeStamp>2013-09-04T04:58:24Z</TimeStamp>
 </InstanceMonitorData>
 </MonitorData>

 */
@interface ECSInstanceMonitorData : NSObject
{
    int _bpsRead;
    int _bpsWrite;
    int _cpu;
    NSString *_instanceId;
    int _internetBandwidth;
    int _internetFlow;
    int _internetRX;
    int _internetTX;
    int _intranetBandwidth;
    int _intranetFlow;
    int _intranetRX;
    int _intranetTX;
    int _iopsRead;
    int _iopsWrite;
    int _memory;
    NSString *_timeStamp;
}
@property(nonatomic,assign) int bpsRead;
@property(nonatomic,assign) int bpsWrite;
@property(nonatomic,assign) int cpu;
@property(nonatomic,retain) NSString *instanceId;
@property(nonatomic,assign) int internetBandwidth;
@property(nonatomic,assign) int internetFlow;
@property(nonatomic,assign) int internetRX;
@property(nonatomic,assign) int internetTX;
@property(nonatomic,assign) int intranetBandwidth;
@property(nonatomic,assign) int intranetFlow;
@property(nonatomic,assign) int intranetRX;
@property(nonatomic,assign) int intranetTX;
@property(nonatomic,assign) int iopsRead;
@property(nonatomic,assign) int iopsWrite;
@property(nonatomic,assign) int memory;
@property(nonatomic,retain) NSString *timeStamp;

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
           timeStamp:(NSString*)timeStamp;
@end
