//
//  ECSInstanceOperation.h
//  samples_ios
//
//  Created by zhang baocai on 7/10/13.
//
//

#import "ECSOperation.h"
#import "ECSBaseType.h"
@class ECSInstanceOperation;
@class ECSError;
@class ECSDescribeInstanceStatusResult;
@class ECSDescribeInstanceAttributeResult;
@protocol ECSInstanceOperationDelegate <NSObject>
/**
 网络错误响应
 @param op ECSInstanceOperation
 @param error ECSError
 */
-(void) ECSInstanceOperationNetworkError:(ECSInstanceOperation*)op error:(ECSError*)error;

-(void) startInstanceFinished:(ECSInstanceOperation*)operation result:(NSString*)requestId;
-(void) startInstanceFailed:(ECSInstanceOperation*)operation error:(ECSError*)error;

-(void) stopInstanceFinished:(ECSInstanceOperation*)operation result:(NSString*)requestId;
-(void) stopInstanceFailed:(ECSInstanceOperation*)operation error:(ECSError*)error;

-(void) rebootInstanceFinished:(ECSInstanceOperation*)operation result:(NSString*)requestId;
-(void) rebootInstanceFailed:(ECSInstanceOperation*)operation error:(ECSError*)error;

-(void) resetInstanceFinished:(ECSInstanceOperation*)operation result:(NSString*)requestId;
-(void) resetInstanceFailed:(ECSInstanceOperation*)operation error:(ECSError*)error;

-(void)modifyInstanceAttributeFinished:(ECSInstanceOperation*)operation result:(NSString*)requestId;
-(void)modifyInstanceAttributeFailed:(ECSInstanceOperation*)operation error:(ECSError*)error;

-(void)describeInstanceStatusFinished:(ECSInstanceOperation*)operation result:(ECSDescribeInstanceStatusResult*)result;
-(void)describeInstanceStatusFailed:(ECSInstanceOperation*)operation error:(ECSError*)error;

-(void)describeInstanceAttributeFinished:(ECSInstanceOperation*)operation result:(ECSDescribeInstanceAttributeResult*)result;
-(void)describeInstanceAttributeFailed:(ECSInstanceOperation*)operation error:(ECSError*)error;

@end
@interface ECSInstanceOperation : ECSOperation
{
    id<ECSInstanceOperationDelegate> delegate;
}
/**
 *ECSInstanceOperationDelegate 代理对象
 */
@property(nonatomic,assign)id<ECSInstanceOperationDelegate> delegate;
-(void)startInstance:(NSString*)instanceId;
-(void)stopInstance:(NSString*)instanceId;
-(void)stopInstance:(NSString*)instanceId isForceStop:(BOOL)isForceStop;
-(void)rebootInstance:(NSString*)instanceId;
-(void)rebootInstance:(NSString*)instanceId isForceStop:(BOOL)isForceStop;
/**
 *重置数据盘
 */
-(void)resetInstanceDataDisk:(NSString*)instanceId;
/**
 *重置操作系统
 */
-(void)resetInstanceOS:(NSString*)instanceId imageId:(NSString*)imageId;
/**
 *重置操作，建议使用上面两个方法进行重置操作，当diskType 位ECSDiskType_System的时候，
 *使用ImageId对应的镜像重置系统盘，当diskType 为ECSDiskType_Data的时候重置数据盘
 */
-(void)resetInstance:(NSString*)instanceId
             imageId:(NSString*)imageId
            diskType:(ECSDiskType)diskType;
/**
 * 修改实例属性 password/hostName/securityGroupId 为nil的时候则不更改
 */
-(void)modifyInstanceAttributeWithInstanceId:(NSString*)instanceId password:(NSString*)password hostName:(NSString*)hostName securityGroupId:(NSString*)securityGroupId;
/**
 *批量获取当前用户所有实例的状态信息
 *pageNumber 实例状态列表的页码,起始值为 1,默认值为 1
 *pageSize 分页查询时设置的每页行数,最大值 50 行,默认值 为 10
 */
-(void)describeInstanceStatusWithRegionId:(NSString*)regionId zoneId:(NSString*)zoneId ;
-(void)describeInstanceStatusWithRegionId:(NSString*)regionId zoneId:(NSString*)zoneId pageNumber:(int)pageNumber pageSize:(int) pageSize;
/*
 *获取实例列表
 */
-(void)describeInstanceAttributeWithInstanceId:(NSString*)instanceId;
@end
