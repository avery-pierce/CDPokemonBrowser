//
//  Pokemon.m
//  Pokemon Browser
//
//  Created by Avery Pierce on 7/28/11.
//  Copyright (c) 2011 UW Milwaukee. All rights reserved.
//

#import "PBManagedPokemon.h"


@implementation PBManagedPokemon
@dynamic currentHP;
@dynamic imageName;
@dynamic maxHP;
@dynamic nickname;
@dynamic speciesName;

- (UIImage *)image
{
    UIImage *myImage = [UIImage imageNamed:self.imageName];
    return myImage;
}

- (void)takeDamage:(int)damageAmount {
    int currentHP = [self.currentHP intValue];
    self.currentHP = [NSNumber numberWithInt:(currentHP - damageAmount)];
    
    if ([self.currentHP intValue] <= 0) {
        self.currentHP = [NSNumber numberWithInt:0];
    }
}

- (void)fullyHeal; {
    NSNumber *healedHP = [self.maxHP copy];
    self.currentHP = healedHP;
    [healedHP release];
}

@end
