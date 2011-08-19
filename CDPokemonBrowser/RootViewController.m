//
//  RootViewController.m
//  Pokemon Browser
//
//  Created by Avery Pierce on 6/24/11.
//  Copyright 2011 UW Milwaukee. All rights reserved.
//

#import "CDPokemonBrowserAppDelegate.h"

#import "RootViewController.h"
#import "PBPokemonDetail.h"

#import "PBTropius.h"
#import "PBMagmortar.h"
#import "PBGolurk.h"

@interface RootViewController ()
- (NSArray *)fetchPokemon;
@end

@implementation RootViewController

@synthesize managedObjectContext = _managedObjectContext;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Pokemon";
    
    // Get a reference to the managed object context
    _managedObjectContext = [(CDPokemonBrowserAppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext];
    [_managedObjectContext retain];
    NSEntityDescription *pokemon = [NSEntityDescription entityForName:@"Pokemon" inManagedObjectContext:_managedObjectContext];
//    
//    // insert the objects into the database
//    NSManagedObject *myTropius = [[NSManagedObject alloc] initWithEntity:pokemon insertIntoManagedObjectContext:_managedObjectContext];
//    NSManagedObject *myGolurk = [[NSManagedObject alloc] initWithEntity:pokemon insertIntoManagedObjectContext:_managedObjectContext];
//    NSManagedObject *myMagmortar = [[NSManagedObject alloc] initWithEntity:pokemon insertIntoManagedObjectContext:_managedObjectContext];
//    
//    [myTropius setValue:@"357Tropius" forKey:@"imageName"];
//    [myTropius setValue:@"Tropius" forKey:@"speciesName"];
//    [myGolurk setValue:@"623Golurk" forKey:@"imageName"];
//    [myGolurk setValue:@"Golrurk" forKey:@"speciesName"];
//    [myMagmortar setValue:@"467Magmortar" forKey:@"imageName"];
//    [myMagmortar setValue:@"Magmortar" forKey:@"speciesName"];
//    
//    // Save these managed objects to the database
    NSError *error = nil;
//    [_managedObjectContext save:&error];
//    if (error) NSLog(@"Error saving state: %@", error);
//    
//    // Balance the memory
//    [myTropius release];
//    [myGolurk release];
//    [myMagmortar release];
    
    // fetch the data from the database, and store it as an instance variable for later use.
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    fetch.entity = pokemon;
    fetch.fetchBatchSize = 50;
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"imageName" ascending:YES];
    fetch.sortDescriptors = [NSArray arrayWithObject:sort];
    
    _pokemonArray = [_managedObjectContext executeFetchRequest:fetch error:&error];
    [_pokemonArray retain];
    if (error) NSLog(@"Error fetching data: %@", error);
    
    [fetch release];
    
    // fetch the pokemon and put them into the array
#warning uncomment this line for final build
//    _pokemonArray = [self fetchPokemon];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
 
// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Do any necessary calculations, then return the number of sections.
    return 1;
}

/*
// Customize the section header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // Decide what the section is going to be
    NSString *headerString;
    switch (section) {
        case 0:
            headerString = @"My First Section";
            break;
        case 1:
            headerString = @"This is another section";
            break;
        default:
            headerString = [NSString stringWithFormat:@"Section %i", section];
            break;
    }
    return headerString;
}
 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_pokemonArray count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell.
//    NSArray *results = _pokemonArray;    
    
    // Get a reference to the pokemon we need
    NSManagedObject *myPokemon = [_pokemonArray objectAtIndex:indexPath.row];
    
    // Update the cell image with the pokemon's image
    cell.imageView.image = [UIImage imageNamed:[myPokemon valueForKey:@"imageName"]];
    
    // Set the text label
    cell.textLabel.text = [myPokemon valueForKey:@"speciesName"];
    int currentHP = [[myPokemon valueForKey:@"currentHP"] intValue];
    int maxHP = [[myPokemon valueForKey:@"maxHP"] intValue];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"HP: %i/%i", currentHP, maxHP];
    
    // set accessory
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

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
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    // We want the pokemon no matter what
    PBManagedPokemon *myPokemon = [_pokemonArray objectAtIndex:indexPath.row];

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        PBPokemonDetail *detailViewController = [[PBPokemonDetail alloc] initWithNibName:@"PBPokemonDetail" bundle:nil];
        detailViewController.managedObjectContext = _managedObjectContext;
        
        detailViewController.pokemon = myPokemon;
        
        // Pass the selected object to the new view controller.
        [self.navigationController pushViewController:detailViewController animated:YES];
        [detailViewController release];
    }
    else
    {
        // detail viewController
        PBPokemonDetail *detail= (PBPokemonDetail *)[self.splitViewController.viewControllers objectAtIndex:1];
        detail.managedObjectContext = _managedObjectContext;
        detail.pokemon = myPokemon;
    }
    */
    
    // We want the pokemon no matter what
    NSManagedObject *myPokemon = [_pokemonArray objectAtIndex:indexPath.row];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        PBPokemonDetail *detailViewController = [[PBPokemonDetail alloc] initWithNibName:@"PBPokemonDetail" bundle:nil];
        detailViewController.managedObjectContext = _managedObjectContext;
        
        detailViewController.pokemon = myPokemon;
        
        // Pass the selected object to the new view controller.
        [self.navigationController pushViewController:detailViewController animated:YES];
        [detailViewController release];
    }
    else
    {
        // detail viewController
        PBPokemonDetail *detail= (PBPokemonDetail *)[self.splitViewController.viewControllers objectAtIndex:1];
        detail.managedObjectContext = _managedObjectContext;
        detail.pokemon = myPokemon;
    }
}

- (NSArray *)fetchPokemon
{
    // Do a fetch on the database so we can get all the pokemon.
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *pokemonEntity = [NSEntityDescription entityForName:@"Pokemon" inManagedObjectContext:_managedObjectContext];
    fetch.entity = pokemonEntity;
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"speciesName" ascending:YES];
    fetch.sortDescriptors = [NSArray arrayWithObject:sort];
    
    NSError *error = nil;
    NSArray *results = [_managedObjectContext executeFetchRequest:fetch error:&error];
    
    if (error) NSLog(@"A fetch error occured: %@", error);
    [fetch release];
    
    return results;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    // balance the _pokemon memory.
    [_pokemonArray release];
    [_managedObjectContext release];
    [super dealloc];
}

@end
