//
//  CreatureViewController.m
//  MCMS
//
//  Created by Paul Kitchener on 10/6/15.
//  Copyright © 2015 Paul Kitchener. All rights reserved.
//

#import "CreatureViewController.h"
#import "BattleViewController.h"

@interface CreatureViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UITextField *editTextField;
@property (weak, nonatomic) IBOutlet UILabel *creatureDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;
@property (weak, nonatomic) IBOutlet UITableView *accessoriesTableView;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.editTextField.hidden = YES;

    self.creatureNameLabel.text = self.creature.name;
    self.creatureDetailLabel.text = self.creature.detail;
    self.creatureImageView.image = self.creature.creatureImage;

}

- (IBAction)onEditBarButtonPressed:(id)sender {

    if (self.editing) {

        self.editTextField.hidden = YES;
        self.editing = false;
        self.creatureNameLabel.hidden = NO;
        self.creatureNameLabel.text = self.editTextField.text;
        self.editButton.title = @"Edit";

    } else {

        self.editing = true;
        self.editTextField.hidden = NO;
        self.creatureNameLabel.hidden = YES;
        self.editButton.title = @"Done";
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creature.accessories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text = [self.creature.accessories objectAtIndex:indexPath.row];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


@end
