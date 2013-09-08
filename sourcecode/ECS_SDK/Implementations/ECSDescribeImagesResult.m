//
//  ECSDescribeImagesResult.m
//  samples_ios
//
//  Created by zhang baocai on 8/28/13.
//
//

#import "ECSDescribeImagesResult.h"
#import "TBXML.h"
#import "NSArray+ECSImages.h"
/*
 <DescribeImagesResponse>
 
 <PageNumber>1</PageNumber>
 <PageSize>10</PageSize>
 <RegionId>cn-qingdao-cm5-a01</RegionId>
 <TotalCount>126</TotalCount>
 <RequestId>EC58ED01-6D87-4335-9E7A-32E9D553252E</RequestId>
 </DescribeImagesResponse>
 */
@implementation ECSDescribeImagesResult
@synthesize images = _images;
@synthesize pageNumber = _pageNumber;
@synthesize pageSize = _pageSize;
@synthesize regionId = _regionId;
@synthesize totalCount = _totalCount;
-(void)dealloc
{
    [_images release];_images = nil;
    [_regionId release];_regionId = nil;
    [super dealloc];
}
-(id)initWithXMLData:(NSData*)data
{
    if (self = [super initWithXMLData:data ])
    {
        if (data != nil)
        {
            TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
            TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
            if (rootXMLElement != NULL) {
                _images = [[NSArray alloc] initWithECSImagesXMLData:data];
                TBXMLElement *pageNumberXMLElement = [TBXML childElementNamed:@"PageNumber" parentElement:rootXMLElement];
                NSString* strPageNumber = [TBXML textForElement:pageNumberXMLElement];
                _pageNumber = [strPageNumber intValue];
                
                TBXMLElement *pageSizeXMLElement = [TBXML childElementNamed:@"PageSize" parentElement:rootXMLElement];
                NSString* strPageSize = [TBXML textForElement:pageSizeXMLElement];
                _pageSize= [strPageSize intValue];
                
                TBXMLElement *regionIdXMLElement = [TBXML childElementNamed:@"RegionId" parentElement:rootXMLElement];
                _regionId = [[TBXML textForElement:regionIdXMLElement] retain];
                
                TBXMLElement *totalCountXMLElement = [TBXML childElementNamed:@"TotalCount" parentElement:rootXMLElement];
                NSString *strTotalCount = [TBXML textForElement:totalCountXMLElement];
                _totalCount = [strTotalCount intValue];
                
            }
        }
        
    }
    return self;
}
@end
