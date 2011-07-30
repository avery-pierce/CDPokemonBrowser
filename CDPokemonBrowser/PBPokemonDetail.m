//
//  PBPokemonDetail.m
//  Pokemon Browser
//
//  Created by Avery Pierce on 6/25/11.
//  Copyright 2011 UW Milwaukee. All rights reserved.
//

#import "PBPokemonDetail.h"
#import "PBManagedPokemon.h"

@interface PBPokemonDetail (PrivateMethods)
- (void)updateInterface;
- (void)reloadPokemon;
@end

@implementation PBPokemonDetail

@synthesize pokemon = _myPokemon;
@synthesize managedObjectContext = _managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
// PBPokemonDetail.m
- (void)dealloc
{
    [_myPokemon release];
    [_imageView release];
    [_speciesLabel release];
    [_nicknameLabel release];
    [_HPLabel release];
    [_HPBar release];
    [_toolbar release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

// inside PBPokemonDetail.m
- (void)setPokemon:(PBManagedPokemon *)pokemon
{
    [_myPokemon release];
    [pokemon retain];
    _myPokemon = pokemon;
    
    [self reloadPokemon];
}

#pragma mark - split view delegate

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = aViewController.title;
    [_toolbar setItems:[NSArray arrayWithObject:barButtonItem] animated:YES];
}

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    [_toolbar setItems:nil animated:YES];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = _myPokemon.speciesName;
    [self reloadPokemon];    
}

- (void)viewDidUnload
{
    [_imageView release];
    _imageView = nil;
    [_speciesLabel release];
    _speciesLabel = nil;
    [_nicknameLabel release];
    _nicknameLabel = nil;
    [_HPLabel release];
    _HPLabel = nil;
    [_HPBar release];
    _HPBar = nil;
    [_toolbar release];
    _toolbar = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
//    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)updateInterface {
    _HPLabel.text = [NSString stringWithFormat:@"HP: %i/%i", [_myPokemon.currentHP intValue], [_myPokemon.maxHP intValue]];
    float currentHP = [_myPokemon.currentHP floatValue];
    float maxHP = [_myPokemon.maxHP floatValue];
    float percentHPRemaining =  currentHP/maxHP;
    
    _HPBar.progress = percentHPRemaining;
}

- (void)reloadPokemon;
{
    _imageView.image = _myPokemon.image;
    _speciesLabel.text = _myPokemon.speciesName;
    _nicknameLabel.text = _myPokemon.nickname;
    [self updateInterface];
}

- (IBAction)btnHit:(id)sender {
    [_myPokemon takeDamage:10];
    [self updateInterface];
    
    NSError *error = nil;
    [_managedObjectContext save:&error];
    if (error) NSLog(@"A save error occurred in pokemondetail view: %@", error);
}

- (IBAction)btnHeal:(id)sender {
    [_myPokemon fullyHeal];
    [self updateInterface];
    
    NSError *error = nil;
    [_managedObjectContext save:&error];
    if (error) NSLog(@"A save error occurred in pokemondetail view: %@", error);
}

@end
