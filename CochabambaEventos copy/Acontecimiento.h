
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface Acontecimiento : NSObject

@property (nonatomic, strong) NSString *tipo;

@property (nonatomic, strong) NSString *nombre;

@property (nonatomic, strong) NSString *descripcion;

@property (nonatomic, strong) NSString *informacionURL;

@property (nonatomic,strong)  NSString *precio;

@property (nonatomic, strong) UIImage *imagen;

@property(nonatomic,strong) NSString *urlImagen;

@property (nonatomic, strong) CLLocation *ubicacion;

@property (nonatomic, strong) NSString *lugar;

@property (nonatomic, strong) NSString *fecha;

@property (nonatomic, strong) NSString *publico;

@property (nonatomic,strong) NSString *hora;

@end
