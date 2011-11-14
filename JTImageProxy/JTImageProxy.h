/*
 * This file is part of the JTImageProxy package.
 * (c) James Tang <mystcolor@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

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