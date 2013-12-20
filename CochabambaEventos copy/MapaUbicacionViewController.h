//
//  MapaUbicacionViewController.h
//  CochabambaEventos
//
//  Created by Tekhne Dev on 12/15/13.
//  Copyright (c) 2013 xiobit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Acontecimiento.h"

@interface MapaUbicacionViewController : UIViewController<MKMapViewDelegate>

//@property(nonatomic) BOOL _doneInitialZoom;
@property (weak, nonatomic) IBOutlet MKMapView *mapa;

@property (nonatomic,strong) Acontecimiento *acontecimiento;

@end
