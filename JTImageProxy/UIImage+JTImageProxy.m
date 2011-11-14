/*
 * This file is part of the JTImageProxy package.
 * (c) James Tang <mystcolor@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

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
