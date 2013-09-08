//
//  ECSSecurityOperation.h
//  samples_ios
//
//  Created by zhang baocai on 8/20/13.
//
//

#import "ECSOperation.h"
#import "ECSBaseType.h"
@class ECSSecurityOperation;
@class ECSError;
@class ECSCreateSecurityGroupResult;
@class ECSDescribeSecurityGroupAttributeResult;
@class ECSDescribeSecurityGroupsResult;
@protocol ECSSecurityOperationDelegate <NSObject>
/**
 网络错误响应
 @param op ECSSecurityOperation
 @param error ECSError
 */
-(void) ECSSecurityOperationNetworkError:(ECSSecurityOperation*)op error:(ECSError*)error;

-(void) createSecurityGroupFinished:(ECSSecurityOperation*)operation result:(ECSCreateSecurityGroupResult*)result;
-(void) createSecurityGroupFailed:(ECSSecurityOperation*)operation error:(ECSError*)error;

-(void) authorizeSecurityGroupFinished:(ECSSecurityOperation*)operation result:(NSString*)requestId;
-(void) authorizeSecurityGroupFailed:(ECSSecurityOperation*)operation error:(ECSError*)error;

-(void) describeSecurityGroupAttributeFinished:(ECSSecurityOperation*)operation result:(ECSDescribeSecurityGroupAttributeResult*)result;
-(void) describeSecurityGroupAttributeFailed:(ECSSecurityOperation*)operation error:(ECSError*)error;

-(void) describeSecurityGroupsFinished:(ECSSecurityOperation*)operation result:(ECSDescribeSecurityGroupsResult*)result;
-(void) describeSecurityGroupsFailed:(ECSSecurityOperation*)operation error:(ECSError*)error;

-(void) revokeSecurityGroupFinished:(ECSSecurityOperation*)operation result:(NSString*)requestId;
-(void) revokeSecurityGroupFailed:(ECSSecurityOperation*)operation error:(ECSError*)error;

-(void) deleteSecurityGroupFinished:(ECSSecurityOperation*)operation result:(NSString*)requestId;
-(void) deleteSecurityGroupFailed:(ECSSecurityOperation*)operation error:(ECSError*)error;

@end
@interface ECSSecurityOperation : ECSOperation
{
    id<ECSSecurityOperationDelegate> delegate;
}
@property(nonatomic,assign)id<ECSSecurityOperationDelegate> delegate;

-(void)createSecurityGroupWithRegionId:(NSString*)regionId description:(NSString*)description;

-(void)authorizeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                        regionId:(NSString*)regionId
                                   sourceGroupId:(NSString*)sourceGroupId
                                      ipProtocol:(ECSIpProtocolType)ipProtocol
                                       portRange:(NSString*)portRange
                                          policy:(ECSPolicyType)policy
                                         nicType:(ECSNicType)nicType;
-(void)authorizeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                        regionId:(NSString*)regionId
                                    sourceCidrIp:(NSString*)sourceCidrIp
                                      ipProtocol:(ECSIpProtocolType)ipProtocol
                                       portRange:(NSString*)portRange
                                          policy:(ECSPolicyType)policy
                                         nicType:(ECSNicType)nicType;

-(void)describeSecurityGroupAttributeWithSecurityGroupId:(NSString*)securityGroupId
                                                regionId:(NSString*)regionId;
-(void)describeSecurityGroupAttributeWithSecurityGroupId:(NSString*)securityGroupId
                                                regionId:(NSString*)regionId
                                                 nicType:(ECSNicType)nicType;

-(void)describeSecurityGroupsWithRegionId:(NSString*)regionId;
-(void)describeSecurityGroupsWithRegionId:(NSString*)regionId
                               pageNumber:(int)pageNumber
                                 pageSize:(int) pageSize;

-(void)revokeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                        regionId:(NSString*)regionId
                                   sourceGroupId:(NSString*)sourceGroupId
                                      ipProtocol:(ECSIpProtocolType)ipProtocol
                                       portRange:(NSString*)portRange
                                          policy:(ECSPolicyType)policy
                                         nicType:(ECSNicType)nicType;
-(void)revokeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                        regionId:(NSString*)regionId
                                    sourceCidrIp:(NSString*)sourceCidrIp
                                      ipProtocol:(ECSIpProtocolType)ipProtocol
                                       portRange:(NSString*)portRange
                                          policy:(ECSPolicyType)policy
                                         nicType:(ECSNicType)nicType;

-(void)deleteSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                     regionId:(NSString*)regionId;
@end
