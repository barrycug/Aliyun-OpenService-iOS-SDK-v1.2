//
//  ECSMonitorOperation.h
//  samples_ios
//
//  Created by zhang baocai on 8/20/13.
//
//

#import "ECSOperation.h"
@class ECSMonitorOperation;
@class ECSError;
@class ECSFetchMonitorDataResult;
@protocol ECSMonitorOperationDelegate <NSObject>
/**
 网络错误响应
 @param op ECSMonitorOperation
 @param error ECSError
 */
-(void) ECSMonitorOperationNetworkError:(ECSMonitorOperation*)op error:(ECSError*)error;
-(void) fetchMonitorDataFinished:(ECSMonitorOperation*)operation result:(ECSFetchMonitorDataResult*)result;
-(void) fetchMonitorDataFailed:(ECSMonitorOperation*)operation error:(ECSError*)error;

@end
@interface ECSMonitorOperation : ECSOperation
{
    id<ECSMonitorOperationDelegate> delegate;
}
@property(nonatomic,assign)id<ECSMonitorOperationDelegate> delegate;
-(void)fetchMonitorDataWithRegionId:(NSString*)regionId;
-(void)fetchMonitorDataWithRegionId:(NSString*)regionId instanceId:(NSString*)instanceId;
@end
