//
//  ECSImage.m
//  samples_ios
//
//  Created by zhang baocai on 8/28/13.
//
//

#import "ECSImage.h"

@implementation ECSImage
@synthesize imageId= _imageId;
@synthesize size=   _size;
@synthesize architecture = _architecture;
@synthesize osName = _osName;
@synthesize imageOwnerAlias = _imageOwnerAlias;
@synthesize platform = _platform;
@synthesize description = _description;
@synthesize imageVersion = _imageVersion;
-(void)dealloc
{
    [_imageId release];_imageId = nil;
    [_architecture release];_architecture = nil;
    [_osName release];_osName = nil;
    [_imageOwnerAlias release];_imageOwnerAlias = nil;
    [_platform release];_platform = nil;
    [_description release];_description = nil;
    [_imageVersion release];_imageVersion = nil;
    [super dealloc];
}
-(id)initWithImageId:(NSString *)imageId
                size:(long)size
        architecture:(NSString *)architecture
              osName:(NSString *)osName
     imageOwnerAlias:imageOwnerAlias
            platform:(NSString *)platform
         description:(NSString *)description
        imageVersion:(NSString *)imageVersion
{
    if (self = [super init]) {
        _imageId= [imageId retain];
        _size=   size;
        _architecture = [architecture retain];
        _osName = [osName retain];
        _imageOwnerAlias = [imageOwnerAlias retain];
        _platform = [platform retain];
        _description = [description retain];
        _imageVersion = [imageVersion retain];
    }
    return self;
}
@end
