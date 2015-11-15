//
//  MagicalCreature.h
//  MCMS
//
//  Created by Paul Kitchener on 10/6/15.
//  Copyright © 2015 Paul Kitchener. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *detail;
@property UIImage *creatureImage;

@property NSMutableArray *accessories;

-(instancetype)initWithFullName:(NSString *)name andDetail:(NSString *)detail andImage:(UIImage *)creatureImage andMutableArray:(NSMutableArray *)accessories;

@end
