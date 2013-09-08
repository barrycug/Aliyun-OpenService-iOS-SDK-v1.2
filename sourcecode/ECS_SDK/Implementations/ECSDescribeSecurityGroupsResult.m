//
//  ECSDescribeSecurityGroupsResult.m
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import "ECSDescribeSecurityGroupsResult.h"
#import "TBXML.h"
#import "NSArray+ECSSecurityGroups.h"
@implementation ECSDescribeSecurityGroupsResult
@synthesize  securityGroups = _securityGroups;
@synthesize  pageNumber = _pageNumber;
@synthesize  pageSize = _pageSize;
@synthesize  regionId = _regionId;
@synthesize  totalCount = _totalCount;
-(void)dealloc
{
    [_securityGroups release]; _securityGroups = nil;
    [_regionId release]; _regionId = nil;
    [super dealloc];
}
-(id)initWithXMLData:(NSData *)data
{
    if (self = [super initWithXMLData:data]) {
        if (data != nil)
        {
            TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
            TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
            if (rootXMLElement != NULL) {
                
                _securityGroups = [[NSArray alloc] initWithECSSecurityGroupsXMLData:data];
                TBXMLElement * regionIdXMLElement = [TBXML childElementNamed:@"RegionId" parentElement:rootXMLElement];
                if (regionIdXMLElement != NULL) {
                    _regionId = [[TBXML textForElement:regionIdXMLElement] retain];
                }
               
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
