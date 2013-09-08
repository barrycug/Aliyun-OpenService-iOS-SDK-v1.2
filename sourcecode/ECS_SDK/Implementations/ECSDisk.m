//
//  ECSDisk.m
//  samples_ios
//
//  Created by zhang baocai on 9/4/13.
//
//

#import "ECSDisk.h"

@implementation ECSDisk
@synthesize diskId = _diskId;
@synthesize type = _type;
@synthesize size = _size;
-(void)dealloc
{
    [_diskId release];_diskId = nil;
    [super dealloc];
}
-(id) initWithDiskId:(NSString*)diskId size:(long)size type:(ECSDiskType)type
{
    if (self = [super init]) {
        _diskId = [diskId retain];
        _size = size;
        _type = type;
    }
    return self;
}
@end
