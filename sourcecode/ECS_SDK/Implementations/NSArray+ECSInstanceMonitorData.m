//
//  NSArray+ECSInstanceMonitorData.m
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import "NSArray+ECSInstanceMonitorData.h"
#import "TBXML.h"
#import "ECSInstanceMonitorData.h"
/*
 <GetMonitorDataResponse>
 <MonitorData>
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
 <PageNumber>1</PageNumber>
 <PageSize>10</PageSize>
 <RegionID>cn-qingdao-cm5-a01</RegionID>
 <Time>2013-09-04T05:27:24Z</Time>
 <TotalCount>1</TotalCount>
 <RequestId>4A9254EB-984C-43F6-9C36-D57C852940F0</RequestId>
 </GetMonitorDataResponse>
 */
@implementation NSArray (ECSInstanceMonitorData)
-(id)initWithECSMonitorDataXMLData:(NSData*)data
{
    NSMutableArray * innerArray =[[NSMutableArray alloc] initWithCapacity:5];
    if (data != nil)
    {
        TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
        TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
        if (rootXMLElement != NULL) {
            
            TBXMLElement *monitorDataXMLElement = [TBXML childElementNamed:@"MonitorData" parentElement: rootXMLElement];
            if (monitorDataXMLElement != NULL) {
                TBXMLElement *instanceMonitorDataXMLElement = [TBXML childElementNamed:@"InstanceMonitorData" parentElement:monitorDataXMLElement];
                while (instanceMonitorDataXMLElement != NULL) {
                    int bpsRead = 0;
                    int bpsWrite = 0;
                    int cpu = 0;
                    NSString *instanceId = @"";
                    int internetBandwidth = 0;
                    int internetFlow = 0;
                    int internetRX = 0;
                    int internetTX = 0;
                    int intranetBandwidth = 0;
                    int intranetFlow = 0;
                    int intranetRX = 0;
                    int intranetTX = 0;
                    int iopsRead = 0;
                    int iopsWrite = 0;
                    int memory = 0;
                    NSString *timeStamp = @"";
                    TBXMLElement *bpsReadXMLElement = [TBXML childElementNamed:@"BPSRead" parentElement:instanceMonitorDataXMLElement];
                    if (bpsReadXMLElement != NULL) {
                        bpsRead = [[TBXML textForElement:bpsReadXMLElement] intValue];
                    }
                    
                    TBXMLElement *bpsWriteReadXMLElement = [TBXML childElementNamed:@"BPSWrite" parentElement:instanceMonitorDataXMLElement];
                    if (bpsWriteReadXMLElement != NULL) {
                        bpsWrite = [[TBXML textForElement:bpsWriteReadXMLElement] intValue];
                    }
                    
                    TBXMLElement *cpuXMLElement = [TBXML childElementNamed:@"CPU" parentElement:instanceMonitorDataXMLElement];
                    if (cpuXMLElement != NULL) {
                        cpu = [[TBXML textForElement:cpuXMLElement] intValue];
                    }
                    
                    TBXMLElement *instanceIdXMLElement = [TBXML childElementNamed:@"InstanceId" parentElement:instanceMonitorDataXMLElement];
                    if (instanceIdXMLElement != NULL) {
                        instanceId = [TBXML textForElement:instanceIdXMLElement];
                    }
                    
                    TBXMLElement *internetBandwidthXMLElement = [TBXML childElementNamed:@"InternetBandwidth" parentElement:instanceMonitorDataXMLElement];
                    if (internetBandwidthXMLElement != NULL) {
                        internetBandwidth = [[TBXML textForElement:internetBandwidthXMLElement] intValue];
                    }
                    
                    TBXMLElement *internetFlowXMLElement = [TBXML childElementNamed:@"InternetFlow" parentElement:instanceMonitorDataXMLElement];
                    if (internetFlowXMLElement != NULL) {
                        internetFlow = [[TBXML textForElement:internetFlowXMLElement] intValue];
                    }
                    
                    TBXMLElement *internetRXXMLElement = [TBXML childElementNamed:@"InternetRX" parentElement:instanceMonitorDataXMLElement];
                    if (internetRXXMLElement != NULL) {
                        internetRX = [[TBXML textForElement:internetRXXMLElement] intValue];
                    }
                    
                    TBXMLElement *internetTXXMLElement = [TBXML childElementNamed:@"InternetTX" parentElement:instanceMonitorDataXMLElement];
                    if (internetTXXMLElement != NULL) {
                        internetTX = [[TBXML textForElement:internetTXXMLElement] intValue];
                    }
                    TBXMLElement *intranetBandwidthXMLElement = [TBXML childElementNamed:@"IntranetBandwidth" parentElement:instanceMonitorDataXMLElement];
                    if (intranetBandwidthXMLElement != NULL) {
                        intranetBandwidth = [[TBXML textForElement:intranetBandwidthXMLElement] intValue];
                    }
                    
                    TBXMLElement *intranetFlowXMLElement = [TBXML childElementNamed:@"IntranetFlow" parentElement:instanceMonitorDataXMLElement];
                    if (intranetFlowXMLElement != NULL) {
                        intranetFlow = [[TBXML textForElement:intranetFlowXMLElement] intValue];
                    }
                    
                    TBXMLElement *intranetRXXMLElement = [TBXML childElementNamed:@"IntranetRX" parentElement:instanceMonitorDataXMLElement];
                    if (intranetRXXMLElement != NULL) {
                        intranetRX = [[TBXML textForElement:intranetRXXMLElement] intValue];
                    }
                    
                    TBXMLElement *intranetTXXMLElement = [TBXML childElementNamed:@"IntranetTX" parentElement:instanceMonitorDataXMLElement];
                    if (intranetTXXMLElement != NULL) {
                        intranetTX = [[TBXML textForElement:intranetTXXMLElement] intValue];
                    }
                    
                    TBXMLElement *iopsReadXMLElement = [TBXML childElementNamed:@"IOPSRead" parentElement:instanceMonitorDataXMLElement];
                    if (iopsReadXMLElement != NULL) {
                        iopsRead = [[TBXML textForElement:iopsReadXMLElement] intValue];
                    }
                    TBXMLElement *iopsWriteXMLElement = [TBXML childElementNamed:@"IOPSWrite" parentElement:instanceMonitorDataXMLElement];
                    if (iopsWriteXMLElement != NULL) {
                        iopsWrite = [[TBXML textForElement:iopsWriteXMLElement] intValue];
                    }
                    TBXMLElement *memoryXMLElement = [TBXML childElementNamed:@"Memory" parentElement:instanceMonitorDataXMLElement];
                    if (memoryXMLElement != NULL) {
                        memory = [[TBXML textForElement:memoryXMLElement] intValue];
                    }
                    TBXMLElement *timeStampXMLElement = [TBXML childElementNamed:@"TimeStamp" parentElement:instanceMonitorDataXMLElement];
                    if (timeStampXMLElement != NULL) {
                        timeStamp = [TBXML textForElement:timeStampXMLElement];
                    }
                    ECSInstanceMonitorData * monitorData = [[ECSInstanceMonitorData alloc]
                                                            initWithBPSRead:bpsRead
                                                            bpsWrite:bpsWrite
                                                            cpu:cpu
                                                            instanceId:instanceId
                                                            internetBandwidth:internetBandwidth
                                                            internetFlow:internetFlow
                                                            internetRX:internetRX
                                                            internetTX:internetTX
                                                            intranetBandwidth:intranetBandwidth
                                                            intranetFlow:intranetFlow
                                                            intranetRX:intranetRX
                                                            intranetTX:intranetTX
                                                            iopsRead:iopsRead
                                                            iopsWrite:iopsWrite
                                                            memory:memory
                                                            timeStamp:timeStamp];
                    [innerArray addObject:monitorData];
                    [monitorData release];
                    instanceMonitorDataXMLElement = instanceMonitorDataXMLElement->nextSibling;
                }
                
            }
            
        }
        [tbxml release];
        tbxml = nil;
    }
    
    if(self = [self initWithArray:innerArray ])
    {
        ;
    }
    [innerArray release];
    return self;
}
@end
