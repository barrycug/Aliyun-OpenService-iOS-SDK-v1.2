//
//  NSArray+ECSPermissions.m
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import "NSArray+ECSPermissions.h"
#import "TBXML.h"
#import "ECSPermission.h"
#import "ECSUtil.h"
@implementation NSArray (ECSPermissions)
-(id)initWithECSPermissionsXMLData:(NSData*)data
{
    NSMutableArray * innerArray =[[NSMutableArray alloc] initWithCapacity:5];
    if (data != nil)
    {
        TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
        TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
        if (rootXMLElement != NULL) {
            
            TBXMLElement *permissionsXMLElement = [TBXML childElementNamed:@"Permissions" parentElement: rootXMLElement];
            if (permissionsXMLElement != NULL) {
                TBXMLElement *permissionXMLElement = [TBXML childElementNamed:@"Permission" parentElement:permissionsXMLElement];
                while (permissionXMLElement != NULL) {
                    ECSIpProtocolType ipProtocolType = ECSIpProtocolType_TCP;
                    ECSNicType nicType = ECSNicType_Internet;
                    NSString *policy = @"";
                    NSString *portRange= @"";
                    NSString *sourceCidrIp= @"";
                    NSString *sourceGroupId= @"";
                    TBXMLElement *ipProtocolTypeXMLElement = [TBXML childElementNamed:@"IpProtocol" parentElement:permissionXMLElement];
                    if (ipProtocolTypeXMLElement != NULL) {
                        NSString *strIpProtocol = [TBXML textForElement:ipProtocolTypeXMLElement];
                        ipProtocolType = [ECSUtil stringToIpProtocolType:strIpProtocol];
                    }
                    TBXMLElement *nicTypeXMLElement = [TBXML childElementNamed:@"NicType" parentElement:permissionXMLElement];
                    if (nicTypeXMLElement != NULL) {
                        NSString *strNicType = [TBXML textForElement:nicTypeXMLElement];
                        nicType = [ECSUtil stringToNicType:strNicType];
                    }
                    TBXMLElement *policyXMLElement = [TBXML childElementNamed:@"Policy" parentElement:permissionXMLElement];
                    if (policyXMLElement != NULL) {
                        policy = [[TBXML textForElement:policyXMLElement] retain];
                        
                    }
                    TBXMLElement *portRangeXMLElement = [TBXML childElementNamed:@"PortRange" parentElement:permissionXMLElement];
                    if (portRangeXMLElement != NULL) {
                        portRange = [[TBXML textForElement:portRangeXMLElement] retain];
                        
                    }
                    TBXMLElement *sourceCidrIpXMLElement = [TBXML childElementNamed:@"SourceCidrIp" parentElement:permissionXMLElement];
                    if (sourceCidrIpXMLElement != NULL) {
                        sourceCidrIp = [[TBXML textForElement:sourceCidrIpXMLElement] retain];
                        
                    }
                    TBXMLElement *sourceGroupIdXMLElement = [TBXML childElementNamed:@"SourceGroupId" parentElement:permissionXMLElement];
                    if (sourceGroupIdXMLElement != NULL) {
                        sourceGroupId = [[TBXML textForElement:sourceGroupIdXMLElement] retain];
                        
                    }
                    ECSPermission * permission = [[ECSPermission alloc] initWithIpProtocolType:ipProtocolType nicType:nicType policy:policy portRange:portRange sourceCidrIp:sourceCidrIp sourceGroupId:sourceGroupId];
                    [innerArray addObject:permission];
                    [permission release];
                    permissionXMLElement = permissionXMLElement->nextSibling;
                }
                
            }
            
        }
        [tbxml release];
        tbxml = nil;
    }
    
    if(self = [self initWithArray:innerArray ])
    {
        ;
    }
    [innerArray release];
    return self;
}
@end
