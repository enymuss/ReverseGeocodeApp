//
//  ViewController.m
//  Reverse Geocode App
//
//  Created by Richard Szczerba on 27/05/15.
//  Copyright (c) 2015 Richard Szczerba. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

NSString * const kAcceptedCharacterSet = @"-.0123456789";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)geocodeButton:(id)sender {
    if ([self isDataVaild:self.longitiudeTextField.text] &&
        [self isDataVaild:self.latitudeTextField.text]) {
        
        [self reverseGeocode];
        
    } else {
        [self showAlertView];
    }
}

- (void) reverseGeocode {
    // texti fields have content
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitudeTextField.text.doubleValue
                                                      longitude:self.longitiudeTextField.text.doubleValue];
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            [self showAlertView];
        } else {
            CLPlacemark *placemark = placemarks.lastObject;
            if (placemark.subLocality) {
                self.resultLabel.text = placemark.subLocality;
            } else {
                self.resultLabel.text = @"Still Unknown";
            }
        }
    }];
}

- (void) showAlertView {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Data"
                                                        message:@"Please check all fields"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
    [alertView show];
}

- (BOOL) isDataVaild:(NSString *) dataString {
    BOOL isValid = TRUE;
    
    // false if it's empty
    if (dataString.length == 0) {
        return isValid = FALSE;
    }
    
    // iterate over every character.
    for (int i = 0; i < dataString.length; i++) {
        unichar character  = [dataString characterAtIndex:i];
        NSCharacterSet *accpetedCharacters = [NSCharacterSet characterSetWithCharactersInString:kAcceptedCharacterSet];
        
        // if it's not an accpetedCharacter, it's not valid
        if (![accpetedCharacters characterIsMember:character]) {
            return isValid = FALSE;
        }
    }
    
    return isValid;
}

@end
