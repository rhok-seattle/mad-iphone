//
//  FormView.m
//  mad
//
//  Created by Laurel Fan on 12/4/10.
//  Copyright 2010 Robot Co-op. All rights reserved.
//

#import "FormView.h"

#define SCROLLVIEW_CONTENT_HEIGHT 460
#define SCROLLVIEW_CONTENT_WIDTH  320

@implementation FormView

@synthesize webView;
@synthesize submitButton;
@synthesize imageView;
@synthesize imagePicker;

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
  
  NSString *path = [[NSBundle mainBundle] pathForResource:@"form" ofType:@"html"];
  NSURL *url = [NSURL fileURLWithPath:path];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [webView loadRequest:request];
  webView.delegate = self;
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
    NSData *bodyData = request.HTTPBody;
    NSString *bodyString = [[NSString alloc] initWithData:bodyData encoding:NSASCIIStringEncoding];

    NSLog(@"%@", bodyString);
    return NO;
  } else {
    return YES;
  }
}

- (IBAction)addPhoto {
  // bring up image grabber
  //  if([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
  //    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
  //  } else {
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //  }
  self.imagePicker.allowsImageEditing = YES;
  [self presentModalViewController:self.imagePicker animated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  [self.imagePicker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  imageView.image = [info objectForKey:UIImagePickerControllerEditedImage];
  [self dismissModalViewControllerAnimated:YES];
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
