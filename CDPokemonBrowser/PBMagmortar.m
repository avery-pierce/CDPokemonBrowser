//
//  PBMagmortar.m
//  Pokemon Browser
//
//  Created by Avery Pierce on 6/25/11.
//  Copyright 2011 UW Milwaukee. All rights reserved.
//

#import "PBMagmortar.h"


@implementation PBMagmortar

- (id)initWithEntity:(NSEntityDescription *)entity insertIntoManagedObjectContext:(NSManagedObjectContext *)context 
{
    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    if (self) {
        self.speciesName = @"Magmortar";
        self.imageName = @"467Magmortar";
    }
    return self;
}

@end
