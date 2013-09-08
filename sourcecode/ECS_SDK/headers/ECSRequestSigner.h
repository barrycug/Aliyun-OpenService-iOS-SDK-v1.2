//
//  ECSRequestSigner.h
//  samples_ios
//
//  Created by zhang baocai on 7/9/13.
//
//

#import <Foundation/Foundation.h>
#import "IRequestSigner.h"
@class ServiceCredentials;
@protocol IServiceSignature;
@interface ECSRequestSigner : NSObject<IRequestSigner>
{
@private
    HttpMethod _method;
    ServiceCredentials *_credentials;
}
/**
 初始化函数
 @param method HttpMethod
 @param credentials ServiceCredentials
 */

-(id) initWithHttpMethod:(HttpMethod )method credentials:(ServiceCredentials *)credentials;
@end
