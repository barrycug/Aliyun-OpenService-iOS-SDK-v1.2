//
//  ECSPermission.h
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import <Foundation/Foundation.h>
#import "ECSBaseType.h"
/*
 <Permission>
 <IpProtocol>TCP</IpProtocol>
 <NicType>internet</NicType>
 <Policy>Accept</Policy>
 <PortRange>1/65535</PortRange>
 <SourceCidrIp>0.0.0.0/0</SourceCidrIp>
 <SourceGroupId />
 </Permission>
 */
@interface ECSPermission : NSObject
{
    ECSIpProtocolType _ipProtocolType;
    ECSNicType _nicType;
    NSString *_policy;
    NSString *_portRange;
    NSString *_sourceCidrIp;
    NSString *_sourceGroupId;
}
@property(nonatomic,assign)ECSIpProtocolType ipProtocolType;
@property(nonatomic,assign)ECSNicType nicType;
@property(nonatomic,retain)NSString *policy;
@property(nonatomic,retain)NSString *portRange;
@property(nonatomic,retain)NSString *sourceCidrIp;
@property(nonatomic,retain)NSString *sourceGroupId;
-(id) initWithIpProtocolType:(ECSIpProtocolType) ipProtocolType
                     nicType:(ECSNicType) nicType
                      policy:(NSString *)policy
                   portRange:(NSString *)portRange
                sourceCidrIp:(NSString *)sourceCidrIp
               sourceGroupId:(NSString *)sourceGroupId;
@end
