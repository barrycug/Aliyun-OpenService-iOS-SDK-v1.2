//
//  ECSNetworkOperation.m
//  samples_ios
//
//  Created by zhang baocai on 8/20/13.
//
//

#import "ECSNetworkOperation.h"
#import "ECSError.h"
#import "ResponseMessage.h"
#import "ECSResult.h"
#import "ECSAllocatePublicIpAddressResult.h"
@implementation ECSNetworkOperation
@synthesize delegate;
-(void)dealloc
{
    [super dealloc];
}
-(void)allocatePublicIpAddressWithInstanceId:(NSString*)instanceId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"AllocatePublicIpAddress", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"AllocatePublicIpAddress" forKey:@"Action"];
    [params setObject:instanceId forKey:@"InstanceId"];
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)releasePublicIpAddressWithPublicIpAddress:(NSString*)publicIpAddress
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"ReleasePublicIpAddress", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"ReleasePublicIpAddress" forKey:@"Action"];
    [params setObject:publicIpAddress forKey:@"PublicIpAddress"];
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void) sendFinishedMessage:(ResponseMessage*) rm
{
    //  NSString * str = [[NSString alloc] initWithData:rm.content encoding:NSUTF8StringEncoding];
    NSString * strMethod = nil;
    if(rm.userInfo != nil &&
       [rm.userInfo objectForKey:@"method"]!= nil)
    {
        strMethod = [rm.userInfo objectForKey:@"method"];
        if ([strMethod isEqualToString:@"ReleasePublicIpAddress"]) {
            
            
            if ([self.delegate respondsToSelector:@selector(releasePublicIpAddressFinished:result:)]) {
                ECSResult * result  = [[ECSResult alloc] initWithXMLData:rm.content];
                [self.delegate releasePublicIpAddressFinished:self result:result.requestId];
                [result release];
            }
            
        }
        if ([strMethod isEqualToString:@"AllocatePublicIpAddress"]) {
            
            
            if ([self.delegate respondsToSelector:@selector(allocatePublicIpAddressFinished:result:)]) {
                ECSAllocatePublicIpAddressResult * result  = [[ECSAllocatePublicIpAddressResult alloc] initWithXMLData:rm.content];
                [self.delegate allocatePublicIpAddressFinished:self result:result];
                [result release];
            }
            
        }
        
    }
}
-(void)sendFailedMessage:(ResponseMessage*) rm
{
    NSString * strMethod = @"";
    ECSError * error = [[ECSError alloc] initWithXMLData:rm.content];
    if(rm.userInfo != nil &&
       [rm.userInfo objectForKey:@"method"]!= nil)
    {
        strMethod = [rm.userInfo objectForKey:@"method"];
        if ([strMethod isEqualToString:@"ReleasePublicIpAddress"]) {
            
            if ([self.delegate respondsToSelector:@selector(releasePublicIpAddressFailed:error:)]) {
                [self.delegate releasePublicIpAddressFailed:self error:error];
                
            }
            
        }
        if ([strMethod isEqualToString:@"AllocatePublicIpAddress"]) {
            
            if ([self.delegate respondsToSelector:@selector(allocatePublicIpAddressFailed:error:)]) {
                [self.delegate allocatePublicIpAddressFailed:self error:error];
                
            }
            
        }
    }
    [error release];
}
-(void)serviceClientRequestFinished:(DefaultServiceClient*)defaultServiceClient result:(id) result
{
    [super serviceClientRequestFinished:defaultServiceClient result:result];
    if([result isKindOfClass:[ResponseMessage  class]])
    {
        ResponseMessage * rm = (ResponseMessage*) result;
        
        //successed
        if ([rm isSuccessful])
        {
            [self sendFinishedMessage:rm];
        }
        // failed
        else
        {
            [self sendFailedMessage:rm];
        }
    }
    // other failed
    else {
        
        [self sendInvalidNetWorkError];
    }
    
    
}
-(void)serviceClientRequestFailed:(DefaultServiceClient*)defaultServiceClient error:(id) error
{
    [super serviceClientRequestFailed:defaultServiceClient error:error];
    [self sendInvalidNetWorkError];
}

-(void) sendInvalidNetWorkError
{
    if ([self.delegate respondsToSelector:@selector(ECSNetworkOperationNetworkError:error:)])
    {
        ECSError * error = [ECSError ECSErrorWithErrorCode:@"network failed"
                                                   message:@""
                                                 requestId:@""
                                                    hostId:@""];
        [self.delegate ECSNetworkOperationNetworkError:self error:error];
        
    }
}
@end
