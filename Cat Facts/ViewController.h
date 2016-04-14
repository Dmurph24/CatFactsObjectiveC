//
//  ViewController.h
//  Cat Facts
//
//  Created by Daniel Murphy on 4/14/16.
//  Copyright © 2016 Daniel Murphy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *catFactButton;
@property (weak, nonatomic) IBOutlet UILabel *catFactLabel;

- (IBAction)pressedCatFactButton:(id)sender;

@end

