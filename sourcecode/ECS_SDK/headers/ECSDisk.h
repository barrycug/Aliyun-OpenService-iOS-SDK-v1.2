//
//  ECSDisk.h
//  samples_ios
//
//  Created by zhang baocai on 9/4/13.
//
//

#import <Foundation/Foundation.h>
#import "ECSBaseType.h"
/*
 <Disk>
 <DiskId>6004-10072550</DiskId>
 <Size>50</Size>
 <Type>system</Type>
 </Disk>
 */
@interface ECSDisk : NSObject
{
    NSString *_diskId;
    long _size;
    ECSDiskType _type;
}
@property(nonatomic,retain)NSString *diskId;
@property(nonatomic,assign)long size;
@property(nonatomic,assign)ECSDiskType type;
-(id) initWithDiskId:(NSString*)diskId size:(long)size type:(ECSDiskType)type;
@end
