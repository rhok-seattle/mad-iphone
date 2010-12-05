@class TextFieldTableViewCell;

@interface TextFieldTableViewCell : UITableViewCell {
  UITextField *textField;
}

@property (nonatomic, retain) IBOutlet UITextField *textField;

@end
