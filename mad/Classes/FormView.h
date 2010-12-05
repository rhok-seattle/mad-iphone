//
//  FormView.h
//  mad
//
//  Created by Laurel Fan on 12/4/10.
//  Copyright 2010 Robot Co-op. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FormView : UIViewController<UIWebViewDelegate, UIImagePickerControllerDelegate> {
  UIWebView *webView;
  UIButton *submitButton;

  UIImageView *imageView;
  UIImagePickerController *imagePicker;

  BOOL keyBoardVisible;
}

@property(nonatomic, retain) IBOutlet UIWebView *webView;
@property(nonatomic, retain) IBOutlet UIButton *submitButton;
@property(nonatomic, retain) IBOutlet UIImageView *imageView;
@property(nonatomic, retain) IBOutlet UIImagePickerController *imagePicker;

- (IBAction)submit;
- (IBAction)addPhoto;
@end
