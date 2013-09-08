//
//  ECSBaseType.h
//  samples_ios
//
//  Created by zhang baocai on 7/16/13.
//
//

#ifndef samples_ios_ECSBaseType_h
#define samples_ios_ECSBaseType_h

typedef enum eECSDiskType
{
    ECSDiskType_System=0,
    ECSDiskType_Data=1
}ECSDiskType;


typedef enum eECSIpProtocolType
{
    ECSIpProtocolType_TCP=0,
    ECSIpProtocolType_UDP=1,
    ECSIpProtocolType_ICMP=2,
    ECSIpProtocolType_GRE=3,
    ECSIpProtocolType_ALL=4
}ECSIpProtocolType;

typedef enum eECSNicType
{
    ECSNicType_Internet=0,
    ECSNicType_Intranet=1
}ECSNicType;

typedef enum eECSInstanceStatusItemType
{
    ECSInstanceStatusItemType_Stopped = 0,
    ECSInstanceStatusItemType_Starting = 1,
    ECSInstanceStatusItemType_Running = 2,
    ECSInstanceStatusItemType_Stopping = 3,
    ECSInstanceStatusItemType_Deleted = 4
}ECSInstanceStatusItemType;
typedef enum eECSPolicyType
{
    ECSPolicyType_Accecpt = 0,
    ECSPolicyType_Drop=1,
    ECSPolicyType_Reject=2
}ECSPolicyType;
#endif
