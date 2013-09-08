//
//  DescribeInstanceStatusResult.h
//  samples_ios
//
//  Created by zhang baocai on 9/1/13.
//
//

#import <Foundation/Foundation.h>
#import "ECSResult.h"
/*
 <DescribeInstanceStatusResponse>
 <PageNumber>1</PageNumber>
 <PageSize>10</PageSize>
 <TotalCount>1</TotalCount>
 <InstanceStatuses>
 <InstanceStatus>
 <InstanceId>AY130828101740048aee</InstanceId>
 <Status>Running</Status>
 </InstanceStatus>
 </InstanceStatuses>
 <RequestId>E22BB08F-393F-45C6-BDAD-9FD7B39637F2</RequestId>
 </DescribeInstanceStatusResponse>
 */
@interface ECSDescribeInstanceStatusResult : ECSResult
{
@private
    NSArray * _instanceStatuses;
    int _pageNumber;
    int _pageSize;
    int _totalCount;
}
@property(nonatomic,retain)NSArray *instanceStatuses;
@property(nonatomic,assign)int pageNumber;
@property(nonatomic,assign)int pageSize;
@property(nonatomic,assign)int totalCount;
-(id)initWithXMLData:(NSData*)data;
@end
