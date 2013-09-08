//
//  ECSDiskOperation.m
//  samples_ios
//
//  Created by zhang baocai on 8/19/13.
//
//

#import "ECSDiskOperation.h"
#import "ECSError.h"
#import "ResponseMessage.h"
#import "ECSDescribeInstanceDisksResult.h"
@implementation ECSDiskOperation
@synthesize delegate;
-(void)dealloc
{
    [super dealloc];
}
-(void)describeInstanceDisksWithInstanceId:(NSString*)instanceId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"describeInstanceDisks", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"DescribeInstanceDisks" forKey:@"Action"];
    [params setObject:instanceId forKey:@"InstanceId"];
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void) sendFinishedMessage:(ResponseMessage*) rm
{
    NSString * strMethod = @"";
    if(rm.userInfo != nil &&
       [rm.userInfo objectForKey:@"method"]!= nil)
    {
        strMethod = [rm.userInfo objectForKey:@"method"];
        if ([strMethod isEqualToString:@"describeInstanceDisks"]) {
            
            if ([self.delegate respondsToSelector:@selector(describeInstanceDisksFinished:result:)]) {
                ECSDescribeInstanceDisksResult * result = [[ECSDescribeInstanceDisksResult alloc] initWithXMLData:rm.content];
                [self.delegate describeInstanceDisksFinished:self result:result];
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
        if ([strMethod isEqualToString:@"describeInstanceDisks"]) {
            
            if ([self.delegate respondsToSelector:@selector(describeInstanceDisksFailed:error:)]) {
                [self.delegate describeInstanceDisksFailed:self error:error];
                
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
    if ([self.delegate respondsToSelector:@selector(ECSDiskOperationNetworkError:error:)])
    {
        ECSError * error = [ECSError ECSErrorWithErrorCode:@"network failed"
                                                   message:@""
                                                 requestId:@""
                                                    hostId:@""];
              [self.delegate ECSDiskOperationNetworkError:self error:error];
        
    }
}
@end
