//
//  ECSOtherOperation.m
//  samples_ios
//
//  Created by zhang baocai on 8/20/13.
//
//

#import "ECSOtherOperation.h"
#import "ECSError.h"
#import "ResponseMessage.h"
#import "ECSDescribeInstanceTypeResult.h"
@implementation ECSOtherOperation
@synthesize delegate;
-(void)dealloc
{
    [super dealloc];
}
-(void)describeInstanceTypes
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"describeInstanceTypes", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"DescribeInstanceTypes" forKey:@"Action"];

    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
}
-(void) sendFinishedMessage:(ResponseMessage*) rm
{
    NSString * strMethod = @"";
    if(rm.userInfo != nil &&
       [rm.userInfo objectForKey:@"method"]!= nil)
    {
        strMethod = [rm.userInfo objectForKey:@"method"];
        if ([strMethod isEqualToString:@"describeInstanceTypes"]) {
            
            if ([self.delegate respondsToSelector:@selector(describeInstanceTypesFinished:result:)]) {
                ECSDescribeInstanceTypeResult * result = [[ECSDescribeInstanceTypeResult alloc] initWithXMLData:rm.content];
                [self.delegate describeInstanceTypesFinished:self result:result];
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
        if ([strMethod isEqualToString:@"describeInstanceTypes"]) {
            
            if ([self.delegate respondsToSelector:@selector(describeInstanceTypesFailed:error:)]) {
                [self.delegate describeInstanceTypesFailed:self error:error];
                
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
    if ([self.delegate respondsToSelector:@selector(ECSOtherOperationNetworkError:error:)])
    {
        ECSError * error = [ECSError ECSErrorWithErrorCode:@"network failed"
                                                   message:@""
                                                 requestId:@""
                                                    hostId:@""];
        [self.delegate ECSOtherOperationNetworkError:self error:error];
        
    }
}
@end
