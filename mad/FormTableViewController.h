//
//  FormTableViewController.h
//  mad
//
//  Created by Laurel Fan on 12/4/10.
//  Copyright 2010 Robot Co-op. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TextFieldTableViewCell;

@interface FormTableViewController : UITableViewController {
  TextFieldTableViewCell *nibLoadedCell;
}

@property(nonatomic, retain) IBOutlet TextFieldTableViewCell *nibLoadedCell;

- (UITableViewCell *)prepareCellForName:(NSString *) name;



@end
