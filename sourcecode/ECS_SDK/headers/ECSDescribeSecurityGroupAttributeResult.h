//
//  ECSDescribeSecurityGroupAttributeResult.h
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import <Foundation/Foundation.h>
#import "ECSResult.h"
/*
 <DescribeSecurityGroupAttributeResponse>
 <Description>test</Description>
 <SecurityGroupId>G30421467-d11c-4992-9d7d-ed8283fbf41a</SecurityGroupId>
 <Permissions>
 <Permission>
 <IpProtocol>TCP</IpProtocol>
 <NicType>internet</NicType>
 <Policy>Accept</Policy>
 <PortRange>1/65535</PortRange>
 <SourceCidrIp>0.0.0.0/0</SourceCidrIp>
 <SourceGroupId />
 </Permission>
 </Permissions>
 <RegionId>cn-qingdao-cm5-a01</RegionId>
 <RequestId>D1E6AB60-3009-44F3-8A2A-55598228F592</RequestId>
 </DescribeSecurityGroupAttributeResponse>
 */
@interface ECSDescribeSecurityGroupAttributeResult : ECSResult
{
    NSString * _description;
    NSString * _securityGroupId;
    NSArray  * _permissions;
}
@property(nonatomic,retain)NSString * description;
@property(nonatomic,retain)NSString * securityGroupId;
@property(nonatomic,retain)NSArray  * permissions;
-(id) initWithXMLData:(NSData *)data;
@end
