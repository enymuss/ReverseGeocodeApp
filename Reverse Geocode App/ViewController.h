//
//  ViewController.h
//  Reverse Geocode App
//
//  Created by Richard Szczerba on 27/05/15.
//  Copyright (c) 2015 Richard Szczerba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *longitiudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (IBAction)geocodeButton:(id)sender;
@end

