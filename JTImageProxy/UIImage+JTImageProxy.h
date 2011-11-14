//
//  UIImage+JTImageProxy.h
//  JTImageProxyDemo
//
//  Created by Man Sze Lo on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JTImageProxy;

@interface UIImage (JTImageProxy)

+ (UIImage <JTImageProxy> *)imageWithURL:(NSURL *)URL;

@end