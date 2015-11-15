//
//  BattleViewController.m
//  MCMS
//
//  Created by Paul Kitchener on 10/7/15.
//  Copyright © 2015 Paul Kitchener. All rights reserved.
//

#import "BattleViewController.h"
#import "MagicalCreature.h"


@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIButton *exitButton;
@property (weak, nonatomic) IBOutlet UIButton *battleButton;

@property (weak, nonatomic) IBOutlet UIImageView *creatureOneImageView;
@property (weak, nonatomic) IBOutlet UIImageView *creatureTwoImageView;

@property (weak, nonatomic) IBOutlet UILabel *creatureOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatureTwoLabel;

@property MagicalCreature *creature1;
@property MagicalCreature *creature2;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self prepareBattleContestants];

}

-(void)prepareBattleContestants {
    int randomNumber1 = arc4random_uniform((int)self.allCreatures.count);
    MagicalCreature *creature1 = [self.allCreatures objectAtIndex:randomNumber1];
    self.creatureOneImageView.image = creature1.creatureImage;
    self.creatureOneLabel.text = creature1.name;
    self.creature1 = creature1;

    int randomNumber2 = arc4random_uniform((int)self.allCreatures.count);
    MagicalCreature *creature2 = [self.allCreatures objectAtIndex:randomNumber2];
    self.creatureTwoImageView.image = creature2.creatureImage;
    self.creatureTwoLabel.text = creature2.name;
    self.creature2 = creature2;
}

-(IBAction)onBattleButtonPressed:(id)sender {

    int randomNumber = arc4random_uniform(2)+1;
    NSString *winner;

    if (randomNumber == 1) {
        winner = [NSString stringWithFormat:@"%@ is the winner!", self.creature1.name];
    } else {
        winner = [NSString stringWithFormat:@"%@ is the winner!", self.creature2.name];
    }

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"BATTLE RESULT" message:winner preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *doneButton = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        if (randomNumber == 1) {
            self.creatureOneLabel.text = @"Winner";
            self.creatureTwoLabel.text = @"Loser";
        } else {
            self.creatureOneLabel.text = @"Loser";
            self.creatureTwoLabel.text = @"Winner";
        }
        
    }];

    [alertController addAction:doneButton];

    [self presentViewController:alertController animated:YES completion:nil];
}


@end
