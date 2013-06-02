//
//  HCSwordImageViewController.m
//  Velero
//
//  Created by Franco Cedillo on 5/22/13.
//  Copyright (c) 2013 HartasCuerdas. All rights reserved.
//

#import "HCSwordImageViewController.h"

@interface HCSwordImageViewController ()

@end

@implementation HCSwordImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (self.swordImage) {
        [self.swordImageView setImage:self.swordImage];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
