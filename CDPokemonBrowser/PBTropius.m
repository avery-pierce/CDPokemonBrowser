//
//  PBTropius.m
//  Pokemon Browser
//
//  Created by Avery Pierce on 6/25/11.
//  Copyright 2011 UW Milwaukee. All rights reserved.
//

#import "PBTropius.h"


@implementation PBTropius

- (id)initWithEntity:(NSEntityDescription *)entity insertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    if (self)
    {
        self.speciesName = @"Tropius";
        self.imageName = @"357Tropius";
    }
    return self;
}

@end
