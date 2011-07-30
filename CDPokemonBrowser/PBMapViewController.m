//
//  PBMapViewController.m
//  Pokemon Browser
//
//  Created by Avery Pierce on 7/7/11.
//  Copyright 2011 UW Milwaukee. All rights reserved.
//

#import "PBMapViewController.h"

@interface PBMapViewController ()
- (void)centerImageInScrollView;
@end

@implementation PBMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [_imageView release];
    [_scrollView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _imageView = [[UIImageView alloc]
                  initWithImage:[UIImage imageNamed:@"pokemonMap.jpg"]];
    _scrollView.contentSize = _imageView.frame.size;
    [_scrollView addSubview:_imageView];
    _scrollView.minimumZoomScale = _scrollView.frame.size.width / _imageView.frame.size.width;
    _scrollView.maximumZoomScale = 1;
    [_scrollView setZoomScale:_scrollView.minimumZoomScale animated:NO];
}

- (void)viewDidUnload
{
    [_imageView release];
    _imageView = nil;
    [_scrollView release];
    _scrollView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

- (CGRect)centeredFrameForScrollView:(UIScrollView *)scroll andView:(UIView *)rView {
    CGSize boundsSize = scroll.bounds.size;
    CGRect frameToCenter = rView.frame;
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    }
    else {
        frameToCenter.origin.x = 0;
    }
    // center vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    }
    else {
        frameToCenter.origin.y = 0;
    }
    return frameToCenter;
}

- (void)centerImageInScrollView;
{
    _imageView.frame = [self centeredFrameForScrollView:_scrollView andView:_imageView];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
//    [self centerImageInScrollView];
}

@end
