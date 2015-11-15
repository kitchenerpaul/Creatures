//
//  MagicalCreature.m
//  MCMS
//
//  Created by Paul Kitchener on 10/6/15.
//  Copyright © 2015 Paul Kitchener. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithFullName:(NSString *)name andDetail:(NSString *)detail andImage:(UIImage *)creatureImage andMutableArray:(NSMutableArray *)accessories {
    
    self = [super init];

    if (self) {
        self.name = name;
        self.detail = detail;
        self.creatureImage = creatureImage;
        self.accessories = accessories;

    }
    return self;
}

@end
