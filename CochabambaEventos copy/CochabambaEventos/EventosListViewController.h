//
//  EventosListViewController.h
//  CochabambaEventos
//
//  Created by Tekhne Dev on 12/13/13.
//  Copyright (c) 2013 xiobit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Evento.h"
#import "EventoCell.h"
#import "ListaEventoViewController.h"
#import "Acontecimiento.h"

@interface EventosListViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate>

- (IBAction)refrescar:(id)sender;

@end
