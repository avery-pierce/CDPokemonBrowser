//
//  PBTrainerViewController.m
//  Pokemon Browser
//
//  Created by Avery Pierce on 7/29/11.
//  Copyright 2011 UW Milwaukee. All rights reserved.
//

#import "PBTrainerViewController.h"

@interface PBTrainerViewController (PrivateMethods)
- (void)updateTrainerInfo;
- (void)doneEditing;
@end

@implementation PBTrainerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    
    self.title = @"Trainer Info";
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"trianer name: %@", [userDefaults objectForKey:@"trainerName"]);
    _trainerNameBox.text = [userDefaults objectForKey:@"trainerName"];
    
    if ([userDefaults boolForKey:@"trainerIsMale"])
    {
        // trainer is male
        // set the segmented control to the first index
        _genderPicker.selectedSegmentIndex = 0;
    }
    else
    {
        // trainer is female
        // set the segmented control to the second index
        _genderPicker.selectedSegmentIndex = 1;
    }
}

- (void)viewDidUnload
{
    [_genderPicker release];
    _genderPicker = nil;
    [_trainerNameBox release];
    _trainerNameBox = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self updateTrainerInfo];
    
    // remove the done button
    [self.navigationItem setRightBarButtonItem:nil animated:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // Create the done button
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneEditing)];
    
    // place it as the right bar button item
    [self.navigationItem setRightBarButtonItem:doneButton animated:YES];
    [doneButton release];
}

#pragma mark - Custom methods

- (IBAction)genderChanged:(id)sender 
{
    NSLog(@"gender changed");
    [self updateTrainerInfo];
}

- (void)doneEditing
{
    // stop editing the text box
    [_trainerNameBox resignFirstResponder];
    
    // save the data once more for good measure
    [self updateTrainerInfo];
}

- (void)updateTrainerInfo
{
    // get a reference to the user defaults
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    // Set the values to the userDefaults object
    BOOL trainerIsMale = (_genderPicker.selectedSegmentIndex == 0);
    [userDefaults setBool:trainerIsMale forKey:@"trainerIsMale"];
    NSString *trainerName = _trainerNameBox.text;
    [userDefaults setObject:trainerName forKey:@"trainerName"];
    
    NSLog(@"trainer name is set: %@", [userDefaults objectForKey:@"trainerName"]);
    
    // write the data out to disk
    [userDefaults synchronize];
}

- (void)dealloc {
    [_genderPicker release];
    [_trainerNameBox release];
    [super dealloc];
}
@end
