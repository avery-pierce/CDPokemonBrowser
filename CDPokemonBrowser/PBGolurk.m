//
//  PBGolurk.m
//  Pokemon Browser
//
//  Created by Avery Pierce on 6/25/11.
//  Copyright 2011 UW Milwaukee. All rights reserved.
//

#import "PBGolurk.h"


@implementation PBGolurk
- (id)initWithEntity:(NSEntityDescription *)entity insertIntoManagedObjectContext:(NSManagedObjectContext *)context 
{
    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    if (self) {
        self.speciesName = @"Golurk";
        self.imageName = @"623Golurk";
    }
    return self;
}
@end
