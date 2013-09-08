//
//  ECSMonitorOperation.m
//  samples_ios
//
//  Created by zhang baocai on 8/20/13.
//
//

#import "ECSMonitorOperation.h"
#import "ECSError.h"
#import "ResponseMessage.h"
#import "ECSFetchMonitorDataResult.h"
@implementation ECSMonitorOperation
@synthesize delegate;
-(void)dealloc
{
    [super dealloc];
}
-(void)fetchMonitorDataWithRegionId:(NSString*)regionId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"fetchMonitorData", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"GetMonitorData" forKey:@"Action"];
    [params setObject:regionId forKey:@"RegionId"];
    
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)fetchMonitorDataWithRegionId:(NSString*)regionId instanceId:(NSString*)instanceId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"fetchMonitorData", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"GetMonitorData" forKey:@"Action"];
    [params setObject:regionId forKey:@"RegionId"];
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
        if ([strMethod isEqualToString:@"fetchMonitorData"]) {
            
            if ([self.delegate respondsToSelector:@selector(fetchMonitorDataFinished:result:)]) {
                ECSFetchMonitorDataResult * result = [[ECSFetchMonitorDataResult alloc] initWithXMLData:rm.content];
                [self.delegate fetchMonitorDataFinished:self result:result];
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
        if ([strMethod isEqualToString:@"fetchMonitorData"]) {
            
            if ([self.delegate respondsToSelector:@selector(fetchMonitorDataFailed:error:)]) {
                [self.delegate fetchMonitorDataFailed:self error:error];
                
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
    if ([self.delegate respondsToSelector:@selector(ECSMonitorOperationNetworkError:error:)])
    {
        ECSError * error = [ECSError ECSErrorWithErrorCode:@"network failed"
                                                   message:@""
                                                 requestId:@""
                                                    hostId:@""];
        [self.delegate ECSMonitorOperationNetworkError:self error:error];
        
    }
}
@end
