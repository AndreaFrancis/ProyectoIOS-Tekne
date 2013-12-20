//
//  AcontecimientoViewController.h
//  CochabambaEventos
//
//  Created by Tekhne Dev on 12/14/13.
//  Copyright (c) 2013 xiobit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Acontecimiento.h"
#import "MapaUbicacionViewController.h"
#import "InformacionViewController.h"

@interface AcontecimientoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imagen;
@property (weak, nonatomic) IBOutlet UILabel *txtNombre;
@property (weak, nonatomic) IBOutlet UILabel *txtFecha;
@property (weak, nonatomic) IBOutlet UILabel *txtLugar;
@property (weak, nonatomic) IBOutlet UITextView *txtDescripcion;
@property (weak, nonatomic) IBOutlet UILabel *txtPrecio;
@property (weak, nonatomic) IBOutlet UILabel *txtPublico;
@property (weak, nonatomic) IBOutlet UILabel *txtHora;

- (IBAction)verEnMapa:(id)sender;
- (IBAction)verMasInformacion:(id)sender;

@property(nonatomic,strong) Acontecimiento *acontecimiento;

@end
