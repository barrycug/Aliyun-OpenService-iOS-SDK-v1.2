//
//  ECSClient.h
//  samples_ios
//
//  Created by zhang baocai on 7/8/13.
//
//

#import <Foundation/Foundation.h>
#import "ECSBaseType.h"
@class ECSClient;
@class ECSError;
@class ServiceCredentials;
@class DefaultServiceClient;
@class ECSInstanceOperation;
@class ECSDiskOperation;
@class ECSImageOperation;
@class ECSNetworkOperation;
@class ECSSecurityOperation;
@class ECSDataCenterOperation;
@class ECSMonitorOperation;
@class ECSOtherOperation;

@class ECSDescribeInstanceStatusResult;
@class ECSDescribeInstanceAttributeResult;
@class ECSDescribeInstanceDisksResult;
@class ECSDescribeImagesResult;
@class ECSAllocatePublicIpAddressResult;
@class ECSCreateSecurityGroupResult;
@class ECSDescribeSecurityGroupAttributeResult;
@class ECSDescribeSecurityGroupsResult;
@class ECSDescribeRegionsResult;
@class ECSDescribeZonesResult;
@class ECSFetchMonitorDataResult;
@class ECSDescribeInstanceTypeResult;

/**
 ECSClientDelegate
 */
@protocol ECSClientDelegate <NSObject>
@optional
/**
 网络错误响应
 @param client ECSClient
 @param error ECSError
 */
-(void) ECSClientNetworkError:(ECSClient*)client error:(ECSError*)error;

-(void) startInstanceFinished:(ECSClient*)client result:(NSString*)requestId;
-(void) startInstanceFailed:(ECSClient*)client error:(ECSError*)error;

-(void) stopInstanceFinished:(ECSClient*)client result:(NSString*)requestId;
-(void) stopInstanceFailed:(ECSClient*)client error:(ECSError*)error;

-(void) rebootInstanceFinished:(ECSClient*)client result:(NSString*)requestId;
-(void) rebootInstanceFailed:(ECSClient*)client error:(ECSError*)error;

-(void) resetInstanceFinished:(ECSClient*)client result:(NSString*)requestId;
-(void) resetInstanceFailed:(ECSClient*)client error:(ECSError*)error;

-(void)modifyInstanceAttributeFinished:(ECSClient*)client result:(NSString*)requestId;
-(void)modifyInstanceAttributeFailed:(ECSClient*)client error:(ECSError*)error;

-(void)describeInstanceStatusFinished:(ECSClient*)client result:(ECSDescribeInstanceStatusResult*)result;
-(void)describeInstanceStatusFailed:(ECSClient*)client error:(ECSError*)error;

-(void)describeInstanceAttributeFinished:(ECSClient*)client result:(ECSDescribeInstanceAttributeResult*)result;
-(void)describeInstanceAttributeFailed:(ECSClient*)client error:(ECSError*)error;

-(void) describeInstanceDisksFinished:(ECSClient*)client result:(ECSDescribeInstanceDisksResult*)result;
-(void) describeInstanceDisksFailed:(ECSClient*)client error:(ECSError*)error;

-(void) describeImagesFinished:(ECSClient*)client result:(ECSDescribeImagesResult*)result;
-(void) describeImagesFailed:(ECSClient*)client error:(ECSError*)error;

-(void) allocatePublicIpAddressFinished:(ECSClient*)client result:(ECSAllocatePublicIpAddressResult*)esult;

-(void) allocatePublicIpAddressFailed:(ECSClient*)client error:(ECSError*)error;

-(void) releasePublicIpAddressFinished:(ECSClient*)client result:(NSString*)requestId;
-(void) releasePublicIpAddressFailed:(ECSClient*)client error:(ECSError*)error;

-(void) createSecurityGroupFinished:(ECSClient*)client result:(ECSCreateSecurityGroupResult*)result;
-(void) createSecurityGroupFailed:(ECSClient*)client error:(ECSError*)error;

-(void) authorizeSecurityGroupFinished:(ECSClient*)client result:(NSString*)requestId;
-(void) authorizeSecurityGroupFailed:(ECSClient*)client error:(ECSError*)error;

-(void) describeSecurityGroupAttributeFinished:(ECSClient*)client result:(ECSDescribeSecurityGroupAttributeResult*)result;
-(void) describeSecurityGroupAttributeFailed:(ECSClient*)client error:(ECSError*)error;

-(void) describeSecurityGroupsFinished:(ECSClient*)client result:(ECSDescribeSecurityGroupsResult*)result;
-(void) describeSecurityGroupsFailed:(ECSClient*)client error:(ECSError*)error;

-(void) revokeSecurityGroupFinished:(ECSClient*)client result:(NSString*)requestId;
-(void) revokeSecurityGroupFailed:(ECSClient*)client error:(ECSError*)error;

-(void) deleteSecurityGroupFinished:(ECSClient*)client result:(NSString*)requestId;
-(void) deleteSecurityGroupFailed:(ECSClient*)client error:(ECSError*)error;


-(void) describeRegionsFinished:(ECSClient*)client result:(ECSDescribeRegionsResult*)result;
-(void) describeRegionsFailed:(ECSClient*)client error:(ECSError*)error;

-(void) describeZonesFinished:(ECSClient*)client result:(ECSDescribeZonesResult*)result;
-(void) describeZonesFailed:(ECSClient*)client error:(ECSError*)error;

-(void) fetchMonitorDataFinished:(ECSClient*)client result:(ECSFetchMonitorDataResult*)result;
-(void) fetchMonitorDataFailed:(ECSClient*)client error:(ECSError*)error;

-(void) describeInstanceTypesFinished:(ECSClient*)client result:(ECSDescribeInstanceTypeResult*)result;
-(void) describeInstanceTypesFailed:(ECSClient*)client error:(ECSError*)error;
@end
@interface ECSClient : NSObject
{
    @private
    NSString *_endpoint;
    ServiceCredentials *_credentials;
    DefaultServiceClient *_clientInstanceOp;
    DefaultServiceClient *_clientDiskOp;
    DefaultServiceClient *_clientImageOp;
    DefaultServiceClient *_clientNetworkOp;
    DefaultServiceClient *_clientSecurityOp;
    DefaultServiceClient *_clientDataCenterOp;
    DefaultServiceClient *_clientMonitorOp;
    DefaultServiceClient *_clientOtherOp;
    
    ECSInstanceOperation *_instanceOp;
    ECSDiskOperation *_diskOp;
    ECSImageOperation *_imageOp;
    ECSNetworkOperation *_networkOp;
    ECSSecurityOperation *_securityOp;
    ECSDataCenterOperation *_dataCenterOp;
    ECSMonitorOperation *_monitorOp;
    ECSOtherOperation *_otherOp;
    
    id<ECSClientDelegate> delegate;
}
/**
 ECSClientDelegate 代理对象
 */
@property(nonatomic,assign)id<ECSClientDelegate> delegate;

/**
 初始化方法
 @param accessID NSString
 @param accessKey NSString
 */
-(id) initWithAccessId:(NSString * ) accessID
          andAccessKey:(NSString * )accessKey;
/**
 初始化方法
 @param endpoint NSString
 @param accessID NSString
 @param accessKey NSString
 */
-(id) initWithEndPoint:(NSString * ) endpoint
              AccessId:(NSString * ) accessID
          andAccessKey:(NSString * )accessKey;

/**
 静态初始化方法 返回autorelease 对象
 @param accessID NSString
 @param accessKey NSString
 */
+(id) ECSClientWithAccessId:(NSString * ) accessID
               andAccessKey:(NSString * )accessKey;
/**
 静态初始化方法 返回autorelease 对象
 @param endpoint NSString
 @param accessID NSString
 @param accessKey NSString
 */
+(id) ECSClientWithEndPoint:(NSString * ) endpoint
                   AccessId:(NSString * ) accessID
               andAccessKey:(NSString * )accessKey;

/*************************************************************************************************
 * ECSInstanceOperation   ******
 ***************************************************************************************************/
/**
 启动实例
 @param instanceId NSString
 */
-(void)startInstance:(NSString*)instanceId;
/**
 关闭实例
 @param instanceId NSString
 */
-(void)stopInstance:(NSString*)instanceId;
/**
 停止实例，isForceStop 为YES时强制停止
 @param instanceId NSString
 @param isForceStop BOOL
 */
-(void)stopInstance:(NSString*)instanceId isForceStop:(BOOL)isForceStop;
/**
 重启实例
 @param instanceId NSString
 */
-(void)rebootInstance:(NSString*)instanceId;
/**
 重启实例，isForceStop 为YES时强制重启
 @param instanceId NSString
 @param isForceStop BOOL
 */
-(void)rebootInstance:(NSString*)instanceId isForceStop:(BOOL)isForceStop;
/**
 重置数据盘
 @param instanceId NSString
 */
-(void)resetInstanceDataDisk:(NSString*)instanceId;
/**
 重置操作系统
 @param instanceId NSString
 @param imageId NSString
 */
-(void)resetInstanceOS:(NSString*)instanceId imageId:(NSString*)imageId;

/**
 修改实例属性 password/hostName/securityGroupId 为nil的时候则不更改
 @param instanceId NSString
 @param password NSString
 @param hostName NSString
 @param securityGroupId NSString
 */
-(void)modifyInstanceAttributeWithInstanceId:(NSString*)instanceId password:(NSString*)password hostName:(NSString*)hostName securityGroupId:(NSString*)securityGroupId;
/**
 批量获取当前用户所有实例的状态信息
 pageNumber 实例状态列表的页码,起始值为 1,默认值为 1
 pageSize 分页查询时设置的每页行数,最大值 50 行,默认值 为 10
 @param regionId NSString
 @param zoneId NSString
 */
-(void)describeInstanceStatusWithRegionId:(NSString*)regionId zoneId:(NSString*)zoneId ;
/**
 *批量获取当前用户所有实例的状态信息
 *pageNumber 实例状态列表的页码,起始值为 1,默认值为 1
 *pageSize 分页查询时设置的每页行数,最大值 50 行,默认值 为 10
 @param regionId NSString
 @param zoneId NSString
 @param pageNumber int
 @param pageSize int
 */
-(void)describeInstanceStatusWithRegionId:(NSString*)regionId zoneId:(NSString*)zoneId pageNumber:(int)pageNumber pageSize:(int) pageSize;
/*
 获取实例属性信息
 @param instanceId NSString
 */
-(void)describeInstanceAttributeWithInstanceId:(NSString*)instanceId;


/*************************************************************************************************
 * ECSDiskOperation   ******
 ***************************************************************************************************/
/*
 获取实例硬盘使用信息
 @param instanceId NSString
 */
-(void)describeInstanceDisksWithInstanceId:(NSString*)instanceId;


/*************************************************************************************************
 * ECSImageOperation   ******
 ***************************************************************************************************/
/*
 获取区域内提供的映像信息
 @param regionId NSString
 */
-(void)describeImagesWithRegionId:(NSString*)regionId;
/*
 获取区域内提供的映像信息
 @param regionId NSString
 @param pageNumber int
 @param pageSize int
 */
-(void)describeImagesWithRegionId:(NSString*)regionId  pageNumber:(int)pageNumber pageSize:(int) pageSize;

/*************************************************************************************************
 * ECSNetworkOperation   ******
 ***************************************************************************************************/
/*
 分配公网ip，在实例状态位stopped下才可以使用
 @param instanceId NSString

 */
-(void)allocatePublicIpAddressWithInstanceId:(NSString*)instanceId;
/*
 释放公网ip，在实例状态位stopped下才可以使用
 @param instanceId NSString
 @param publicIpAddress NSString
 */
-(void)releasePublicIpAddressWithPublicIpAddress:(NSString*)publicIpAddress;

/*************************************************************************************************
 * ECSSecurityOperation   ******
 ***************************************************************************************************/
/*
 创建安全组
 @param regionId NSString
 @param description NSString
 */
-(void)createSecurityGroupWithRegionId:(NSString*)regionId description:(NSString*)description;

/*
 给安全组授权，具体授权配置请参考ECS API 说明文档
 @param securityGroupId NSString
 @param regionId NSString
 @param sourceGroupId NSString
 @param ipProtocol ECSIpProtocolType
 @param portRange NSString
 @param policy ECSPolicyType
 @param nicType ECSNicType
 */
-(void)authorizeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                        regionId:(NSString*)regionId
                                   sourceGroupId:(NSString*)sourceGroupId
                                      ipProtocol:(ECSIpProtocolType)ipProtocol
                                       portRange:(NSString*)portRange
                                          policy:(ECSPolicyType)policy
                                         nicType:(ECSNicType)nicType;
/*
 给安全组授权，具体授权配置请参考ECS API 说明文档
 @param securityGroupId NSString
 @param regionId NSString
 @param sourceCidrIp NSString
 @param ipProtocol ECSIpProtocolType
 @param portRange NSString
 @param policy ECSPolicyType
 @param nicType ECSNicType
 */
-(void)authorizeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                        regionId:(NSString*)regionId
                                    sourceCidrIp:(NSString*)sourceCidrIp
                                      ipProtocol:(ECSIpProtocolType)ipProtocol
                                       portRange:(ECSPolicyType)portRange
                                          policy:(NSString*)policy
                                         nicType:(ECSNicType)nicType;
/*
 获取安全组属性
 @param securityGroupId NSString
 @param regionId NSString
 */
-(void)describeSecurityGroupAttributeWithSecurityGroupId:(NSString*)securityGroupId
                                                regionId:(NSString*)regionId;
/*
 获取安全组属性
 @param securityGroupId NSString
 @param regionId NSString
 @param nicType ECSNicType
 */
-(void)describeSecurityGroupAttributeWithSecurityGroupId:(NSString*)securityGroupId
                                                regionId:(NSString*)regionId
                                                 nicType:(ECSNicType)nicType;
/*
 获取安全组属列表
 @param regionId NSString
 */
-(void)describeSecurityGroupsWithRegionId:(NSString*)regionId;
/*
 获取安全组属列表
 @param regionId NSString
 @param pageNumber int
 @param pageSize int
 */
-(void)describeSecurityGroupsWithRegionId:(NSString*)regionId
                               pageNumber:(int)pageNumber
                                 pageSize:(int) pageSize;
/*
 回收安全组授权，具体授权配置请参考ECS API 说明文档
 @param securityGroupId NSString
 @param regionId NSString
 @param sourceGroupId NSString
 @param ipProtocol ECSIpProtocolType
 @param portRange NSString
 @param policy ECSPolicyType
 @param nicType ECSNicType
 */
-(void)revokeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                     regionId:(NSString*)regionId
                                sourceGroupId:(NSString*)sourceGroupId
                                   ipProtocol:(ECSIpProtocolType)ipProtocol
                                    portRange:(NSString*)portRange
                                       policy:(ECSPolicyType)policy
                                      nicType:(ECSNicType)nicType;
/*
 回收安全组授权，具体授权配置请参考ECS API 说明文档
 @param securityGroupId NSString
 @param regionId NSString
 @param sourceCidrIp NSString
 @param ipProtocol ECSIpProtocolType
 @param portRange NSString
 @param policy ECSPolicyType
 @param nicType ECSNicType
 */
-(void)revokeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                     regionId:(NSString*)regionId
                                 sourceCidrIp:(NSString*)sourceCidrIp
                                   ipProtocol:(ECSIpProtocolType)ipProtocol
                                    portRange:(NSString*)portRange
                                       policy:(ECSPolicyType)policy
                                      nicType:(ECSNicType)nicType;
/*
 删除安全组
 @param securityGroupId NSString
 @param regionId NSString
 */
-(void)deleteSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                     regionId:(NSString*)regionId;


/*************************************************************************************************
 * ECSDataCenterOperation   ******
 ***************************************************************************************************/
/*
 获取数据中心节点
 */
-(void)describeRegions;
/*
 获取数据中心中的Zone信息
 @param regionId NSString
 */
-(void)describeZonesWithRegionId:(NSString*)regionId;

/*************************************************************************************************
 * ECSDataCenterOperation   ******
 ***************************************************************************************************/
/*
 获取数据中心中（你所有的）所有机器的监控信息
 @param regionId NSString
 */
-(void)fetchMonitorDataWithRegionId:(NSString*)regionId;
/*
 获取数据中心中一台机器的监控信息
 @param regionId NSString
 @param instanceId NSString
 */
-(void)fetchMonitorDataWithRegionId:(NSString*)regionId instanceId:(NSString*)instanceId;


/*************************************************************************************************
 * ECSOtherOperation   ******
 ***************************************************************************************************/
/*
 获取机器配置类型
 */
-(void)describeInstanceTypes;


@end
