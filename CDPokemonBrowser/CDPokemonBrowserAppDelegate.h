//
//  CDPokemonBrowserAppDelegate.h
//  CDPokemonBrowser
//
//  Created by Avery Pierce on 7/28/11.
//  Copyright 2011 UW Milwaukee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDPokemonBrowserAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
