//
//  ECSFetchMonitorDataResult.h
//  samples_ios
//
//  Created by zhang baocai on 9/4/13.
//
//

#import "ECSResult.h"
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
@interface ECSFetchMonitorDataResult : ECSResult
{
    NSArray * _monitorData;
    int _pageNumber;
    int _pageSize;
    NSString * _regionId;
    NSString * _time;
    long _totalCount;
}
@property(nonatomic,retain)NSArray * monitorData;
@property(nonatomic,assign)int pageNumber;
@property(nonatomic,assign)int pageSize;
@property(nonatomic,retain)NSString * regionId;
@property(nonatomic,retain)NSString * time;
@property(nonatomic,assign)long totalCount;
-(id)initWithXMLData:(NSData *)data;
@end
