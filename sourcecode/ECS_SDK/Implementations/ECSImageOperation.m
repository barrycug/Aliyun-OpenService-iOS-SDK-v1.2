//
//  ECSImageOperation.m
//  samples_ios
//
//  Created by zhang baocai on 8/19/13.
//
//

#import "ECSImageOperation.h"
#import "ECSError.h"
#import "ResponseMessage.h"
#import "ECSDescribeImagesResult.h"
@implementation ECSImageOperation
@synthesize delegate;
-(void)dealloc
{
    [super dealloc];
}
-(void)describeImagesWithRegionId:(NSString*)regionId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"describeImages", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"DescribeImages" forKey:@"Action"];
    [params setObject:regionId forKey:@"RegionId"];
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)describeImagesWithRegionId:(NSString*)regionId  pageNumber:(int)pageNumber pageSize:(int) pageSize
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"describeImages", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:4];
    [params setObject:@"DescribeImages" forKey:@"Action"];
    [params setObject:regionId forKey:@"RegionId"];
    if (pageNumber >0) {
        [params setObject:[NSString stringWithFormat:@"%d",pageNumber] forKey:@"PageNumber"];
    }
    if (pageSize >0) {
        if (pageSize > 50)
        {
            pageSize = 50;
        }
        [params setObject:[NSString stringWithFormat:@"%d",pageSize] forKey:@"PageSize"];
    }
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
        if ([strMethod isEqualToString:@"describeImages"]) {
            
            if ([self.delegate respondsToSelector:@selector(describeImagesFinished:result:)]) {
                ECSDescribeImagesResult * result = [[ECSDescribeImagesResult alloc] initWithXMLData:rm.content];
                [self.delegate describeImagesFinished:self result:result];
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
            
            if ([self.delegate respondsToSelector:@selector(describeImagesFailed:error:)]) {
                [self.delegate describeImagesFailed:self error:error];
                
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
    if ([self.delegate respondsToSelector:@selector(ECSImageOperationNetworkError:error:)])
    {
        ECSError * error = [ECSError ECSErrorWithErrorCode:@"network failed"
                                                   message:@""
                                                 requestId:@""
                                                    hostId:@""];
        [self.delegate ECSImageOperationNetworkError:self error:error];
        
    }
}
@end
