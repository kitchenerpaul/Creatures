//
//  ViewController.m
//  MCMS
//
//  Created by Paul Kitchener on 10/6/15.
//  Copyright © 2015 Paul Kitchener. All rights reserved.
//

#import "ViewController.h"
#import "CreatureViewController.h"
#import "MagicalCreature.h"
#import "BattleViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *creatureTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (weak, nonatomic) IBOutlet UITextField *addCreatureTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *battleButton;

@property NSMutableArray *creatures;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self populateCreaturesArray];

    self.creatureTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}

-(void)populateCreaturesArray {

    NSMutableArray *accessories1 = [NSMutableArray arrayWithObjects:@"Gun", @"Bigger Gun", @"Biggest Gun", nil];
    NSMutableArray *accessories2 = [NSMutableArray arrayWithObjects:@"Hot Fire", @"Hotter Fire", @"Hottest Fire", nil];
    NSMutableArray *accessories3 = [NSMutableArray arrayWithObjects:@"Invisibility", @"More Invisibility", @"Most Invisibility", nil];
    NSMutableArray *accessories4 = [NSMutableArray arrayWithObjects:@"Sharp Teeth", @"Sharper Teeth", @"Sharpest Teeth", nil];
    NSMutableArray *accessories5 = [NSMutableArray arrayWithObjects:@"Poisonous Ink", @"Really Poisonous Ink", @"The Most Poisonous Ink Possible", nil];

    MagicalCreature *creature1 = [[MagicalCreature alloc]initWithFullName:@"Angry Alien" andDetail:@"I come from a distant planet. I do not like earth." andImage: [UIImage imageNamed:@"alien.png"] andMutableArray: accessories1];
    MagicalCreature *creature2 = [[MagicalCreature alloc]initWithFullName:@"Disturbed Dragon" andDetail:@"I want to breathe fire on everyone I encounter." andImage: [UIImage imageNamed:@"dragon.png"] andMutableArray:accessories2];
    MagicalCreature *creature3 = [[MagicalCreature alloc]initWithFullName:@"Ghastly Ghost" andDetail:@"I like hiding and scaring." andImage: [UIImage imageNamed:@"ghost.png"] andMutableArray:accessories3];
    MagicalCreature *creature4 = [[MagicalCreature alloc]initWithFullName:@"Gruesome Goblin" andDetail:@"I do not have a kind bone in my body." andImage: [UIImage imageNamed:@"goblin.png"] andMutableArray:accessories4];
    MagicalCreature *creature5 = [[MagicalCreature alloc]initWithFullName:@"Ominous Octopus" andDetail:@"I'm ominous. Enough said." andImage: [UIImage imageNamed:@"octopus.png"] andMutableArray:accessories5];

    self.creatures = [NSMutableArray arrayWithObjects:creature1, creature2, creature3, creature4, creature5, nil];
}

- (IBAction)onBattleButtonPressed:(id)sender {

    [self performSegueWithIdentifier:@"battleModalSegue" sender:sender];
}

- (IBAction)onAddButtonPressed:(id)sender {
    MagicalCreature *creature = [[MagicalCreature alloc]init];

    if (self.addCreatureTextField.text.length > 0) {
        creature.name = self.addCreatureTextField.text;
        [self.creatures addObject:creature];
        [self.creatureTableView reloadData];
        self.addCreatureTextField.text = @"";
        [self.view endEditing:YES];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.detail;
    cell.imageView.image = creature.creatureImage;

    return cell;
}

- (IBAction)unwindFromBattleVC:(UIStoryboardSegue *)sender {

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.creatureTableView indexPathForSelectedRow];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];

    if ([segue.identifier isEqualToString:@"battleModalSegue"]) {
        BattleViewController *bvc = segue.destinationViewController;
        bvc.allCreatures = self.creatures;
    } else {
        CreatureViewController *cvc = segue.destinationViewController;
        cvc.creature = creature;
    }
}



@end
