//
//  ECSDescribeInstanceStatusResult.m
//  samples_ios
//
//  Created by zhang baocai on 9/1/13.
//
//

#import "ECSDescribeInstanceStatusResult.h"
#import "TBXML.h"
#import "NSArray+ECSInstanceStatuses.h"
@implementation ECSDescribeInstanceStatusResult
@synthesize instanceStatuses = _instanceStatuses;
@synthesize pageNumber = _pageNumber;
@synthesize pageSize = _pageSize;
@synthesize totalCount = _totalCount;
-(void)dealloc
{
    [_instanceStatuses release];_instanceStatuses = nil;
    [super dealloc];
}
-(id)initWithXMLData:(NSData*)data
{
    if (self = [super initWithXMLData:data]) {
        if (data != nil)
        {
            TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
            TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
            if (rootXMLElement != NULL) {
                _instanceStatuses = [[NSArray alloc] initWithECSInstanceStatusesXMLData:data];
                TBXMLElement *pageNumberXMLElement = [TBXML childElementNamed:@"PageNumber" parentElement:rootXMLElement];
                NSString* strPageNumber = [TBXML textForElement:pageNumberXMLElement];
                _pageNumber = [strPageNumber intValue];
                
                TBXMLElement *pageSizeXMLElement = [TBXML childElementNamed:@"PageSize" parentElement:rootXMLElement];
                NSString* strPageSize = [TBXML textForElement:pageSizeXMLElement];
                _pageSize= [strPageSize intValue];
                
                TBXMLElement *totalCountXMLElement = [TBXML childElementNamed:@"TotalCount" parentElement:rootXMLElement];
                NSString *strTotalCount = [TBXML textForElement:totalCountXMLElement];
                _totalCount = [strTotalCount intValue];
                
            }
        }
    }
    return self;
}
@end
