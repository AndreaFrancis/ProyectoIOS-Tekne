//
//  MapaUbicacionViewController.m
//  CochabambaEventos
//
//  Created by Tekhne Dev on 12/15/13.
//  Copyright (c) 2013 xiobit. All rights reserved.
//

#import "MapaUbicacionViewController.h"

@interface MapaUbicacionViewController ()

@end

@implementation MapaUbicacionViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    CLLocationCoordinate2D LasEscaleras = self.acontecimiento.ubicacion.coordinate;
   
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = LasEscaleras;
    annotationPoint.title = self.acontecimiento.nombre;
    annotationPoint.subtitle = self.acontecimiento.lugar;
    [mapa setCenterCoordinate:LasEscaleras animated:YES];
    [mapa addAnnotation:annotationPoint];
    }
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation { return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown); }
@synthesize mapa;
@end
