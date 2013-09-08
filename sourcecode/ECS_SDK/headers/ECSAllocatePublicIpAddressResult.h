//
//  ECSAllocatePublicIpAddressResult.h
//  samples_ios
//
//  Created by zhang baocai on 9/4/13.
//
//

#import "ECSResult.h"
/*
 <AllocatePublicIpAddressResponse>
 <IpAddress>115.28.48.105</IpAddress>
 <RequestId>78DEC09B-D041-4FAF-9563-895BEBCB99EA</RequestId>
 </AllocatePublicIpAddressResponse>
 */
@interface ECSAllocatePublicIpAddressResult : ECSResult
{
    NSString *_ipAddress;
}
@property(nonatomic,retain)NSString *ipAddress;
-(id) initWithXMLData:(NSData *)data;
@end
