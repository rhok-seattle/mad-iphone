//
//  FormView.h
//  mad
//
//  Created by Laurel Fan on 12/4/10.
//  Copyright 2010 Robot Co-op. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FormView : UIViewController<UIWebViewDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate> {
  UIWebView *webView;
  UIButton *submitButton;

  UIImageView *imageView0;
  UIImageView *imageView1;
  UIImageView *imageView2;
  UIImagePickerController *imagePicker;

  BOOL keyBoardVisible;

  CLLocationManager *locationManager;
  CLLocation *lastLocation;

  NSMutableArray *photos;
}

@property(nonatomic, retain) IBOutlet UIWebView *webView;
@property(nonatomic, retain) IBOutlet UIButton *submitButton;
@property(nonatomic, retain) IBOutlet UIImageView *imageView0;
@property(nonatomic, retain) IBOutlet UIImageView *imageView1;
@property(nonatomic, retain) IBOutlet UIImageView *imageView2;
@property(nonatomic, retain) IBOutlet UIImagePickerController *imagePicker;

@property(nonatomic, retain) CLLocationManager *locationManager;
@property(nonatomic, retain) CLLocation *lastLocation;

- (IBAction)submit;
- (IBAction)addPhoto;
@end
