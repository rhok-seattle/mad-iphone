//
//  FormTableViewController
//  mad
//
//  Created by Laurel Fan on 12/4/10.
//  Copyright 2010 Robot Co-op. All rights reserved.
//

#import "FormTableViewController.h"
#import "TextFieldTableViewCell.h"

@implementation FormTableViewController


@synthesize nibLoadedCell;

typedef enum {
  kFormName = 0,
  kFormAddress,
  kFormDamage,
  kFormSections
} FormSection;

typedef enum {
  kFormNameFirst = 0,
  kFormNameMiddle,
  kFormNameLast,
  kFormNameRows
} FormNameRow;

typedef enum {
  kFormAddressStreet = 0,
  kFormAddressCity,
  kFormAddressState,
  kFormAddressCounty,
  kFormAddressRows
} FormAddress;

typedef enum {
  kFormDamageRows = 0
} FormDamage;

// Section 2
// Street Address
// City
// State
// Zip
// County

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/

/*
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
*/

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kFormSections;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  switch (section) {
  case kFormName:
    return kFormNameRows;
  case kFormAddress:
    return kFormAddressRows;
  case kFormDamage:
    return kFormDamageRows;
  default:
    return 0;
  }
}

- (UITableViewCell *)prepareCellForName:(NSString *) name {
  TextFieldTableViewCell *cell = nil;
      if (cell == nil) {
	[[NSBundle mainBundle] loadNibNamed:@"TextFieldTableViewCell"
			       owner:self
			       options:NULL];
	cell = nibLoadedCell;
      }

      cell.textField.placeholder = name;
      return cell;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  switch (indexPath.section) {
  case kFormName:
    switch (indexPath.row) {
    case kFormNameFirst:
      return [self prepareCellForName:@"First Name"];
    case kFormNameLast:
      return [self prepareCellForName:@"Last Name"];
    case kFormNameMiddle:
      return [self prepareCellForName:@"Middle Name"];
    default:
      return [self prepareCellForName:@"??"];
    }
  case kFormAddress:
    switch (indexPath.row) {
    case kFormAddressStreet:
      return [self prepareCellForName:@"Address"];
    case kFormAddressCity:
      return [self prepareCellForName:@"City"];
    case kFormAddressState:
      return [self prepareCellForName:@"State"];
    case kFormAddressCounty:
      return [self prepareCellForName:@"County"];
    }
  case kFormDamage:
    return kFormDamageRows;
  default:
    return 0;
  }
}    


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    // AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
    // [self.navigationController pushViewController:anotherViewController];
    // [anotherViewController release];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc];
}


@end

