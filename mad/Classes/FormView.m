//
//  FormView.m
//  mad
//
//  Created by Laurel Fan on 12/4/10.
//  Copyright 2010 Robot Co-op. All rights reserved.
//

#import "FormView.h"

#import "ASIFormDataRequest.h"

#define SCROLLVIEW_CONTENT_HEIGHT 460
#define SCROLLVIEW_CONTENT_WIDTH  320

@implementation FormView

@synthesize webView;
@synthesize submitButton;
@synthesize imageView0;
@synthesize imageView1;
@synthesize imageView2;
@synthesize imagePicker;
@synthesize locationManager;
@synthesize lastLocation;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  
  // load from web view
  NSString *path = [[NSBundle mainBundle] pathForResource:@"form" ofType:@"html"];
  NSURL *url = [NSURL fileURLWithPath:path];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [webView loadRequest:request];
  webView.delegate = self;

  // location
  self.locationManager = [[[CLLocationManager alloc] init] autorelease];
  self.locationManager.delegate = self;
  [self.locationManager startUpdatingLocation];

  // photos
  photos = [[[NSMutableArray alloc] init] retain];
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}
	 
-(void) viewWillDisappear:(BOOL)animated {
}

- (IBAction)submit {
  NSLog(@"what %@", [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('submit').click();"]);
  NSLog(@"submitted");
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
  if (navigationType == UIWebViewNavigationTypeFormSubmitted) {
    // intercept request sent by the UIWebView
    NSData *bodyData = request.HTTPBody;
    NSString *bodyString = [[NSString alloc] initWithData:bodyData encoding:NSASCIIStringEncoding];
    
    // Create the request that we are actually sending
    ASIFormDataRequest *newRequest =
      [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://kini.local:3000/residences"]];

    // Parse the intercepted HTTP post body and copy it to the new request
    NSArray *params = [bodyString componentsSeparatedByString: @"&"];
    for (int i = 0; i < params.count; i++) {
      NSString *paramString = [params objectAtIndex:i];
      NSArray *param = [paramString componentsSeparatedByString: @"="];
      if (param.count == 2) {
	NSString *name = [[param objectAtIndex:0]
			   stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
	NSString *value = [[param objectAtIndex:1]
			    stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
	[newRequest addPostValue:value forKey:name];
      }
    }
    
    // Add location data
    if (lastLocation != NULL) {
      [newRequest addPostValue:[NSString stringWithFormat:@"%f", lastLocation.coordinate.latitude]
		  forKey:@"latitude"];
      [newRequest addPostValue:[NSString stringWithFormat:@"%f", lastLocation.coordinate.longitude]
		  forKey:@"longitude"];
    }

    // Add the photos as files
    for (int i = 0; i < photos.count; i++) {
      [newRequest addData:UIImageJPEGRepresentation(imageView0.image, 1.0)
		  withFileName:[NSString stringWithFormat:@"image0.jpg", i]
		  andContentType:@"image/jpeg"
		  forKey:[NSString stringWithFormat:@"residence[photos_attributes][%d][image]", i]];

    }

    // Send the request!
    [newRequest startSynchronous];
    NSError *error = [newRequest error];
    if (!error) {
      NSString *response = [newRequest responseString];
      NSLog(@"argh %@", response);
    } else {
      NSLog(@"an erroor %@", error.localizedDescription);
    }

    return NO;
  } else {
    return YES;
  }
}

- (IBAction)addPhoto {
  // bring up image grabber
    if([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
      self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
  [self presentModalViewController:self.imagePicker animated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  [self.imagePicker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  UIImage *image =  [info objectForKey:UIImagePickerControllerOriginalImage];
  [photos addObject:image];

  NSLog(@"%d photos", photos.count);

  if (photos.count > 0) {
    imageView0.image = [photos objectAtIndex:0];
  }

  if (photos.count > 1) {
    imageView1.image = [photos objectAtIndex:1];
  }

  if (photos.count > 2) {
    imageView2.image = [photos objectAtIndex:2];
  }

  [self dismissModalViewControllerAnimated:YES];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
	   fromLocation:(CLLocation *)oldLocation {
  self.lastLocation = newLocation;
  NSLog(@"%f lat %f lon", lastLocation.coordinate.latitude, lastLocation.coordinate.longitude);
}

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


- (void)dealloc {
    [super dealloc];
}


@end
