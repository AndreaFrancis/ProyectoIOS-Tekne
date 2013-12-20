#import "EventosListViewController.h"

@interface EventosListViewController ()

@end

@implementation EventosListViewController

dispatch_queue_t myQueue;
dispatch_queue_t myQueueImg;


NSMutableArray *eventos;
NSMutableDictionary *acontesimientos;

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
    [self performSearch];
    [self cargarAcontecimientos];
}

-(void) cargarAcontecimientos{
    myQueue = dispatch_queue_create("com.Andrea.CochabambaEventos", NULL);
    dispatch_async(myQueue, ^{
        NSString *urlString = @"http://soriajimenezandrea.magix.net/public/nuevo21.json";
        NSURL *url = [NSURL URLWithString:urlString];
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
       NSArray *listaDeAcontecimientos = [response objectForKey:@"Eventos"];
    
    for (NSDictionary *feature in listaDeAcontecimientos) {
        Acontecimiento *acontecimiento = [[Acontecimiento alloc]init];
        acontecimiento.informacionURL = feature[@"convocatoria"];
        acontecimiento.descripcion = feature[@"descripcion"];
        acontecimiento.fecha = feature[@"fecha"];
        acontecimiento.hora = feature[@"hora"];
        acontecimiento.urlImagen = feature[@"imagen"];
        acontecimiento.lugar = feature[@"lugar"];
        acontecimiento.nombre = feature[@"nombre"];
        acontecimiento.precio = feature[@"precio"];
        acontecimiento.publico = feature[@"publico"];
        acontecimiento.tipo = feature[@"tipo"];
        
        
            NSArray *ubicacion = feature[@"ubicacion"];
            double latitud = [ubicacion[0] doubleValue];
            double longitud = [ubicacion[1] doubleValue];
            
            
            
            CLLocationCoordinate2D abc;
            abc.latitude = latitud;
            abc.longitude =longitud;
            
            
            CLLocation *location1 = [[CLLocation alloc]initWithCoordinate:abc altitude:1 horizontalAccuracy:1 verticalAccuracy:-1 timestamp:nil];
            acontecimiento.ubicacion = location1;
            
        NSMutableArray *array = [acontesimientos objectForKey:acontecimiento.tipo];
        [array addObject:acontecimiento];
        
        
        myQueueImg = dispatch_queue_create("com.Andrea.Cochabamba", NULL);
        dispatch_async(myQueueImg, ^{
          
            NSURL *url = [NSURL URLWithString:acontecimiento.urlImagen];
            NSData *imgData = [NSData dataWithContentsOfURL:url];
            UIImage *imgEvento = [UIImage imageWithData:imgData];
            
            [acontecimiento setImagen:imgEvento];
     
        });
        
         
         }
    });
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) performSearch {
    acontesimientos = [[NSMutableDictionary alloc]init];
    eventos = [[NSMutableArray alloc]init];
    NSString *urlString = @"http://soriajimenezandrea.magix.net/public/Tipos.json";
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray *listaEventos = [response objectForKey:@"Tipos"];
    
    for (NSDictionary *eventoD in listaEventos) {
       
        Evento *evento = [[Evento alloc]init];
        [evento setTipo:[eventoD objectForKey:@"tipo"]];
        [evento setUrl:[eventoD objectForKey:@"imagen"]];
        [eventos addObject:evento];
        
        NSURL *url =[NSURL URLWithString:evento.url];
        NSData *imgData = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:imgData];
        [evento setImagen:img];
        NSMutableArray *listaDeAcontecimientos = [[NSMutableArray alloc]init];
        [acontesimientos setObject:listaDeAcontecimientos forKey:evento.tipo];
        
    }
    
}

- (IBAction)refrescar:(id)sender {
    [self refrescarEventos];
}

-(void) refrescarEventos{
    [self performSearch];
    [self.collectionView reloadData];

}

#pragma mark CollectionView Methos

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [eventos count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    EventoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EventoCell" forIndexPath:indexPath];
    Evento *evento = eventos[indexPath.row];
    cell.nombre.text = evento.tipo;
    cell.imagen.image = evento.imagen;

    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"verEventos"]) {
        NSArray *idxs = [self.collectionView indexPathsForSelectedItems];
        NSIndexPath *indexPath = idxs[0];
        NSLog(@"Indice seleccionado : %d", indexPath.row);
        
        Evento *evento = eventos[indexPath.row];
    
        ListaEventoViewController *lecv = [segue destinationViewController];
        
        lecv.evento = evento;
        
        lecv.acontecimientos = [acontesimientos objectForKey:evento.tipo];
        
    }
}




@end
