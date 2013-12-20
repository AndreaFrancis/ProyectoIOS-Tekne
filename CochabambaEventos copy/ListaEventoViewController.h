//
//  ListaEventoViewController.h
//  CochabambaEventos
//
//  Created by Tekhne Dev on 12/13/13.
//  Copyright (c) 2013 xiobit. All rights reserved.
//

#import "ViewController.h"
#import "Evento.h"
#import "AcontecimientoCell.h"
#import "Acontecimiento.h"
#import "AcontecimientoViewController.h"
@interface ListaEventoViewController : ViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *listaEventos;


@property(nonatomic,strong) Evento *evento;

@property(nonatomic,strong) NSArray *acontecimientos;


@end
