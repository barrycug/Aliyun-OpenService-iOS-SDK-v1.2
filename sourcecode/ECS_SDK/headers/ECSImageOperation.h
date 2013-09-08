//
//  ECSImageOperation.h
//  samples_ios
//
//  Created by zhang baocai on 8/19/13.
//
//

#import "ECSOperation.h"
@class ECSImageOperation;
@class ECSError;
@class ECSDescribeImagesResult;
@protocol ECSImageOperationDelegate <NSObject>
/**
 网络错误响应
 @param op ECSImageOperation
 @param error ECSError
 */
-(void) ECSImageOperationNetworkError:(ECSImageOperation*)op error:(ECSError*)error;
-(void) describeImagesFinished:(ECSImageOperation*)operation result:(ECSDescribeImagesResult*)result;
-(void) describeImagesFailed:(ECSImageOperation*)operation error:(ECSError*)error;

@end
@interface ECSImageOperation : ECSOperation
{
    id<ECSImageOperationDelegate> delegate;
}
@property(nonatomic,assign)id<ECSImageOperationDelegate> delegate;
-(void)describeImagesWithRegionId:(NSString*)regionId;
-(void)describeImagesWithRegionId:(NSString*)regionId  pageNumber:(int)pageNumber pageSize:(int) pageSize;
@end
