//
//  AcontecimientoViewController.m
//  CochabambaEventos
//
//  Created by Tekhne Dev on 12/14/13.
//  Copyright (c) 2013 xiobit. All rights reserved.
//

#import "AcontecimientoViewController.h"

@interface AcontecimientoViewController ()

@end

@implementation AcontecimientoViewController

- (IBAction)verEnMapa:(id)sender {
}

- (IBAction)verMasInformacion:(id)sender {
}

Acontecimiento *acontecimiento;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"";
    self.txtNombre.text = self.acontecimiento.nombre;
    self.txtLugar.text = self.acontecimiento.lugar;
    self.txtFecha.text = self.acontecimiento.fecha;
    self.txtHora.text = self.acontecimiento.hora;
    self.imagen.image = self.acontecimiento.imagen;
    self.txtPrecio.text = self.acontecimiento.precio;
    self.txtPublico.text = self.acontecimiento.publico;
    self.txtDescripcion.text = self.acontecimiento.descripcion;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"verEnMapa"]){
        MapaUbicacionViewController *muvc = [segue destinationViewController];
        muvc.acontecimiento = self.acontecimiento;
        
    }
    if([segue.identifier isEqualToString:@"verInformacion"]){
        InformacionViewController *ivc = [segue destinationViewController];
        ivc.textoURL = self.acontecimiento.informacionURL;
        
    }
    
}

@end
