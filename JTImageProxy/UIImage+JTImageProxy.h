/*
 * This file is part of the JTImageProxy package.
 * (c) James Tang <mystcolor@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <UIKit/UIKit.h>

@protocol JTImageProxy;

@interface UIImage (JTImageProxy)

+ (UIImage <JTImageProxy> *)imageWithURL:(NSURL *)URL;

@end