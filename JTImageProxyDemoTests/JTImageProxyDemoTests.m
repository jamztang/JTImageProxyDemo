//
//  JTImageProxyDemoTests.m
//  JTImageProxyDemoTests
//
//  Created by Man Sze Lo on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "JTImageProxyDemoTests.h"
#import "UIImage+JTImageProxy.h"
#import "JTImageProxy.h"

@implementation JTImageProxyDemoTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
//    STFail(@"Unit tests are not implemented yet in JTImageProxyDemoTests");
}

- (void)testProxy
{
    NSURL *imageURL = [NSURL URLWithString:@"http://reserve.apple.com/rprcustomer/8227/images/reserve_pu_store_landing_feature_default.jpg"];
    UIImage <JTImageProxy> *image = [UIImage imageWithURL:imageURL];
    
    STAssertTrue([image isProxy], nil, nil);
    STAssertEqualObjects([image URL], imageURL, nil, nil);
    
}

@end
