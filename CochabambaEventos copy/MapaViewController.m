//
//  MapaViewController.m
//  CochabambaEventos
//
//  Created by Tekhne Dev on 12/15/13.
//  Copyright (c) 2013 xiobit. All rights reserved.
//

#import "MapaViewController.h"

@interface MapaViewController ()

@end

@implementation MapaViewController

dispatch_queue_t myQuakeQueue;
#define GEORGIA_TECH_LATITUDE 33.777328
#define GEORGIA_TECH_LONGITUDE -84.397348

#define ZOOM_LEVEL 14

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
	
    [self marcarPosicion];
    

    
        CLLocationCoordinate2D centerCoord = { GEORGIA_TECH_LATITUDE, GEORGIA_TECH_LONGITUDE };
    [self.mapa setCenterCoordinate:centerCoord animated:NO];
       // [self.mapa setCenterCoordinate:centerCoord zoomLevel:ZOOM_LEVEL animated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

-(void) marcarPosicion {
    
    myQuakeQueue = dispatch_queue_create("com.tekhne.QuakeRadar", NULL);
    NSLog(@"Entra1");
    
    dispatch_async(myQuakeQueue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self marcar];
        });
    });
}

#pragma mark Refresh the MapView

-(void) marcar {
    NSLog(@"Entra2");
        MKPointAnnotation *coordenada = [[MKPointAnnotation alloc] init];
        
        coordenada.title = self.acontecimiento.nombre;
    
        coordenada.subtitle = self.acontecimiento.lugar;
    
    
    
        coordenada.coordinate = self.acontecimiento.ubicacion.coordinate;
    
    //
    [self.mapa addAnnotation:coordenada];
}


@end
