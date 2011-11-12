//
//  UIImage+JTImageProxy.m
//  JTImageProxyDemo
//
//  Created by Man Sze Lo on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UIImage+JTImageProxy.h"
#import "JTImageProxy.h"

@implementation UIImage (JTImageProxy)

static __strong NSMutableDictionary *_proxies;

+ (void)load {
    _proxies = [[NSMutableDictionary alloc] init];
}

+ (UIImage <JTImageProxy> *)imageWithURL:(NSURL *)URL {
    NSString *key = [URL absoluteString];
    UIImage <JTImageProxy> *proxy = [_proxies objectForKey:key];
    if ( ! proxy) {
        proxy = (UIImage <JTImageProxy> *)[JTImageProxy proxyWithURL:URL];
        [_proxies setObject:proxy forKey:key];
    }
    return proxy;
}

@end
