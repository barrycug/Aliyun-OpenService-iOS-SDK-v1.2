//
//  ECSDescribeInstanceAttributeResult.m
//  samples_ios
//
//  Created by zhang baocai on 9/1/13.
//
//

#import "ECSDescribeInstanceAttributeResult.h"
#import "NSArray+ECSSecurityGroupIds.h"
#import "TBXML.h"
#import "ECSUtil.h"
@implementation ECSDescribeInstanceAttributeResult
@synthesize   hostName = _hostName;
@synthesize   imageId = _imageId;
@synthesize   innerIpAddress = _innerIpAddress;
@synthesize   instanceId = _instanceId;
@synthesize   instanceName = _instanceName;
@synthesize   instanceType = _instanceType;
@synthesize   internetMaxBandwidthIn  = _internetMaxBandwidthIn;
@synthesize   internetMaxBandwidthOut = _internetMaxBandwidthOut;
@synthesize   publicIpAddress = _publicIpAddress;
@synthesize   regionId = _regionId;
@synthesize   securityGroupIds = _securityGroupIds;
@synthesize   serialNumber = _serialNumber;
@synthesize   status = _status;
@synthesize   vlanId = _vlanId;
@synthesize   zoneId = _zoneId;
-(void)dealloc
{
    [_hostName release];_hostName = nil;
    [_imageId release];_imageId = nil;
    [_innerIpAddress release];_innerIpAddress = nil;
    [_instanceId release];_instanceId = nil;
    [_instanceName release];_instanceName = nil;
    [_instanceType release];_instanceType = nil;
    [_publicIpAddress release];_publicIpAddress = nil;
    [_regionId release];_regionId = nil;
    [_securityGroupIds release];_securityGroupIds = nil;
    [_serialNumber release];_serialNumber = nil;
    [_vlanId release];_vlanId = nil;
    [_zoneId release];_zoneId = nil;


    [super dealloc];
}
/*
 <DescribeInstanceAttributeResponse>
 <HostName>AY130828101740048aeeeeee</HostName>
 <ImageId>rhel54.64.20110322.01.vhd</ImageId>
 <InnerIpAddress>
 <IpAddress>10.144.44.74</IpAddress>
 </InnerIpAddress>
 <InstanceId>AY130828101740048aee</InstanceId>
 <InstanceName>AY130828101740048aeeZ</InstanceName>
 <InstanceType>ecs.t1.xsmall</InstanceType>
 <InternetMaxBandwidthIn>-1</InternetMaxBandwidthIn>
 <InternetMaxBandwidthOut>1</InternetMaxBandwidthOut>
 <PublicIpAddress>
 <IpAddress>115.28.37.7</IpAddress>
 </PublicIpAddress>
 <RegionId>cn-qingdao-cm5-a01</RegionId>
 <SecurityGroupIds>
 <SecurityGroupId>G1355944407736541</SecurityGroupId>
 </SecurityGroupIds>
 <SerialNumber>d599f602-25b9-4d75-0ad1-f7d3689adc01</SerialNumber>
 <Status>Running</Status>
 <VlanId />
 <ZoneId>cn-qingdao-cm9002-a</ZoneId>
 <RequestId>0FBB26F3-329A-453E-AA07-224620473D8E</RequestId>
 </DescribeInstanceAttributeResponse>
 */

-(id)initWithXMLData:(NSData*)data
{
    if (self = [super initWithXMLData:data]) {
        if (data != nil)
        {
            TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
            TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
            if (rootXMLElement != NULL) {
                
                TBXMLElement *hostNameXMLElement = [TBXML childElementNamed:@"HostName" parentElement: rootXMLElement];
                if (hostNameXMLElement != NULL) {
                    _hostName = [[TBXML textForElement:hostNameXMLElement] retain];
                    
                }
                
                
                TBXMLElement *imageIdXMLElement = [TBXML childElementNamed:@"ImageId" parentElement: rootXMLElement];
                if (imageIdXMLElement != NULL) {
                    _imageId = [[TBXML textForElement:imageIdXMLElement] retain];
                    
                }
                
                
                TBXMLElement *innerIpAddressXMLElement = [TBXML childElementNamed:@"InnerIpAddress" parentElement: rootXMLElement];
                if (innerIpAddressXMLElement != NULL) {
                    TBXMLElement *inIpAddressXMLElement = [TBXML childElementNamed:@"IpAddress" parentElement: innerIpAddressXMLElement];
                    if (inIpAddressXMLElement != NULL) {
                        _innerIpAddress = [[TBXML textForElement:inIpAddressXMLElement] retain];
                    }
                }
                
                
                TBXMLElement *instanceIdXMLElement = [TBXML childElementNamed:@"InstanceId" parentElement: rootXMLElement];
                if (instanceIdXMLElement != NULL) {
                    _instanceId = [[TBXML textForElement:instanceIdXMLElement] retain];
                    
                }
                TBXMLElement *instanceNameXMLElement = [TBXML childElementNamed:@"InstanceName" parentElement: rootXMLElement];
                if (instanceNameXMLElement != NULL) {
                    _instanceName = [[TBXML textForElement:instanceNameXMLElement] retain];
                    
                }
                
                TBXMLElement *instanceTypeXMLElement = [TBXML childElementNamed:@"InstanceType" parentElement: rootXMLElement];
                if (instanceTypeXMLElement != NULL) {
                    _instanceType= [[TBXML textForElement:instanceTypeXMLElement] retain];
                    
                }
                
                TBXMLElement *internetMaxBandwidthInXMLElement = [TBXML childElementNamed:@"InternetMaxBandwidthIn" parentElement: rootXMLElement];
                if (internetMaxBandwidthInXMLElement != NULL) {
                    _internetMaxBandwidthIn= [[TBXML textForElement:internetMaxBandwidthInXMLElement] intValue];
                    
                }
                TBXMLElement *internetMaxBandwidthOutXMLElement = [TBXML childElementNamed:@"InternetMaxBandwidthOut" parentElement: rootXMLElement];
                if (internetMaxBandwidthOutXMLElement != NULL) {
                    _internetMaxBandwidthOut= [[TBXML textForElement:internetMaxBandwidthOutXMLElement] intValue];
                    
                }
                
                TBXMLElement *publicIpAddressXMLElement = [TBXML childElementNamed:@"PublicIpAddress" parentElement: rootXMLElement];
                if (publicIpAddressXMLElement != NULL) {
                    TBXMLElement *pIpAddressXMLElement = [TBXML childElementNamed:@"IpAddress" parentElement: publicIpAddressXMLElement];
                    if (pIpAddressXMLElement != NULL) {
                        _publicIpAddress = [[TBXML textForElement:pIpAddressXMLElement] retain];
                    }
                }
                /*
                 <RegionId>cn-qingdao-cm5-a01</RegionId>
                 <SecurityGroupIds>
                 <SecurityGroupId>G1355944407736541</SecurityGroupId>
                 </SecurityGroupIds>
                 <SerialNumber>d599f602-25b9-4d75-0ad1-f7d3689adc01</SerialNumber>
                 <Status>Running</Status>
                 <VlanId />
                 <ZoneId>cn-qingdao-cm9002-a</ZoneId>
                 */
                TBXMLElement *regionIdXMLElement = [TBXML childElementNamed:@"RegionId" parentElement: rootXMLElement];
                if (regionIdXMLElement != NULL) {
                    _regionId= [[TBXML textForElement:regionIdXMLElement] retain];
                    
                }
                _securityGroupIds = [[NSArray alloc] initWithECSSecurityGroupIdsXMLData:data];
                TBXMLElement *serialNumberXMLElement = [TBXML childElementNamed:@"SerialNumber" parentElement: rootXMLElement];
                if (serialNumberXMLElement != NULL) {
                    _serialNumber= [[TBXML textForElement:serialNumberXMLElement] retain];
                    
                }
                TBXMLElement *statusXMLElement = [TBXML childElementNamed:@"Status" parentElement:rootXMLElement];
                if (statusXMLElement != NULL) {
                    _status =[ECSUtil stringToInstanceStatusItemType:[TBXML textForElement:statusXMLElement]];
                }
                TBXMLElement *vlanIdXMLElement = [TBXML childElementNamed:@"VlanId" parentElement: rootXMLElement];
                if (vlanIdXMLElement != NULL) {
                    _vlanId= [[TBXML textForElement:vlanIdXMLElement] retain];
                    
                }
                TBXMLElement *zoneIdXMLElement = [TBXML childElementNamed:@"ZoneId" parentElement: rootXMLElement];
                if (zoneIdXMLElement != NULL) {
                    _zoneId= [[TBXML textForElement:zoneIdXMLElement] retain];
                    
                }
                
            }
            [tbxml release];
            tbxml = nil;
    }
    
    }
    return self;
}
@end
