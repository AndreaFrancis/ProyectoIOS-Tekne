//
//  InformacionViewController.m
//  CochabambaEventos
//
//  Created by Tekhne Dev on 12/16/13.
//  Copyright (c) 2013 xiobit. All rights reserved.
//

#import "InformacionViewController.h"

@interface InformacionViewController ()

@end

@implementation InformacionViewController

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
    
    NSURL        *url       = [NSURL URLWithString:self.textoURL];
    NSURLRequest *loadURL   = [[NSURLRequest alloc] initWithURL:url];
    [self.panelWeb loadRequest:loadURL];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
