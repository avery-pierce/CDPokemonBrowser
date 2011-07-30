//
//  Pokemon.h
//  Pokemon Browser
//
//  Created by Avery Pierce on 7/28/11.
//  Copyright (c) 2011 UW Milwaukee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PBManagedPokemon : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * currentHP;
@property (nonatomic, retain) NSString * imageName;
@property (nonatomic, retain) NSNumber * maxHP;
@property (nonatomic, retain) NSString * nickname;
@property (nonatomic, retain) NSString * speciesName;

@property (nonatomic, readonly) UIImage *image;


- (void)takeDamage:(int)damageAmount;
- (void)fullyHeal;

@end
