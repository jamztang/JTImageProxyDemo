//
//  ViewController.h
//  JTImageProxyDemo
//
//  Created by Man Sze Lo on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JTImageProxy;

@interface ViewController : UIViewController
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UIProgressView *progressView;
@property (nonatomic, strong) UIImage <JTImageProxy> *image;

- (IBAction)redownloadDidPress:(id)sender;

@end
