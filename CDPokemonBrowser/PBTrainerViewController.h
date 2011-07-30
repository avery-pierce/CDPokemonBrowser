//
//  PBTrainerViewController.h
//  Pokemon Browser
//
//  Created by Avery Pierce on 7/29/11.
//  Copyright 2011 UW Milwaukee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBTrainerViewController : UIViewController <UITextFieldDelegate>
{
    
    IBOutlet UITextField *_trainerNameBox;
    IBOutlet UISegmentedControl *_genderPicker;
}

- (IBAction)genderChanged:(id)sender;
@end
