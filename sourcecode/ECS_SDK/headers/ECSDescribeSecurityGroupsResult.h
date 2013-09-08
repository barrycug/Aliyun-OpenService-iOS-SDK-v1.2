//
//  ECSDescribeSecurityGroupsResult.h
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import <Foundation/Foundation.h>
#import "ECSResult.h"
/*
 <DescribeSecurityGroupsResponse>
 <SecurityGroups>
 
 </SecurityGroups>
 <PageNumber>1</PageNumber>
 <PageSize>10</PageSize>
 <RegionId>cn-qingdao-cm5-a01</RegionId>
 <TotalCount>8</TotalCount>
 <RequestId>707C29F9-B857-4E55-AE3D-AD360F5624C8</RequestId>
 </DescribeSecurityGroupsResponse>
*/
@interface ECSDescribeSecurityGroupsResult : ECSResult
{
    NSArray * _securityGroups;
    int _pageNumber;
    int _pageSize;
    NSString * _regionId;
    long _totalCount;
}
@property(nonatomic,retain)NSArray * securityGroups;
@property(nonatomic,assign)int pageNumber;
@property(nonatomic,assign)int pageSize;
@property(nonatomic,retain)NSString * regionId;
@property(nonatomic,assign)long totalCount;
-(id)initWithXMLData:(NSData *)data;


@end
