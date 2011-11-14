//
//  JTImageProxy.h
//  JTImageProxyDemo
//
//  Created by Man Sze Lo on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JTImageProxy <NSObject>

- (NSURL *)URL;
- (float)expectedContentLength;
- (float)totalDownloadedSize;
- (CGFloat)progress;            // KVO observable
- (NSError *)error;
- (UIImage *)image;
- (void)restartDownload;

@optional
// Not implemented
- (void)cancelDownload;

@end

@interface JTImageProxy : NSObject <JTImageProxy>

@property (nonatomic, strong) NSURL *URL;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) float expectedContentLength;
@property (nonatomic, assign) float totalDownloadedSize;
@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, strong) NSError *error;
@property (nonatomic, strong) NSURLConnection *connection;

+ (JTImageProxy *)proxyWithURL:(NSURL *)URL;

@end