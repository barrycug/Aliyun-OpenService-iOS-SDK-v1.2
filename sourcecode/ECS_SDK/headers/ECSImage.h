//
//  ECSImage.h
//  samples_ios
//
//  Created by zhang baocai on 8/28/13.
//
//

#import <Foundation/Foundation.h>

@interface ECSImage : NSObject
{
@private
    NSString *_imageId;
    long      _size;
    NSString *_architecture;
    NSString *_osName;
    NSString *_imageOwnerAlias;
    NSString *_platform;
    NSString *_description;
    NSString *_imageVersion;
}
@property(nonatomic,retain)NSString *imageId;
@property(nonatomic,assign)long      size;
@property(nonatomic,retain)NSString *architecture;
@property(nonatomic,retain)NSString *osName;
@property(nonatomic,retain)NSString *imageOwnerAlias;
@property(nonatomic,retain)NSString *platform;
@property(nonatomic,retain)NSString *description;
@property(nonatomic,retain)NSString *imageVersion;
-(id)initWithImageId:(NSString *)imageId
                size:(long)size
        architecture:(NSString *)architecture
              osName:(NSString *)osName
     imageOwnerAlias:imageOwnerAlias
            platform:(NSString *)platform
         description:(NSString *)description
        imageVersion:(NSString *)imageVersion;
@end
