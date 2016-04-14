//
//  ViewController.m
//  Cat Facts
//
//  Created by Daniel Murphy on 4/14/16.
//  Copyright © 2016 Daniel Murphy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize catFactLabel, catFactButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Loads a new cat fact into the catFactLabel from the cat fact API
- (void)loadCatFact {
    
    //First, lets make a variable that holds the Cat Fact URL
    NSString *url_str = @"http://catfacts-api.appspot.com/api/facts";
    
    //Now we perform the request
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:url_str]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                //Once we get the request, handle it
                //Lets get the json!
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                
                //Get the first element of the facts array
                //We SHOULD implement error handling here, but this is a hackathon! :D
                NSString *catFactString = [[json objectForKey:@"facts"] objectAtIndex:0];
                
                //Add the fact to the fact label
                //We have to run it on the main queue for the UI thread
                dispatch_async(dispatch_get_main_queue(), ^{
                    [catFactLabel setText:catFactString];
                });
                
            }] resume];
}

//When the new cat fact button is pressed
//...load a cat fact! :)
- (IBAction)pressedCatFactButton:(id)sender {
    [self loadCatFact];
}

@end
