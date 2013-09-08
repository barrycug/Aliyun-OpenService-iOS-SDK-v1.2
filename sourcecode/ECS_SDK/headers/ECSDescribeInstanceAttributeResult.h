//
//  ECSDescribeInstanceAttributeResult.h
//  samples_ios
//
//  Created by zhang baocai on 9/1/13.
//
//

#import "ECSResult.h"
#import "ECSBaseType.h"
@interface ECSDescribeInstanceAttributeResult : ECSResult
{
    NSString * _hostName;
    NSString * _imageId;
    NSString * _innerIpAddress;
    NSString * _instanceId;
    NSString * _instanceName;
    NSString * _instanceType;
    int _internetMaxBandwidthIn;
    int _internetMaxBandwidthOut;
    NSString * _publicIpAddress;
    NSString * _regionId;
    NSArray  * _securityGroupIds;
    NSString * _serialNumber;
    ECSInstanceStatusItemType _status;
    NSString * _vlanId;
    NSString * _zoneId;    
}
@property(nonatomic,retain)NSString * hostName;
@property(nonatomic,retain)NSString * imageId;
@property(nonatomic,retain)NSString * innerIpAddress;
@property(nonatomic,retain)NSString * instanceId;
@property(nonatomic,retain)NSString * instanceName;
@property(nonatomic,retain)NSString * instanceType;
@property(nonatomic,assign)int internetMaxBandwidthIn;
@property(nonatomic,assign)int internetMaxBandwidthOut;
@property(nonatomic,retain)NSString * publicIpAddress;
@property(nonatomic,retain)NSString * regionId;
@property(nonatomic,retain)NSArray  * securityGroupIds;
@property(nonatomic,retain)NSString * serialNumber;
@property(nonatomic,assign)ECSInstanceStatusItemType status;
@property(nonatomic,retain)NSString * vlanId;
@property(nonatomic,retain)NSString * zoneId;
-(id)initWithXMLData:(NSData*)data;
@end
