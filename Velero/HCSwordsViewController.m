//
//  HCSwordsViewController.m
//  Velero
//
//  Created by Franco Cedillo on 5/21/13.
//  Copyright (c) 2013 HartasCuerdas. All rights reserved.
//

#import "HCSwordsViewController.h"
#import "HCSwordImageViewController.h"

@interface HCSwordsViewController ()
@property NSArray *swords;
@end

@implementation HCSwordsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.swords count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell Identifier";
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Feth Swords
    NSDictionary *sword = [self.swords objectAtIndex:[indexPath row]];
    // Configure the cell...
    [cell.textLabel setText:[sword objectForKey:@"Title"]];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    // Initialize Sword Image View Controller
    HCSwordImageViewController *swordImageViewController = [[HCSwordImageViewController alloc] initWithNibName:@"HCSwordImageViewController" bundle: [NSBundle mainBundle]];
    // Fetch and Set Sword Image
    NSDictionary *sword = [self.swords objectAtIndex:[indexPath row]];
    UIImage *swordImage = [UIImage imageNamed:[sword objectForKey:@"Cover"]];
    [swordImageViewController setSwordImage:swordImage];
    // Push View Controllerr onto Navigation Stack
    [self.navigationController pushViewController:swordImageViewController animated:YES];
}

- (void)setPirate:(NSString *)pirate {
    if (_pirate != pirate) {
        _pirate = pirate;
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Books" ofType:@"plist"];
        NSArray *pirates = [NSArray arrayWithContentsOfFile:filePath];
        for (int i = 0; i < [pirates count]; i++) {
            NSDictionary *pirateDictionary = [pirates objectAtIndex:i];
            NSString *tempPirate = [pirateDictionary objectForKey:@"Author"];
            if ([tempPirate isEqualToString:_pirate]) {
                self.swords = [pirateDictionary objectForKey:@"Books"];
            }
        }
    }
}

@end
