//
//  ECSOperation.h
//  samples_ios
//
//  Created by zhang baocai on 7/9/13.
//
//

#import <Foundation/Foundation.h>
#import "HttpMethod.h"
#import "DefaultServiceClient.h"
#import "OrderedDictionary.h"
@class ServiceCredentials;
@class DefaultServiceClient;
@interface ECSOperation : NSObject
{
@private
    NSString * _endpoint;
    ServiceCredentials *_credentials;
    DefaultServiceClient *_client;
}
-(id) initWithEndPoint:(NSString * ) endpoint credentials:(ServiceCredentials *)credentials client:(DefaultServiceClient *)client;
-(void) invokeNoResultWithHttpMethod:(HttpMethod) httpMethod params:(OrderedDictionary*)params userInfo:(NSDictionary*)userInfo;

@end
