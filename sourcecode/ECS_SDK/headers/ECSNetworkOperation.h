//
//  ECSNetworkOperation.h
//  samples_ios
//
//  Created by zhang baocai on 8/20/13.
//
//

#import "ECSOperation.h"
@class ECSNetworkOperation;
@class ECSError;
@class ECSAllocatePublicIpAddressResult;
@protocol ECSNetworkOperationDelegate <NSObject>
/**
 网络错误响应
 @param op ECSNetworkOperation
 @param error ECSError
 */
-(void) ECSNetworkOperationNetworkError:(ECSNetworkOperation*)op error:(ECSError*)error;

-(void) allocatePublicIpAddressFinished:(ECSNetworkOperation*)operation result:(ECSAllocatePublicIpAddressResult*)esult;

-(void) allocatePublicIpAddressFailed:(ECSNetworkOperation*)operation error:(ECSError*)error;

-(void) releasePublicIpAddressFinished:(ECSNetworkOperation*)operation result:(NSString*)requestId;
-(void) releasePublicIpAddressFailed:(ECSNetworkOperation*)operation error:(ECSError*)error;

@end
@interface ECSNetworkOperation : ECSOperation
{
    id<ECSNetworkOperationDelegate>delegate;
}
@property(nonatomic,assign)id<ECSNetworkOperationDelegate> delegate;

-(void)allocatePublicIpAddressWithInstanceId:(NSString*)instanceId;
-(void)releasePublicIpAddressWithPublicIpAddress:(NSString*)publicIpAddress;
@end
