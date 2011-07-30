//
//  RootViewController.h
//  Pokemon Browser
//
//  Created by Avery Pierce on 6/24/11.
//  Copyright 2011 UW Milwaukee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
    NSArray *_pokemonArray;
    NSManagedObjectContext * _managedObjectContext;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
