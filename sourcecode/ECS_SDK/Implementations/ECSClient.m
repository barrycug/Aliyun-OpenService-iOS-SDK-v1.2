//
//  ECSClient.m
//  samples_ios
//
//  Created by zhang baocai on 7/8/13.
//
//

#import "ECSClient.h"
#import "ECSOperation.h"
#import "ServiceCredentials.h"
#import "ClientConfiguration.h"
#import "DefaultServiceClient.h"
#import "ECSInstanceOperation.h"
#import "ECSDiskOperation.h"
#import "ECSImageOperation.h"
#import "ECSMonitorOperation.h"
#import "ECSDataCenterOperation.h"
#import "ECSSecurityOperation.h"
#import "ECSNetworkOperation.h"
#import "ECSOtherOperation.h"

@interface ECSClient()<ECSInstanceOperationDelegate,ECSImageOperationDelegate,ECSNetworkOperationDelegate,ECSMonitorOperationDelegate,ECSOtherOperationDelegate,ECSDiskOperationDelegate,ECSDataCenterOperationDelegate,ECSSecurityOperationDelegate>
@end
@implementation ECSClient
@synthesize delegate;
-(void)dealloc
{
    [_endpoint release];
    _endpoint = nil;
    [_credentials release];
    _credentials = nil;
    [_clientInstanceOp release];
    _clientInstanceOp =nil;
    [_clientDiskOp release];
    _clientDiskOp = nil;
    [_clientImageOp release];
    _clientImageOp = nil;
    [_clientNetworkOp release];
    _clientNetworkOp = nil;
    [_clientSecurityOp release];
    _clientSecurityOp = nil;
    [_clientDataCenterOp release];
    _clientDataCenterOp = nil;
    [_clientMonitorOp release];
    _clientMonitorOp = nil;
    [_clientOtherOp release];
    _clientOtherOp = nil;
    
    [_instanceOp release];
    _instanceOp = nil;
    [_diskOp release];
    _diskOp = nil;
    [_imageOp release];
    _imageOp = nil;
    [_networkOp release];
    _networkOp = nil;
    [_securityOp release];
    _securityOp = nil;
    [_dataCenterOp release];
    _dataCenterOp = nil;
    [_monitorOp release];
    _monitorOp = nil;
    [_otherOp release];
    _otherOp = nil;

    [super dealloc];
}
-(id)init
{
    if (self = [self initWithEndPoint:@"http://ecs.aliyuncs.com" AccessId:@"" andAccessKey:@"" ]) {
        ;
    }
    return self;
}
/**
 初始化方法
 @param accessID NSString
 @param accessKey NSString
 */
-(id) initWithAccessId:(NSString * ) accessID
          andAccessKey:(NSString * )accessKey
{
    return [self initWithEndPoint:@"http://ecs.aliyuncs.com" AccessId:accessID andAccessKey:accessKey ] ;
}
/**
 初始化方法
 @param endpoint NSString
 @param accessID NSString
 @param accessKey NSString
 */
-(id) initWithEndPoint:(NSString * ) endpoint
              AccessId:(NSString * ) accessID
          andAccessKey:(NSString * )accessKey
{
    if (self = [super init]) {
        _endpoint = [endpoint retain];
        _credentials = [[ServiceCredentials alloc] initWithAccessId:accessID andAccessKey:accessKey];
        ClientConfiguration *config = [ClientConfiguration clientConfiguration];
        
        _clientInstanceOp = [[DefaultServiceClient alloc] initWithClientConfiguration:config ];
        _instanceOp = [[ECSInstanceOperation alloc] initWithEndPoint:_endpoint credentials:_credentials client:_clientInstanceOp];
        _instanceOp.delegate = self;
            
        _clientDiskOp = [[DefaultServiceClient alloc] initWithClientConfiguration:config ];
        _diskOp = [[ECSDiskOperation alloc] initWithEndPoint:_endpoint credentials:_credentials client:_clientDiskOp];
        _diskOp.delegate = self;
        
        _clientImageOp = [[DefaultServiceClient alloc] initWithClientConfiguration:config ];
        _imageOp = [[ECSImageOperation alloc] initWithEndPoint:_endpoint credentials:_credentials client:_clientImageOp];
        _imageOp.delegate = self;
        
        _clientNetworkOp = [[DefaultServiceClient alloc] initWithClientConfiguration:config ];
        _networkOp = [[ECSNetworkOperation alloc] initWithEndPoint:_endpoint credentials:_credentials client:_clientNetworkOp];
        _networkOp.delegate = self;
        
        
        _clientSecurityOp = [[DefaultServiceClient alloc] initWithClientConfiguration:config ];
        _securityOp = [[ECSSecurityOperation alloc] initWithEndPoint:_endpoint credentials:_credentials client:_clientSecurityOp];
        _securityOp.delegate = self;
        
        
        _clientDataCenterOp = [[DefaultServiceClient alloc] initWithClientConfiguration:config ];
        _dataCenterOp = [[ECSDataCenterOperation alloc] initWithEndPoint:_endpoint credentials:_credentials client:_clientDataCenterOp];
        _dataCenterOp.delegate = self;
        
  
        _clientMonitorOp = [[DefaultServiceClient alloc] initWithClientConfiguration:config ];
        _monitorOp = [[ECSMonitorOperation alloc] initWithEndPoint:_endpoint credentials:_credentials client:_clientMonitorOp];
        _monitorOp.delegate = self;
        
        _clientOtherOp = [[DefaultServiceClient alloc] initWithClientConfiguration:config ];
        _otherOp = [[ECSOtherOperation alloc] initWithEndPoint:_endpoint credentials:_credentials client:_clientOtherOp];
        _otherOp.delegate = self;
    }
    return self;
}

/**
 静态初始化方法 返回autorelease 对象
 @param accessID NSString
 @param accessKey NSString
 */
+(id) ECSClientWithAccessId:(NSString * ) accessID
               andAccessKey:(NSString * )accessKey
{
    return  [[[ECSClient alloc] initWithAccessId:accessID andAccessKey:accessKey] autorelease];
}
/**
 静态初始化方法 返回autorelease 对象
 @param endpoint NSString
 @param accessID NSString
 @param accessKey NSString
 */
+(id) ECSClientWithEndPoint:(NSString * ) endpoint
                   AccessId:(NSString * ) accessID
               andAccessKey:(NSString * )accessKey
{
    return  [[[ECSClient alloc] initWithEndPoint:endpoint AccessId:accessID andAccessKey:accessKey] autorelease];
}

#pragma mark ECSInstanceOperation
/*************************************************************************************************
 * ECSInstanceOperation   ******
 ***************************************************************************************************/
-(void)startInstance:(NSString*)instanceId
{
    [_instanceOp startInstance:instanceId];
}

-(void)stopInstance:(NSString*)instanceId
{
    [_instanceOp stopInstance:instanceId];
}

-(void)stopInstance:(NSString*)instanceId isForceStop:(BOOL)isForceStop
{
    [_instanceOp stopInstance:instanceId isForceStop:isForceStop];
}

-(void)rebootInstance:(NSString*)instanceId
{
    [_instanceOp rebootInstance:instanceId];
}

-(void)rebootInstance:(NSString*)instanceId isForceStop:(BOOL)isForceStop
{
    [_instanceOp rebootInstance:instanceId isForceStop:isForceStop];
}
-(void)resetInstanceDataDisk:(NSString*)instanceId
{
    [_instanceOp resetInstanceDataDisk:instanceId];
}

-(void)resetInstanceOS:(NSString*)instanceId imageId:(NSString*)imageId
{
    [_instanceOp resetInstanceOS:instanceId imageId:imageId];
}
/**
 *imageId:重置系统时使用的镜像 ID。仅在 DiskType 参数 值为 system 时有效
 */
-(void)resetInstance:(NSString*)instanceId imageId:(NSString*)imageId diskType:(ECSDiskType)diskType
{
    [_instanceOp resetInstance:instanceId imageId:imageId diskType:diskType];
}


/**
 * 修改实例属性 password/hostName/securityGroupId 为nil的时候则不更改
 */
-(void)modifyInstanceAttributeWithInstanceId:(NSString*)instanceId password:(NSString*)password hostName:(NSString*)hostName securityGroupId:(NSString*)securityGroupId
{
    [_instanceOp modifyInstanceAttributeWithInstanceId:instanceId password:password hostName:hostName securityGroupId:securityGroupId];
}

/**
 *批量获取当前用户所有实例的状态信息
 *pageNumber 实例状态列表的页码,起始值为 1,默认值为 1
 *pageSize 分页查询时设置的每页行数,最大值 50 行,默认值 为 10
 */
-(void)describeInstanceStatusWithRegionId:(NSString*)regionId zoneId:(NSString*)zoneId
{
    [_instanceOp describeInstanceStatusWithRegionId:regionId zoneId:zoneId];
}

-(void)describeInstanceStatusWithRegionId:(NSString*)regionId zoneId:(NSString*)zoneId pageNumber:(int)pageNumber pageSize:(int) pageSize
{
    [_instanceOp describeInstanceStatusWithRegionId:regionId zoneId:zoneId pageNumber:pageNumber pageSize:pageSize];
}

/*
 *获取实例列表
 */
-(void)describeInstanceAttributeWithInstanceId:(NSString*)instanceId
{
    [_instanceOp describeInstanceAttributeWithInstanceId:instanceId];
}


#pragma mark ECSDiskOperation
/*************************************************************************************************
 * ECSDiskOperation   ******
 ***************************************************************************************************/
-(void)describeInstanceDisksWithInstanceId:(NSString*)instanceId
{
    [_diskOp describeInstanceDisksWithInstanceId:instanceId];
}


#pragma mark ECSImageOperation
/*************************************************************************************************
 * ECSImageOperation   ******
 ***************************************************************************************************/

-(void)describeImagesWithRegionId:(NSString*)regionId
{
    [_imageOp describeImagesWithRegionId:regionId];
}

-(void)describeImagesWithRegionId:(NSString*)regionId  pageNumber:(int)pageNumber pageSize:(int) pageSize
{
    [_imageOp describeImagesWithRegionId:regionId pageNumber:pageNumber pageSize:pageSize];
}

#pragma mark ECSNetworkOperation
/*************************************************************************************************
 * ECSNetworkOperation   ******
 ***************************************************************************************************/
-(void)allocatePublicIpAddressWithInstanceId:(NSString*)instanceId
{
    [_networkOp allocatePublicIpAddressWithInstanceId:instanceId];
}

-(void)releasePublicIpAddressWithPublicIpAddress:(NSString*)publicIpAddress
{
    [_networkOp releasePublicIpAddressWithPublicIpAddress:publicIpAddress];
}

#pragma mark ECSSecurityOperation
/*************************************************************************************************
 * ECSSecurityOperation   ******
 ***************************************************************************************************/

-(void)createSecurityGroupWithRegionId:(NSString*)regionId description:(NSString*)description
{
    [_securityOp createSecurityGroupWithRegionId:regionId description:description];
}

-(void)authorizeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                        regionId:(NSString*)regionId
                                   sourceGroupId:(NSString*)sourceGroupId
                                      ipProtocol:(ECSIpProtocolType)ipProtocol
                                       portRange:(NSString*)portRange
                                          policy:(ECSPolicyType)policy
                                         nicType:(ECSNicType)nicType
{
    [_securityOp authorizeSecurityGroupWithSecurityGroupId:securityGroupId
                                                  regionId:regionId
                                             sourceGroupId:sourceGroupId
                                                ipProtocol:ipProtocol
                                                 portRange:portRange
                                                    policy:policy
                                                   nicType:nicType];
}
-(void)authorizeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                        regionId:(NSString*)regionId
                                    sourceCidrIp:(NSString*)sourceCidrIp
                                      ipProtocol:(ECSIpProtocolType)ipProtocol
                                       portRange:(ECSPolicyType)portRange
                                          policy:(NSString*)policy
                                         nicType:(ECSNicType)nicType
{
    [_securityOp authorizeSecurityGroupWithSecurityGroupId:securityGroupId
                                                  regionId:regionId
                                              sourceCidrIp:sourceCidrIp
                                                ipProtocol:ipProtocol
                                                 portRange:portRange                              
                                                    policy:policy
                                                   nicType:nicType];
}



-(void)describeSecurityGroupAttributeWithSecurityGroupId:(NSString*)securityGroupId
                                                regionId:(NSString*)regionId
{
    [_securityOp describeSecurityGroupAttributeWithSecurityGroupId:securityGroupId regionId:regionId];
}
-(void)describeSecurityGroupAttributeWithSecurityGroupId:(NSString*)securityGroupId
                                                regionId:(NSString*)regionId
                                                 nicType:(ECSNicType)nicType
{
    [_securityOp describeSecurityGroupAttributeWithSecurityGroupId:securityGroupId
                                                          regionId:regionId
                                                           nicType:nicType];
}


-(void)describeSecurityGroupsWithRegionId:(NSString*)regionId
{
    [_securityOp describeSecurityGroupsWithRegionId:regionId];
}
-(void)describeSecurityGroupsWithRegionId:(NSString*)regionId
                               pageNumber:(int)pageNumber
                                 pageSize:(int) pageSize
{
    [_securityOp describeSecurityGroupsWithRegionId:regionId
                                         pageNumber:pageNumber
                                           pageSize:pageSize];
}


-(void)revokeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                     regionId:(NSString*)regionId
                                sourceGroupId:(NSString*)sourceGroupId
                                   ipProtocol:(ECSIpProtocolType)ipProtocol
                                    portRange:(NSString*)portRange
                                       policy:(ECSPolicyType)policy
                                      nicType:(ECSNicType)nicType
{
    [_securityOp revokeSecurityGroupWithSecurityGroupId:securityGroupId
                                               regionId:regionId
                                          sourceGroupId:sourceGroupId
                                             ipProtocol:ipProtocol
                                              portRange:portRange
                                                 policy:policy
                                                nicType:nicType];
}
-(void)revokeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                     regionId:(NSString*)regionId
                                 sourceCidrIp:(NSString*)sourceCidrIp
                                   ipProtocol:(ECSIpProtocolType)ipProtocol
                                    portRange:(NSString*)portRange
                                       policy:(ECSPolicyType)policy
                                      nicType:(ECSNicType)nicType
{
    [_securityOp revokeSecurityGroupWithSecurityGroupId:securityGroupId
                                               regionId:regionId
                                           sourceCidrIp:sourceCidrIp
                                             ipProtocol:ipProtocol
                                              portRange:portRange
                                                 policy:policy
                                                nicType:nicType];

}

-(void)deleteSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                     regionId:(NSString*)regionId
{
    [_securityOp deleteSecurityGroupWithSecurityGroupId:securityGroupId regionId:regionId];
}


#pragma mark ECSDataCenterOperation
/*************************************************************************************************
 * ECSDataCenterOperation   ******
 ***************************************************************************************************/
-(void)describeRegions
{
    [_dataCenterOp describeRegions];
}

-(void)describeZonesWithRegionId:(NSString*)regionId
{
    [_dataCenterOp describeZonesWithRegionId:regionId];
}

#pragma mark ECSMonitorOperation
/*************************************************************************************************
 * ECSMonitorOperation   ******
 ***************************************************************************************************/
-(void)fetchMonitorDataWithRegionId:(NSString*)regionId
{
    [_monitorOp fetchMonitorDataWithRegionId:regionId];
}

-(void)fetchMonitorDataWithRegionId:(NSString*)regionId instanceId:(NSString*)instanceId
{
    [_monitorOp fetchMonitorDataWithRegionId:regionId instanceId:instanceId];
}


#pragma mark ECSOtherOperation
/*************************************************************************************************
 * ECSOtherOperation   ******
 ***************************************************************************************************/
-(void)describeInstanceTypes
{
    [_otherOp describeInstanceTypes];
}

#pragma mark ECSInstanceOperation  delegate 
/*************************************************************************************************
 * ECSInstanceOperation  delegate   ******
 ***************************************************************************************************/

-(void) ECSInstanceOperationNetworkError:(ECSInstanceOperation*)op error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(ECSClientNetworkError:error:)]) {
        [self.delegate ECSClientNetworkError:self error:nil];
    }
}

-(void) startInstanceFinished:(ECSInstanceOperation*)operation result:(NSString*)requestId
{
    if ([self.delegate respondsToSelector:@selector(startInstanceFinished:result:)]) {
        [self.delegate startInstanceFinished:self result:requestId];
    }
}
-(void) startInstanceFailed:(ECSInstanceOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(startInstanceFailed:error:)]) {
        [self.delegate startInstanceFailed:self error:error];
    }
}

-(void) stopInstanceFinished:(ECSInstanceOperation*)operation result:(NSString*)requestId
{
    if ([self.delegate respondsToSelector:@selector(stopInstanceFinished:result:)]) {
        [self.delegate stopInstanceFinished:self result:requestId];
    }
}
-(void) stopInstanceFailed:(ECSInstanceOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(stopInstanceFailed:error:)]) {
        [self.delegate stopInstanceFailed:self error:error];
    }
}
-(void) rebootInstanceFinished:(ECSInstanceOperation*)operation result:(NSString*)requestId
{
    if ([self.delegate respondsToSelector:@selector(rebootInstanceFinished:result:)]) {
        [self.delegate rebootInstanceFinished:self result:requestId];
    }
}
-(void) rebootInstanceFailed:(ECSInstanceOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(rebootInstanceFailed:error:)]) {
        [self.delegate rebootInstanceFailed:self error:error];
    }
}
-(void) resetInstanceFinished:(ECSInstanceOperation*)operation result:(NSString*)requestId
{
    if ([self.delegate respondsToSelector:@selector(resetInstanceFinished:result:)]) {
        [self.delegate resetInstanceFinished:self result:requestId];
    }
}
-(void) resetInstanceFailed:(ECSInstanceOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(resetInstanceFailed:error:)]) {
        [self.delegate resetInstanceFailed:self error:error];
    }
}
-(void)describeInstanceStatusFinished:(ECSInstanceOperation*)operation result:(ECSDescribeInstanceStatusResult*)result
{
    if ([self.delegate respondsToSelector:@selector(describeInstanceStatusFinished:result:)]) {
        [self.delegate describeInstanceStatusFinished:self result:result];
    }
}
-(void)describeInstanceStatusFailed:(ECSInstanceOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(describeInstanceStatusFailed:error:)]) {
        [self.delegate describeInstanceStatusFailed:self error:error];
    }
}
-(void)describeInstanceAttributeFinished:(ECSInstanceOperation*)operation result:(ECSDescribeInstanceAttributeResult*)result
{
    if ([self.delegate respondsToSelector:@selector(describeInstanceAttributeFinished:result:)]) {
        [self.delegate describeInstanceAttributeFinished:self result:result];
    }
}
-(void)describeInstanceAttributeFailed:(ECSInstanceOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(describeInstanceAttributeFailed:error:)]) {
        [self.delegate describeInstanceAttributeFailed:self error:error];
    }
}
-(void) ECSDiskOperationNetworkError:(ECSDiskOperation*)op error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(ECSClientNetworkError:error:)]) {
        [self.delegate ECSClientNetworkError:self error:nil];
    }
}
-(void) describeInstanceDisksFinished:(ECSDiskOperation*)operation result:(ECSDescribeInstanceDisksResult*)result
{
    if ([self.delegate respondsToSelector:@selector(describeInstanceDisksFinished:result:)]) {
        [self.delegate describeInstanceDisksFinished:self result:result];
    }
}
-(void) describeInstanceDisksFailed:(ECSDiskOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(describeInstanceDisksFailed:error:)]) {
        [self.delegate describeInstanceDisksFailed:self error:error];
    }

}
-(void) ECSNetworkOperationNetworkError:(ECSNetworkOperation*)op error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(ECSClientNetworkError:error:)]) {
        [self.delegate ECSClientNetworkError:self error:nil];
    }
}

-(void) allocatePublicIpAddressFinished:(ECSNetworkOperation*)operation result:(ECSAllocatePublicIpAddressResult*)result
{
    if ([self.delegate respondsToSelector:@selector(allocatePublicIpAddressFinished:result:)]) {
        [self.delegate allocatePublicIpAddressFinished:self result:result];
    }
}

-(void) allocatePublicIpAddressFailed:(ECSNetworkOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(allocatePublicIpAddressFailed:error:)]) {
        [self.delegate allocatePublicIpAddressFailed:self error:error];
    }
}

-(void) releasePublicIpAddressFinished:(ECSNetworkOperation*)operation result:(NSString*)requestId
{
    if ([self.delegate respondsToSelector:@selector(releasePublicIpAddressFinished:result:)]) {
        [self.delegate releasePublicIpAddressFinished:self result:requestId];
    }
}
-(void) releasePublicIpAddressFailed:(ECSNetworkOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(releasePublicIpAddressFailed:error:)]) {
        [self.delegate releasePublicIpAddressFailed:self error:error];
    }
}
-(void) ECSDataCenterOperationNetworkError:(ECSDataCenterOperation*)op error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(ECSClientNetworkError:error:)]) {
        [self.delegate ECSClientNetworkError:self error:nil];
    }
}
-(void) describeRegionsFinished:(ECSDataCenterOperation*)operation result:(ECSDescribeRegionsResult*)result
{
    if ([self.delegate respondsToSelector:@selector(describeRegionsFinished:result:)]) {
        [self.delegate describeRegionsFinished:self result:result];
    }
}
-(void) describeRegionsFailed:(ECSDataCenterOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(describeRegionsFailed:error:)]) {
        [self.delegate describeRegionsFailed:self error:error];
    }
}
-(void) describeZonesFinished:(ECSDataCenterOperation*)operation result:(ECSDescribeZonesResult*)result
{
    if ([self.delegate respondsToSelector:@selector(describeZonesFinished:result:)]) {
        [self.delegate describeZonesFinished:self result:result];
    }
}
-(void) describeZonesFailed:(ECSDataCenterOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(describeZonesFailed:error:)]) {
        [self.delegate describeZonesFailed:self error:error];
    }
}
-(void) ECSImageOperationNetworkError:(ECSImageOperation*)op error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(ECSClientNetworkError:error:)]) {
        [self.delegate ECSClientNetworkError:self error:nil];
    }
}
-(void) describeImagesFinished:(ECSImageOperation*)operation result:(ECSDescribeImagesResult*)result
{
    if ([self.delegate respondsToSelector:@selector(describeImagesFinished:result:)]) {
        [self.delegate describeImagesFinished:self result:result];
    }
}
-(void) describeImagesFailed:(ECSImageOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(describeImagesFailed:error:)]) {
        [self.delegate describeImagesFailed:self error:error];
    }
}
-(void)modifyInstanceAttributeFinished:(ECSInstanceOperation*)operation result:(NSString*)requestId
{
    if ([self.delegate respondsToSelector:@selector(modifyInstanceAttributeFinished:result:)]) {
        [self.delegate modifyInstanceAttributeFinished:self result:requestId];
    }
}
-(void)modifyInstanceAttributeFailed:(ECSInstanceOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(modifyInstanceAttributeFailed:error:)]) {
        [self.delegate modifyInstanceAttributeFailed:self error:error];
    }
}
-(void) ECSMonitorOperationNetworkError:(ECSMonitorOperation*)op error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(ECSClientNetworkError:error:)]) {
        [self.delegate ECSClientNetworkError:self error:nil];
    }
}
-(void) fetchMonitorDataFinished:(ECSMonitorOperation*)operation result:(ECSFetchMonitorDataResult*)result
{
    if ([self.delegate respondsToSelector:@selector(fetchMonitorDataFinished:result:)]) {
        [self.delegate fetchMonitorDataFinished:self result:result];
    }
}
-(void) fetchMonitorDataFailed:(ECSMonitorOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(fetchMonitorDataFailed:error:)]) {
        [self.delegate fetchMonitorDataFailed:self error:error];
    }
}
-(void) ECSOtherOperationNetworkError:(ECSOtherOperation*)op error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(ECSClientNetworkError:error:)]) {
        [self.delegate ECSClientNetworkError:self error:nil];
    }
}
-(void) describeInstanceTypesFinished:(ECSOtherOperation*)operation result:(ECSDescribeInstanceTypeResult*)result
{
    if ([self.delegate respondsToSelector:@selector(describeInstanceTypesFinished:result:)]) {
        [self.delegate describeInstanceTypesFinished:self result:result];
    }
}
-(void) describeInstanceTypesFailed:(ECSOtherOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(describeInstanceTypesFailed:error:)]) {
        [self.delegate describeInstanceTypesFailed:self error:error];
    }
}
-(void) ECSSecurityOperationNetworkError:(ECSSecurityOperation*)op error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(ECSClientNetworkError:error:)]) {
        [self.delegate ECSClientNetworkError:self error:nil];
    }
}

-(void) createSecurityGroupFinished:(ECSSecurityOperation*)operation result:(ECSCreateSecurityGroupResult*)result
{
    if ([self.delegate respondsToSelector:@selector(createSecurityGroupFinished:result:)]) {
        [self.delegate createSecurityGroupFinished:self result:result];
    }
}
-(void) createSecurityGroupFailed:(ECSSecurityOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(createSecurityGroupFailed:error:)]) {
        [self.delegate createSecurityGroupFailed:self error:error];
    }
}
-(void) authorizeSecurityGroupFinished:(ECSSecurityOperation*)operation result:(NSString*)requestId
{
    if ([self.delegate respondsToSelector:@selector(authorizeSecurityGroupFinished:result:)]) {
        [self.delegate authorizeSecurityGroupFinished:self result:requestId];
    }
}
-(void) authorizeSecurityGroupFailed:(ECSSecurityOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(authorizeSecurityGroupFailed:error:)]) {
        [self.delegate authorizeSecurityGroupFailed:self error:error];
    }
}
-(void) describeSecurityGroupAttributeFinished:(ECSSecurityOperation*)operation result:(ECSDescribeSecurityGroupAttributeResult*)result
{
    if ([self.delegate respondsToSelector:@selector(describeSecurityGroupAttributeFinished:result:)]) {
        [self.delegate describeSecurityGroupAttributeFinished:self result:result];
    }
}
-(void) describeSecurityGroupAttributeFailed:(ECSSecurityOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(describeSecurityGroupAttributeFailed:error:)]) {
        [self.delegate describeSecurityGroupAttributeFailed:self error:error];
    }

}
-(void) describeSecurityGroupsFinished:(ECSSecurityOperation*)operation result:(ECSDescribeSecurityGroupsResult*)result
{
    if ([self.delegate respondsToSelector:@selector(describeSecurityGroupsFinished:result:)]) {
        [self.delegate describeSecurityGroupsFinished:self result:result];
    }
}
-(void) describeSecurityGroupsFailed:(ECSSecurityOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(describeSecurityGroupsFailed:error:)]) {
        [self.delegate describeSecurityGroupsFailed:self error:error];
    }
}
-(void) revokeSecurityGroupFinished:(ECSSecurityOperation*)operation result:(NSString*)requestId
{
    if ([self.delegate respondsToSelector:@selector(revokeSecurityGroupFinished:result:)]) {
        [self.delegate revokeSecurityGroupFinished:self result:requestId];
    }
}

-(void) revokeSecurityGroupFailed:(ECSSecurityOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(revokeSecurityGroupFailed:error:)]) {
        [self.delegate revokeSecurityGroupFailed:self error:error];
    }
}


-(void) deleteSecurityGroupFinished:(ECSSecurityOperation*)operation result:(NSString*)requestId
{
    if ([self.delegate respondsToSelector:@selector(deleteSecurityGroupFinished:result:)]) {
        [self.delegate deleteSecurityGroupFinished:self result:requestId];
    }
}

-(void) deleteSecurityGroupFailed:(ECSSecurityOperation*)operation error:(ECSError*)error
{
    if ([self.delegate respondsToSelector:@selector(deleteSecurityGroupFailed:error:)]) {
        [self.delegate deleteSecurityGroupFailed:self error:error];
    }
}

@end
