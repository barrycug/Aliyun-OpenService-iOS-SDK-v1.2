//
//  ECSCreateSecurityGroupResult.h
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//
/*
<CreateSecurityGroupResponse>
<SecurityGroupId>Ga7a01b9f-0c45-4c71-9327-27a26a3879fe</SecurityGroupId>
<RequestId>6F028C0B-F411-427A-A93F-9E60A660C64B</RequestId>
</CreateSecurityGroupResponse>
 */
#import <Foundation/Foundation.h>
#import "ECSResult.h"
@interface ECSCreateSecurityGroupResult : ECSResult
{
    NSString * _securityGroupId;
}
@property(nonatomic,retain)NSString * securityGroupId;
-(id) initWithXMLData:(NSData *) data;
@end
