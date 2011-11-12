//
//  ViewController.m
//  JTImageProxyDemo
//
//  Created by Man Sze Lo on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+JTImageProxy.h"
#import "JTImageProxy.h"

@implementation ViewController
@synthesize imageView, image, progressView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)setupImage {
//    NSURL *imageURL = [NSURL URLWithString:@"http://reserve.apple.com/rprcustomer/8227/images/reserve_pu_store_landing_feature_default.jpg"];
    
    NSURL *imageURL = [NSURL URLWithString:@"http://www.fas.org/irp/imint/DC_1M_LARGE300_2.jpg"];
    self.image = [UIImage imageWithURL:imageURL];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setupImage];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:JTImageProxyProgressDidUpdateNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {

                                                      if (image.error) {
                                                          self.imageView.backgroundColor = [UIColor redColor];
                                                      } else if (image.progress == 0) {
                                                          self.progressView.progress = 0;
                                                          self.imageView.backgroundColor = [UIColor whiteColor];
                                                      } else if (image.progress < 1) {
                                                          self.progressView.progress = image.progress;
                                                          self.imageView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:image.progress];
                                                      } else if (image.progress == 1) {                                                          NSLog(@"setting image %@", image);
                                                          self.imageView.image = image.image;
                                                      }
                                                      
                                                      NSLog(@"image.progress %f", image.progress);
                                                  }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark Action

- (IBAction)redownloadDidPress:(id)sender {
    self.imageView.image = nil;
    [self.image restartDownload];
}

@end
