//
//  tempconvertVC.m
//  tempconvert
//
//  Created by bgbb on 10/3/13.
//  Copyright (c) 2013 greensprout. All rights reserved.
//

#import "tempconvertVC.h"

@interface tempconvertVC ()

@property (nonatomic) float fVal;
@property (nonatomic) float cVal;

@property (weak, nonatomic) IBOutlet UITextField *fInput;
@property (weak, nonatomic) IBOutlet UITextField *cInput;

- (void) updateValues;
- (IBAction)onTap:(id)sender;

@end

@implementation tempconvertVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.cVal = 0.0;
        self.fVal = 0.0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateValues
{
    float f = round([self.fInput.text floatValue]);
    float c = round([self.cInput.text floatValue]);
    
    if (self.cVal == 0.0 && self.fVal == 0.0 && f == 0.0 && c == 0.0)
    {
       // do nothing
    }else if (f==self.fVal && c != self.cVal){// then c is new value
        self.cVal=c;
        self.fVal = round(c * 1.8 + 32);
        self.fInput.text = [NSString stringWithFormat:@"%.0f", self.fVal];
    }else{ // f is new value
        self.fVal = f;
        self.cVal = round((f-32)/1.8);
        self.cInput.text = [NSString stringWithFormat:@"%.0f", self.cVal];
    }
    
    self.fInput.text = [NSString stringWithFormat:@"%.0f", self.fVal];
    self.cInput.text = [NSString stringWithFormat:@"%.0f", self.cVal];
    
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

@end
