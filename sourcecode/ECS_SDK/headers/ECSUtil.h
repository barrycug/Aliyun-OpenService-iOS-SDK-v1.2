//
//  ECSUtil.h
//  samples_ios
//
//  Created by zhang baocai on 8/20/13.
//
//

#import <Foundation/Foundation.h>
#import "ECSBaseType.h"
@interface ECSUtil : NSObject
{
    
}
+(NSString*)stringFromBool:(BOOL) val;
+(NSString*)stringFromDiskType:(ECSDiskType) diskType;
+(ECSDiskType)stringToDiskType:(NSString*) strDiskType;
+(NSString*)stringFromIpProtocolType:(ECSIpProtocolType) ipProtocolType;
+(ECSIpProtocolType)stringToIpProtocolType:(NSString*) strIpProtocolType;
+(NSString*)stringFromNicType:(ECSNicType) nicType;
+(ECSNicType)stringToNicType:(NSString*) strNicType;
+(NSString*)stringFromInstanceStatusItemType:(ECSInstanceStatusItemType) instanceStatusItemType;
+(ECSInstanceStatusItemType)stringToInstanceStatusItemType:(NSString*) strInstanceStatusItemType;
+(NSString*)stringFromPolicyType:(ECSPolicyType) policyType;
+(ECSPolicyType)stringToPolicyType:(NSString*) strPolicyType;

@end
