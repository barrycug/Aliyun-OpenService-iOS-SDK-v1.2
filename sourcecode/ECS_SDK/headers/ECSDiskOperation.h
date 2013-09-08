//
//  ECSDiskOperation.h
//  samples_ios
//
//  Created by zhang baocai on 8/19/13.
//
//

#import "ECSOperation.h"
@class ECSDiskOperation;
@class ECSError;
@class ECSDescribeInstanceDisksResult;
@protocol ECSDiskOperationDelegate <NSObject>
/**
 网络错误响应
 @param op ECSDiskOperation
 @param error ECSError
 */
-(void) ECSDiskOperationNetworkError:(ECSDiskOperation*)op error:(ECSError*)error;
-(void) describeInstanceDisksFinished:(ECSDiskOperation*)operation result:(ECSDescribeInstanceDisksResult*)result;
-(void) describeInstanceDisksFailed:(ECSDiskOperation*)operation error:(ECSError*)error;

@end
@interface ECSDiskOperation : ECSOperation
{
    id<ECSDiskOperationDelegate> delegate;
}
/**
 *ECSDiskOperationDelegate 代理对象
 */
@property(nonatomic,assign)id<ECSDiskOperationDelegate> delegate;
-(void)describeInstanceDisksWithInstanceId:(NSString*)instanceId;
@end
