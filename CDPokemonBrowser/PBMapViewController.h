//
//  PBMapViewController.h
//  Pokemon Browser
//
//  Created by Avery Pierce on 7/7/11.
//  Copyright 2011 UW Milwaukee. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PBMapViewController : UIViewController <UIScrollViewDelegate> {
    
    IBOutlet UIScrollView *_scrollView;
    UIImageView *_imageView;
}

@end
