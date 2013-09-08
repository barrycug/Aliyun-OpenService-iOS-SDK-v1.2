//
//  ECSUtil.m
//  samples_ios
//
//  Created by zhang baocai on 8/20/13.
//
//

#import "ECSUtil.h"

@implementation ECSUtil
+(NSString*)stringFromBool:(BOOL) val
{
    if (val) {
        return @"true";
    }
    else
    {
        return @"false";
    }
}
+(NSString*)stringFromDiskType:(ECSDiskType) diskType
{
    NSString * rtnString = @"";
    switch (diskType) {
        case ECSDiskType_System:
            rtnString = @"system";
            break;
        case ECSDiskType_Data:
            rtnString = @"data";
            break;
        default:
            break;
    }
    return rtnString;
}
+(ECSDiskType)stringToDiskType:(NSString*) strDiskType
{
    NSString * strLowDiskType = [strDiskType lowercaseString];
    ECSDiskType type = ECSDiskType_System;
    if ([strLowDiskType isEqualToString:@"data"]) {
        type = ECSDiskType_Data;
    }
    else if([strLowDiskType isEqualToString:@"system"])
    {
        type = ECSDiskType_System;
    }
    return type;
}
+(NSString*)stringFromIpProtocolType:(ECSIpProtocolType) ipProtocolType
{
    NSString * rtnString = @"";
    switch (ipProtocolType) {
        case ECSIpProtocolType_TCP:
        {
            rtnString = @"tcp";
        }
            break;
        case ECSIpProtocolType_UDP:
        {
            rtnString = @"udp";
        }
            break;
        case ECSIpProtocolType_ICMP:
        {
            rtnString = @"icmp";
        }
            break;
        case ECSIpProtocolType_GRE:
        {
            rtnString = @"gre";
        }
            break;
        case ECSIpProtocolType_ALL:
        {
            rtnString = @"all";
        }
            break;
            
        default:
            break;
    }
    return rtnString;
}
+(ECSIpProtocolType)stringToIpProtocolType:(NSString*) strIpProtocolType
{
    NSString * strlIpProtocolType = [strIpProtocolType lowercaseString];
    ECSIpProtocolType type = ECSIpProtocolType_TCP;
    if ([strlIpProtocolType isEqualToString:@"udp"]) {
        type = ECSIpProtocolType_UDP;
    }
    else if ([strlIpProtocolType isEqualToString:@"tcp"]) {
        type = ECSIpProtocolType_TCP;
    }
    else if ([strlIpProtocolType isEqualToString:@"icmp"]) {
        type = ECSIpProtocolType_ICMP;
    }
    else if ([strlIpProtocolType isEqualToString:@"gre"]) {
        type = ECSIpProtocolType_GRE;
    }
    else if ([strlIpProtocolType isEqualToString:@"all"]) {
        type = ECSIpProtocolType_ALL;
    }
    return type;
}
+(NSString*)stringFromNicType:(ECSNicType) nicType
{
    NSString * rtnString = @"";
    switch (nicType) {
        case ECSNicType_Internet:
            rtnString = @"internet";
            break;
        case ECSNicType_Intranet:
            rtnString = @"intranet";
            break;
        default:
            break;
    }
    return rtnString;
}


+(ECSNicType)stringToNicType:(NSString*) strNicType
{
    NSString * strlNicType = [strNicType lowercaseString];
    ECSNicType type = ECSNicType_Internet;
    if ([strlNicType isEqualToString:@"internet"]) {
        type = ECSNicType_Internet;
    }
    else if ([strlNicType isEqualToString:@"intranet"]) {
        type = ECSNicType_Intranet;
    }
    return type;

}
+(NSString*)stringFromInstanceStatusItemType:(ECSInstanceStatusItemType) instanceStatusItemType
{
     NSString * rtnString = @"";
    switch(instanceStatusItemType)
    {
        case ECSInstanceStatusItemType_Stopped :
        {
            rtnString = @"Stopped";
        }
            break;
        case ECSInstanceStatusItemType_Starting :
        {
             rtnString = @"Starting";
        }
            break;
        case ECSInstanceStatusItemType_Running :
        {
             rtnString = @"Running";
        }
            break;
        case ECSInstanceStatusItemType_Stopping :
        {
             rtnString = @"Stopping";
        }
            break;
        case ECSInstanceStatusItemType_Deleted :
        {
             rtnString = @"Deleted";
        }
            break;
        default:
            break;
    }
    return rtnString;
}
+(ECSInstanceStatusItemType)stringToInstanceStatusItemType:(NSString*) strInstanceStatusItemType
{
    NSString * strStatus = [strInstanceStatusItemType lowercaseString];
    ECSInstanceStatusItemType type = ECSInstanceStatusItemType_Stopped;
    if ([strStatus isEqualToString:@"stopped"]) {
        type = ECSInstanceStatusItemType_Stopped;
    }
    else if ([strStatus isEqualToString:@"starting"]) {
        type = ECSInstanceStatusItemType_Starting;
    }
    else if ([strStatus isEqualToString:@"running"]) {
        type = ECSInstanceStatusItemType_Running;
    }
    else if ([strStatus isEqualToString:@"stopping"]) {
        type = ECSInstanceStatusItemType_Stopping;
    }
    else if ([strStatus isEqualToString:@"deleted"]) {
        type = ECSInstanceStatusItemType_Deleted;
    }
    return type;
}
+(NSString*)stringFromPolicyType:(ECSPolicyType) policyType
{
    NSString * rtnString = @"";
    switch (policyType) {
        case ECSPolicyType_Accecpt:
            rtnString = @"accept";
            break;
        case ECSPolicyType_Drop:
            rtnString = @"drop";
            break;
        case ECSPolicyType_Reject:
            rtnString = @"reject";
            break;
        default:
            break;
    }
    return rtnString;

}
+(ECSPolicyType)stringToPolicyType:(NSString*) strPolicyType
{
    NSString * strlPolicyType = [strPolicyType lowercaseString];
    ECSPolicyType type = ECSPolicyType_Accecpt;
    if ([strlPolicyType isEqualToString:@"accept"]) {
        type = ECSPolicyType_Accecpt;
    }
    else  if ([strlPolicyType isEqualToString:@"drop"]) {
        type = ECSPolicyType_Drop;
    }
    else  if ([strlPolicyType isEqualToString:@"reject"]) {
        type = ECSPolicyType_Reject;
    }
    return type;
}
@end
