//
//  PBPokemonDetail.h
//  Pokemon Browser
//
//  Created by Avery Pierce on 6/25/11.
//  Copyright 2011 UW Milwaukee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PBManagedPokemon;

@interface PBPokemonDetail : UIViewController <UISplitViewControllerDelegate, UIPopoverControllerDelegate> {
    PBManagedPokemon *_myPokemon;
    NSManagedObjectContext *_managedObjectContext;
    
    IBOutlet UIImageView *_imageView;
    IBOutlet UILabel *_speciesLabel;
    IBOutlet UILabel *_nicknameLabel;
    IBOutlet UILabel *_HPLabel;
    IBOutlet UIProgressView *_HPBar;
    IBOutlet UIToolbar *_toolbar;
}
// PBPokemonDetail.h
@property (nonatomic, retain) PBManagedPokemon *pokemon;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

- (IBAction)btnHit:(id)sender;
- (IBAction)btnHeal:(id)sender;
@end
