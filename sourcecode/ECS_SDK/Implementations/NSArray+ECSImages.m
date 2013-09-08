//
//  NSArray+ECSImages.m
//  samples_ios
//
//  Created by zhang baocai on 9/1/13.
//
//

#import "NSArray+ECSImages.h"
#import "TBXML.h"
#import "ECSImage.h"
@implementation NSArray (ECSImages)
-(id)initWithECSImagesXMLData:(NSData*)data
{
    NSMutableArray * innerArray =[[NSMutableArray alloc] initWithCapacity:5];
    if (data != nil)
    {
        TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
        TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
        if (rootXMLElement != NULL) {
            
            TBXMLElement *imagesXMLElement = [TBXML childElementNamed:@"Images" parentElement: rootXMLElement];
            if (imagesXMLElement != NULL) {
                TBXMLElement *imageXMLElement = [TBXML childElementNamed:@"Image" parentElement:imagesXMLElement];
                while (imageXMLElement != NULL) {
                    NSString *imageId=@"";
                    long      size=0;
                    NSString *architecture=@"";
                    NSString *osName=@"";
                    NSString *imageOwnerAlias=@"";
                    NSString *platform=@"";
                    NSString *description=@"";
                    NSString *imageVersion=@"";
                    TBXMLElement *imageIdXMLElement = [TBXML childElementNamed:@"ImageId" parentElement:imageXMLElement];
                    if (imageIdXMLElement != NULL) {
                        imageId = [TBXML textForElement:imageIdXMLElement];
                    }
                    
                    TBXMLElement *sizeXMLElement = [TBXML childElementNamed:@"Size" parentElement:imageXMLElement];
                    if (sizeXMLElement != NULL) {
                        size = [[TBXML textForElement:sizeXMLElement] intValue];
                    }
                    
                    TBXMLElement *architectureXMLElement = [TBXML childElementNamed:@"Architecture" parentElement:imageXMLElement];
                    if (architectureXMLElement != NULL) {
                        architecture = [TBXML textForElement:architectureXMLElement];
                    }
                    
                    TBXMLElement *osNameXMLElement = [TBXML childElementNamed:@"OSName" parentElement:imageXMLElement];
                    if (osNameXMLElement != NULL) {
                        osName = [TBXML textForElement:osNameXMLElement];
                    }
                    
                    TBXMLElement *imageOwnerAliasXMLElement = [TBXML childElementNamed:@"ImageOwnerAlias" parentElement:imageXMLElement];
                    if (imageOwnerAliasXMLElement != NULL) {
                        imageOwnerAlias = [TBXML textForElement:imageOwnerAliasXMLElement];
                    }
                    
                    TBXMLElement *platformXMLElement = [TBXML childElementNamed:@"Platform" parentElement:imageXMLElement];
                    if (platformXMLElement != NULL) {
                        platform = [TBXML textForElement:platformXMLElement];
                    }
                    TBXMLElement *descriptionXMLElement = [TBXML childElementNamed:@"Description" parentElement:imageXMLElement];
                    if (descriptionXMLElement != NULL) {
                        description = [TBXML textForElement:descriptionXMLElement];
                    }
                    TBXMLElement *imageVersionXMLElement = [TBXML childElementNamed:@"ImageVersion" parentElement:imageXMLElement];
                    if (imageVersionXMLElement != NULL) {
                        imageVersion = [TBXML textForElement:imageVersionXMLElement];
                    }
                    ECSImage *image = [[ECSImage alloc] initWithImageId:imageId size:size architecture:architecture osName:osName imageOwnerAlias:imageOwnerAlias platform:platform description:description imageVersion:imageVersion];
                    [innerArray addObject:image];
                    [image release];
                    imageXMLElement = imageXMLElement->nextSibling;
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
