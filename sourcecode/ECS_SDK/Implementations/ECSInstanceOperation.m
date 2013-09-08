//
//  ECSInstanceOperation.m
//  samples_ios
//
//  Created by zhang baocai on 7/10/13.
//
//

#import "ECSInstanceOperation.h"
#import "ECSError.h"
#import "ResponseMessage.h"
#import "ECSUtil.h"
#import "ECSResult.h"
#import "ECSDescribeInstanceStatusResult.h"
#import "ECSDescribeInstanceAttributeResult.h"
@implementation ECSInstanceOperation
@synthesize delegate;

-(void)dealloc
{
    [super dealloc];
}
-(void)startInstance:(NSString*)instanceId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"startInstance", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"StartInstance"  forKey:@"Action"];
    [params setObject:instanceId forKey:@"InstanceId"];
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)stopInstance:(NSString*)instanceId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"stopInstance", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"StopInstance"  forKey:@"Action"];
    [params setObject:instanceId forKey:@"InstanceId"];
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)stopInstance:(NSString*)instanceId isForceStop:(BOOL)isForceStop
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"stopInstance", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"StopInstance"  forKey:@"Action"];
    [params setObject:instanceId forKey:@"InstanceId"];
    [params setObject:[ECSUtil stringFromBool:isForceStop] forKey:@"ForceStop"];
   
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)rebootInstance:(NSString*)instanceId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"rebootInstance", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"RebootInstance"  forKey:@"Action"];
    [params setObject:instanceId forKey:@"InstanceId"];
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)rebootInstance:(NSString*)instanceId isForceStop:(BOOL)isForceStop
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"rebootInstance", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"RebootInstance"  forKey:@"Action"];
    [params setObject:instanceId forKey:@"InstanceId"];
    [params setObject:[ECSUtil stringFromBool:isForceStop] forKey:@" ForceStop"];
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)resetInstanceDataDisk:(NSString*)instanceId
{
     [self resetInstance:instanceId imageId:@"" diskType:ECSDiskType_Data];
}

-(void)resetInstanceOS:(NSString*)instanceId imageId:(NSString*)imageId
{
    [self resetInstance:instanceId imageId:imageId diskType:ECSDiskType_System];
}
-(void)resetInstance:(NSString*)instanceId
             imageId:(NSString*)imageId
            diskType:(ECSDiskType)diskType
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"resetInstance", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"ResetInstance"  forKey:@"Action"];
    [params setObject:instanceId forKey:@"InstanceId"];
    if (diskType == ECSDiskType_System) {
        [params setObject:imageId forKey:@"ImageId"];
    }
    [params setObject:[ECSUtil stringFromDiskType:diskType ] forKey:@"DiskType"];

    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)modifyInstanceAttributeWithInstanceId:(NSString*)instanceId password:(NSString*)password hostName:(NSString*)hostName securityGroupId:(NSString*)securityGroupId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"modifyInstanceAttribute", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"ModifyInstanceAttribute"  forKey:@"Action"];
    [params setObject:instanceId forKey:@"InstanceId"];
    if (password != nil) {
         [params setObject:password forKey:@"Password"];
    }
    if (hostName != nil) {
        [params setObject:hostName forKey:@"HostName"];
    }
    if (securityGroupId != nil) {
        [params setObject:securityGroupId forKey:@"SecurityGroupId"];
    }
    
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)describeInstanceStatusWithRegionId:(NSString*)regionId zoneId:(NSString*)zoneId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"describeInstanceStatus", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"DescribeInstanceStatus"  forKey:@"Action"];
    [params setObject:regionId forKey:@"RegionId"];
    [params setObject:zoneId forKey:@"ZoneId"];
    
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)describeInstanceStatusWithRegionId:(NSString*)regionId zoneId:(NSString*)zoneId pageNumber:(int)pageNumber pageSize:(int) pageSize
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"describeInstanceStatus", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"DescribeInstanceStatus"  forKey:@"Action"];
    [params setObject:regionId forKey:@"RegionId"];
    [params setObject:zoneId forKey:@"ZoneId"];
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
-(void)describeInstanceAttributeWithInstanceId:(NSString*)instanceId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"describeInstanceAttribute", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"DescribeInstanceAttribute"  forKey:@"Action"];
    [params setObject:instanceId forKey:@"InstanceId"];
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
        if ([strMethod isEqualToString:@"startInstance"]) {
            
            
            if ([self.delegate respondsToSelector:@selector(startInstanceFinished:result:)]) {
                ECSResult * result  = [[ECSResult alloc] initWithXMLData:rm.content];
                [self.delegate startInstanceFinished:self result:result.requestId];
                [result release];
            }
            
        }
        if ([strMethod isEqualToString:@"stopInstance"]) {
            
            if ([self.delegate respondsToSelector:@selector(stopInstanceFinished:result:)]) {
                ECSResult * result  = [[ECSResult alloc] initWithXMLData:rm.content];
                [self.delegate stopInstanceFinished:self result:result.requestId];
                [result release];
            }
            
        }
        if ([strMethod isEqualToString:@"rebootInstance"]) {
            
            if ([self.delegate respondsToSelector:@selector(rebootInstanceFinished:result:)]) {
                ECSResult * result  = [[ECSResult alloc] initWithXMLData:rm.content];
                [self.delegate rebootInstanceFinished:self result:result.requestId];
                [result release];
            }
            
        }
        if ([strMethod isEqualToString:@"resetInstance"]) {
            
            if ([self.delegate respondsToSelector:@selector(resetInstanceFinished:result:)]) {
                ECSResult * result  = [[ECSResult alloc] initWithXMLData:rm.content];
                [self.delegate resetInstanceFinished:self result:result.requestId];
                [result release];
            }
            
        }
        if ([strMethod isEqualToString:@"modifyInstanceAttribute"]) {
            
            if ([self.delegate respondsToSelector:@selector(modifyInstanceAttributeFinished:result:)]) {
                ECSResult * result  = [[ECSResult alloc] initWithXMLData:rm.content];
                [self.delegate modifyInstanceAttributeFinished:self result:result.requestId];
                [result release];
            }
            
        }
        if ([strMethod isEqualToString:@"describeInstanceStatus"]) {
            
            if ([self.delegate respondsToSelector:@selector(describeInstanceStatusFinished:result:)]) {
                ECSDescribeInstanceStatusResult * result  = [[ECSDescribeInstanceStatusResult alloc] initWithXMLData:rm.content];
                [self.delegate describeInstanceStatusFinished:self result:result];
                [result release];
            }
            
        }
        if ([strMethod isEqualToString:@"describeInstanceAttribute"]) {
            
            if ([self.delegate respondsToSelector:@selector(describeInstanceAttributeFinished:result:)]) {
                ECSDescribeInstanceAttributeResult * result  = [[ECSDescribeInstanceAttributeResult alloc] initWithXMLData:rm.content];
                [self.delegate describeInstanceStatusFinished:self result:result];
                [result release];
            }
            
        }
        
    }
}
-(void)sendFailedMessage:(ResponseMessage*) rm
{
   //   NSString * str = [[NSString alloc] initWithData:rm.content encoding:NSUTF8StringEncoding];
    NSString * strMethod = @"";
    ECSError * error = [[ECSError alloc] initWithXMLData:rm.content];
    if(rm.userInfo != nil &&
       [rm.userInfo objectForKey:@"method"]!= nil)
    {
        strMethod = [rm.userInfo objectForKey:@"method"];
        if ([strMethod isEqualToString:@"startInstance"]) {
            
            if ([self.delegate respondsToSelector:@selector(startInstanceFailed:error:)]) {
                 [self.delegate startInstanceFailed:self error:error];
                
            }
            
        }
        if ([strMethod isEqualToString:@"stopInstance"]) {
            
            if ([self.delegate respondsToSelector:@selector(stopInstanceFailed:error:)]) {
                [self.delegate stopInstanceFailed:self error:error];
            }
            
        }
        if ([strMethod isEqualToString:@"rebootInstance"]) {
            
            if ([self.delegate respondsToSelector:@selector(rebootInstanceFailed:error:)]) {
                [self.delegate rebootInstanceFailed:self error:error];
            }
            
        }
        if ([strMethod isEqualToString:@"resetInstance"]) {
            
            if ([self.delegate respondsToSelector:@selector(resetInstanceFailed:error:)]) {
                [self.delegate resetInstanceFailed:self error:error];
            }
            
        }
        if ([strMethod isEqualToString:@"modifyInstanceAttribute"]) {
            if ([self.delegate respondsToSelector:@selector(modifyInstanceAttributeFailed:error:)]) {
                [self.delegate modifyInstanceAttributeFailed:self error:error];
            }
        }
        if ([strMethod isEqualToString:@"describeInstanceStatus"]) {
            if ([self.delegate respondsToSelector:@selector(describeInstanceStatusFailed:error:)]) {
                [self.delegate describeInstanceStatusFailed:self error:error];
            }
        }
        if ([strMethod isEqualToString:@"describeInstanceAttribute"]) {
            if ([self.delegate respondsToSelector:@selector(describeInstanceAttributeFailed:error:)]) {
                [self.delegate describeInstanceAttributeFailed:self error:error];
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
    if ([self.delegate respondsToSelector:@selector(ECSInstanceOperationNetworkError:error:)])
    {
        ECSError * error = [ECSError ECSErrorWithErrorCode:@"network failed"
                                                   message:@""
                                                 requestId:@""
                                                    hostId:@""];
        [self.delegate ECSInstanceOperationNetworkError:self error:error];
        
    }
}
@end
