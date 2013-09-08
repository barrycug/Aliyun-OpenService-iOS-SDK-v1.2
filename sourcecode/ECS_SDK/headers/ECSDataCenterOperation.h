//
//  ECSDataCenterOperation.h
//  samples_ios
//
//  Created by zhang baocai on 8/20/13.
//
//

#import "ECSOperation.h"

@class ECSDataCenterOperation;
@class ECSError;
@class ECSDescribeRegionsResult;
@class ECSDescribeZonesResult;
@protocol ECSDataCenterOperationDelegate <NSObject>
/**
 网络错误响应
 @param op ECSDataCenterOperation
 @param error ECSError
 */
-(void) ECSDataCenterOperationNetworkError:(ECSDataCenterOperation*)op error:(ECSError*)error;

-(void) describeRegionsFinished:(ECSDataCenterOperation*)operation result:(ECSDescribeRegionsResult*)result;
-(void) describeRegionsFailed:(ECSDataCenterOperation*)operation error:(ECSError*)error;

-(void) describeZonesFinished:(ECSDataCenterOperation*)operation result:(ECSDescribeZonesResult*)result;
-(void) describeZonesFailed:(ECSDataCenterOperation*)operation error:(ECSError*)error;
@end
@interface ECSDataCenterOperation : ECSOperation
{
    id<ECSDataCenterOperationDelegate> delegate;
}
@property(nonatomic,assign)id<ECSDataCenterOperationDelegate> delegate;
-(void)describeRegions;
-(void)describeZonesWithRegionId:(NSString*)regionId;
@end
