//
//  ECSDataCenterOperation.m
//  samples_ios
//
//  Created by zhang baocai on 8/20/13.
//
//

#import "ECSDataCenterOperation.h"
#import "ECSError.h"
#import "ResponseMessage.h"
#import "ECSDescribeRegionsResult.h"
#import "ECSDescribeZonesResult.h"
@implementation ECSDataCenterOperation
@synthesize delegate;
-(void)dealloc
{
    [super dealloc];
}
-(void)describeRegions
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"describeRegions", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"DescribeRegions" forKey:@"Action"];
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
}
-(void)describeZonesWithRegionId:(NSString*)regionId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"describeZones", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"DescribeZones" forKey:@"Action"];
    [params setObject:regionId forKey:@"RegionId"];
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
        if ([strMethod isEqualToString:@"describeRegions"]) {
            
            if ([self.delegate respondsToSelector:@selector(describeRegionsFinished:result:)]) {
                ECSDescribeRegionsResult * result = [[ECSDescribeRegionsResult alloc] initWithXMLData:rm.content];
                [self.delegate describeRegionsFinished:self result:result];
                [result release];
                
            }
            
        }
        if ([strMethod isEqualToString:@"describeZones"]) {
            
            if ([self.delegate respondsToSelector:@selector(describeZonesFinished:result:)]) {
                ECSDescribeZonesResult * result = [[ECSDescribeZonesResult alloc]initWithXMLData:rm.content];
                [self.delegate describeZonesFinished:self result:result];
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
        if ([strMethod isEqualToString:@"describeRegions"]) {
            
            if ([self.delegate respondsToSelector:@selector(describeRegionsFailed:error:)]) {
                [self.delegate describeRegionsFailed:self error:error];
                
            }
            
        }
        if ([strMethod isEqualToString:@"describeZones"]) {
            
            if ([self.delegate respondsToSelector:@selector(describeZonesFinished:result:)]) {
                [self.delegate describeZonesFailed: self error:error];
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
    if ([self.delegate respondsToSelector:@selector(ECSDataCenterOperationNetworkError:error:)])
    {
        ECSError * error = [ECSError ECSErrorWithErrorCode:@"network failed"
                                                   message:@""
                                                 requestId:@""
                                                    hostId:@""];
        [self.delegate ECSDataCenterOperationNetworkError:self error:error];
        
    }
}
@end
