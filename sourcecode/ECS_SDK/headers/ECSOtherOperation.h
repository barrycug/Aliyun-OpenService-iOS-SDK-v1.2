//
//  ECSOtherOperation.h
//  samples_ios
//
//  Created by zhang baocai on 8/20/13.
//
//

#import "ECSOperation.h"
@class ECSOtherOperation;
@class ECSError;
@class ECSDescribeInstanceTypeResult;
@protocol ECSOtherOperationDelegate <NSObject>
/**
 网络错误响应
 @param op ECSOtherOperation
 @param error ECSError
 */
-(void) ECSOtherOperationNetworkError:(ECSOtherOperation*)op error:(ECSError*)error;
-(void) describeInstanceTypesFinished:(ECSOtherOperation*)operation result:(ECSDescribeInstanceTypeResult*)result;
-(void) describeInstanceTypesFailed:(ECSOtherOperation*)operation error:(ECSError*)error;

@end
@interface ECSOtherOperation : ECSOperation
{
    id<ECSOtherOperationDelegate> delegate;
}
@property(nonatomic,assign)id<ECSOtherOperationDelegate> delegate;
-(void)describeInstanceTypes;
@end
