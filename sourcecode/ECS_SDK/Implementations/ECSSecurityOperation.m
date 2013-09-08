//
//  ECSSecurityOperation.m
//  samples_ios
//
//  Created by zhang baocai on 8/20/13.
//
//

#import "ECSSecurityOperation.h"
#import "ECSError.h"
#import "ResponseMessage.h"
#import "ECSUtil.h"
#import "ECSCreateSecurityGroupResult.h"
#import "ECSDescribeSecurityGroupAttributeResult.h"
#import "ECSDescribeSecurityGroupsResult.h"
@implementation ECSSecurityOperation

@synthesize delegate;
-(void)dealloc
{
    [super dealloc];
}
-(void)createSecurityGroupWithRegionId:(NSString*)regionId description:(NSString*)description
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"createSecurityGroup", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"CreateSecurityGroup" forKey:@"Action"];
    [params setObject:regionId forKey:@"RegionId"];
    [params setObject:description forKey:@"Description"];
    
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}

-(void)authorizeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                        regionId:(NSString*)regionId
                                   sourceGroupId:(NSString*)sourceGroupId
                                      ipProtocol:(ECSIpProtocolType)ipProtocol
                                       portRange:(NSString*)portRange
                                          policy:(ECSPolicyType)policy
                                         nicType:(ECSNicType)nicType
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"authorizeSecurityGroup", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:3];
    [params setObject:@"AuthorizeSecurityGroup" forKey:@"Action"];
    [params setObject:securityGroupId forKey:@"SecurityGroupId"];
    [params setObject:regionId forKey:@"RegionId"];
    [params setObject:[ECSUtil stringFromIpProtocolType:ipProtocol ] forKey:@"IpProtocol"];
    [params setObject:portRange forKey:@"PortRange"];
    if (sourceGroupId != nil) {
        [params setObject:sourceGroupId forKey:@"SourceGroupId"];
    }
    [params setObject:[ECSUtil stringFromPolicyType:policy] forKey:@"Policy"];
    [params setObject:[ECSUtil stringFromNicType:nicType] forKey:@"NicType"];
    
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)authorizeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                        regionId:(NSString*)regionId
                                    sourceCidrIp:(NSString*)sourceCidrIp
                                      ipProtocol:(ECSIpProtocolType)ipProtocol
                                       portRange:(NSString*)portRange
                                          policy:(ECSPolicyType)policy
                                         nicType:(ECSNicType)nicType
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"authorizeSecurityGroup", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:8];
    [params setObject:@"AuthorizeSecurityGroup" forKey:@"Action"];
    [params setObject:securityGroupId forKey:@"SecurityGroupId"];
    [params setObject:regionId forKey:@"RegionId"];
    [params setObject:[ECSUtil stringFromIpProtocolType:ipProtocol ] forKey:@"IpProtocol"];
    [params setObject:portRange forKey:@"PortRange"];
    if (sourceCidrIp != nil) {
        [params setObject:sourceCidrIp forKey:@"SourceCidrIp"];
    }
    [params setObject:[ECSUtil stringFromPolicyType:policy] forKey:@"Policy"];

    [params setObject:[ECSUtil stringFromNicType:nicType] forKey:@"NicType"];
    
    
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}

-(void)describeSecurityGroupAttributeWithSecurityGroupId:(NSString*)securityGroupId
                                                regionId:(NSString*)regionId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"describeSecurityGroupAttribute", nil];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:3];
    [params setObject:@"DescribeSecurityGroupAttribute" forKey:@"Action"];
    [params setObject:securityGroupId forKey:@"SecurityGroupId"];
    [params setObject:regionId forKey:@"RegionId"];
    
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)describeSecurityGroupAttributeWithSecurityGroupId:(NSString*)securityGroupId
                                                regionId:(NSString*)regionId
                                                 nicType:(ECSNicType)nicType
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"describeSecurityGroupAttribute", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:4];
    [params setObject:@"DescribeSecurityGroupAttribute" forKey:@"Action"];
    [params setObject:securityGroupId forKey:@"SecurityGroupId"];
    [params setObject:regionId forKey:@"RegionId"];
    [params setObject:[ECSUtil stringFromNicType:nicType] forKey:@"NicType"];
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}

-(void)describeSecurityGroupsWithRegionId:(NSString*)regionId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"describeSecurityGroups", nil];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:2];
    [params setObject:@"DescribeSecurityGroups" forKey:@"Action"];
    [params setObject:regionId forKey:@"RegionId"];
    
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)describeSecurityGroupsWithRegionId:(NSString*)regionId
                               pageNumber:(int)pageNumber
                                 pageSize:(int) pageSize
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"describeSecurityGroups", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:4];
    [params setObject:@"DescribeSecurityGroups" forKey:@"Action"];
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
-(void)revokeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                     regionId:(NSString*)regionId
                                sourceGroupId:(NSString*)sourceGroupId
                                   ipProtocol:(ECSIpProtocolType)ipProtocol
                                    portRange:(NSString*)portRange
                                       policy:(ECSPolicyType)policy
                                      nicType:(ECSNicType)nicType
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"revokeSecurityGroup", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:8];
    [params setObject:@"RevokeSecurityGroup" forKey:@"Action"];
    
    [params setObject:securityGroupId forKey:@"SecurityGroupId"];
    [params setObject:regionId forKey:@"RegionId"];
    [params setObject:[ECSUtil stringFromIpProtocolType:ipProtocol ] forKey:@"IpProtocol"];
    [params setObject:portRange forKey:@"PortRange"];
    if (sourceGroupId != nil) {
        [params setObject:sourceGroupId forKey:@"SourceGroupId"];
    }
    [params setObject:[ECSUtil stringFromPolicyType:policy] forKey:@"Policy"];
    [params setObject:[ECSUtil stringFromNicType:nicType] forKey:@"NicType"];
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}
-(void)revokeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                     regionId:(NSString*)regionId
                                 sourceCidrIp:(NSString*)sourceCidrIp
                                   ipProtocol:(ECSIpProtocolType)ipProtocol
                                    portRange:(NSString*)portRange
                                       policy:(ECSPolicyType)policy
                                      nicType:(ECSNicType)nicType
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"revokeSecurityGroup", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:8];
    [params setObject:@"RevokeSecurityGroup" forKey:@"Action"];
    [params setObject:securityGroupId forKey:@"SecurityGroupId"];
    [params setObject:regionId forKey:@"RegionId"];
    [params setObject:[ECSUtil stringFromIpProtocolType:ipProtocol ] forKey:@"IpProtocol"];
    [params setObject:portRange forKey:@"PortRange"];
    if (sourceCidrIp != nil) {
        [params setObject:sourceCidrIp forKey:@"SourceCidrIp"];
    }
    [params setObject:[ECSUtil stringFromPolicyType:policy] forKey:@"Policy"];
    [params setObject:[ECSUtil stringFromNicType:nicType] forKey:@"NicType"];
    [self invokeNoResultWithHttpMethod:HttpMethod_GET params:params userInfo:userInfo];
    [params release];
}

-(void)revokeSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                   ipProtocol:(ECSIpProtocolType)ipProtocol
                                    portRange:(NSString*)portRange
                                sourceGroupId:(NSString*)sourceGroupId
                                 sourceCidrIp:(NSString*)sourceCidrIp
                                       policy:(NSString*)policy
                                      nicType:(ECSNicType)nicType
{
    
}
-(void)deleteSecurityGroupWithSecurityGroupId:(NSString*)securityGroupId
                                     regionId:(NSString*)regionId
{
    NSArray *keys = [NSArray arrayWithObjects:@"method",nil];
    NSArray *objs = [NSArray arrayWithObjects:@"deleteSecurityGroup", nil];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    OrderedDictionary * params =[[OrderedDictionary alloc] initWithCapacity:3];
    [params setObject:@"DeleteSecurityGroup" forKey:@"Action"];
    [params setObject:securityGroupId forKey:@"SecurityGroupId"];
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
        if ([strMethod isEqualToString:@"createSecurityGroup"]) {
            
            if ([self.delegate respondsToSelector:@selector(createSecurityGroupFinished:result:)]) {
                ECSCreateSecurityGroupResult * result = [[ECSCreateSecurityGroupResult alloc] initWithXMLData:rm.content];
                [self.delegate createSecurityGroupFinished:self result:result];
                [result release];
                
            }
            
        }
        if ([strMethod isEqualToString:@"authorizeSecurityGroup"]) {
            
            if ([self.delegate respondsToSelector:@selector(authorizeSecurityGroupFinished:result:)]) {
                ECSResult * result = [[ECSResult alloc] initWithXMLData:rm.content];
                [self.delegate authorizeSecurityGroupFinished:self result:result.requestId];
                [result release];
                
            }
            
        }
        if ([strMethod isEqualToString:@"describeSecurityGroupAttribute"]) {
        
            if ([self.delegate respondsToSelector:@selector(describeSecurityGroupAttributeFinished:result:)]) {
                ECSDescribeSecurityGroupAttributeResult * result = [[ECSDescribeSecurityGroupAttributeResult alloc] initWithXMLData:rm.content];
                [self.delegate describeSecurityGroupAttributeFinished:self result:result];
                [result release];
            
            }
        
        }
    if ([strMethod isEqualToString:@"describeSecurityGroups"]) {
        
        if ([self.delegate respondsToSelector:@selector(describeSecurityGroupsFinished:result:)]) {
            ECSDescribeSecurityGroupsResult * result = [[ECSDescribeSecurityGroupsResult alloc] initWithXMLData:rm.content];
            [self.delegate describeSecurityGroupsFinished:self result:result];
            [result release];
            
        }
        
    }
    if ([strMethod isEqualToString:@"revokeSecurityGroup"]) {
        
        if ([self.delegate respondsToSelector:@selector(revokeSecurityGroupFinished:result:)]) {
            ECSResult * result = [[ECSResult alloc] initWithXMLData:rm.content];
            [self.delegate revokeSecurityGroupFinished:self result:result.requestId];
            [result release];
            
        }
        
    }
    if ([strMethod isEqualToString:@"deleteSecurityGroup"]) {
        
        if ([self.delegate respondsToSelector:@selector(deleteSecurityGroupFinished:result:)]) {
            ECSResult * result = [[ECSResult alloc] initWithXMLData:rm.content];
            [self.delegate deleteSecurityGroupFinished:self result:result.requestId];
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
        if ([strMethod isEqualToString:@"createSecurityGroup"]) {
            
            if ([self.delegate respondsToSelector:@selector(createSecurityGroupFailed:error:)]) {
                [self.delegate createSecurityGroupFailed:self error:error];
                
            }
            
        }
        if ([strMethod isEqualToString:@"authorizeSecurityGroup"]) {
            
            if ([self.delegate respondsToSelector:@selector(authorizeSecurityGroupFailed:error:)]) {
                [self.delegate authorizeSecurityGroupFailed:self error:error];
                
            }
            
        }
        if ([strMethod isEqualToString:@"describeSecurityGroupAttribute"]) {
            
            if ([self.delegate respondsToSelector:@selector(describeSecurityGroupAttributeFailed:error:)]) {
                [self.delegate describeSecurityGroupAttributeFailed:self error:error];
                
            }
            
        }
        if ([strMethod isEqualToString:@"describeSecurityGroups"]) {
            
            if ([self.delegate respondsToSelector:@selector(describeSecurityGroupsFailed:error:)]) {
                [self.delegate describeSecurityGroupsFailed:self error:error];
                
            }
            
        }
        if ([strMethod isEqualToString:@"revokeSecurityGroup"]) {
            
            if ([self.delegate respondsToSelector:@selector(revokeSecurityGroupFailed:error:)]) {
                [self.delegate revokeSecurityGroupFailed:self error:error];
                
            }
            
        }
        if ([strMethod isEqualToString:@"deleteSecurityGroup"]) {
            
            if ([self.delegate respondsToSelector:@selector(deleteSecurityGroupFailed:error:)]) {
                [self.delegate deleteSecurityGroupFailed:self error:error];
                
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
    if ([self.delegate respondsToSelector:@selector(ECSSecurityOperationNetworkError:error:)])
    {
        ECSError * error = [ECSError ECSErrorWithErrorCode:@"network failed"
                                                   message:@""
                                                 requestId:@""
                                                    hostId:@""];
        [self.delegate ECSSecurityOperationNetworkError:self error:error];
        
    }
}
@end
