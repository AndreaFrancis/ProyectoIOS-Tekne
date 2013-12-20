
#import "ListaEventoViewController.h"

@interface ListaEventoViewController ()

@end

@implementation ListaEventoViewController

//Aca poner lista de eventillos


dispatch_queue_t myQueue;
dispatch_queue_t myQueueImg;
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
	self.listaEventos.delegate = self;
    self.title = self.evento.tipo;
    [self cargarAcontecimientos];
}

-(void) cargarAcontecimientos{
    
    NSArray *songsFromJSON = self.acontecimientos;
    

    for (Acontecimiento *song in songsFromJSON) {
        
        
        @try {
            myQueueImg = dispatch_queue_create("com.tekhne.TopMusicImg", NULL);
            dispatch_async(myQueueImg, ^{
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSIndexPath *index = [NSIndexPath indexPathForRow:[songsFromJSON indexOfObject:song] inSection:0];
                    
                    [self.listaEventos reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationNone];
                });
                
            });
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
        
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.listaEventos reloadData];
    });

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark TableView Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.acontecimientos count];
  
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AcontecimientoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"acontecimientoCell" forIndexPath:indexPath];
    Acontecimiento *acontecimiento  = [self.acontecimientos objectAtIndex:indexPath.row];
    cell.imagen.image = acontecimiento.imagen;
    cell.titulo.text = acontecimiento.nombre;
    cell.lugar.text = acontecimiento.lugar;
    cell.fecha.text = acontecimiento.fecha;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if ( [segue.identifier isEqualToString:@"verAcontecimiento"] ) {


        AcontecimientoViewController *avc = [segue destinationViewController];
        
        NSIndexPath *idx = [self.listaEventos indexPathForSelectedRow];
        
        Acontecimiento *actual = [self.acontecimientos objectAtIndex:idx.row];
        
        avc.acontecimiento = actual;
        
    }
}



@end
