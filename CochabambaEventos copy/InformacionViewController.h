//
//  InformacionViewController.h
//  CochabambaEventos
//
//  Created by Tekhne Dev on 12/16/13.
//  Copyright (c) 2013 xiobit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformacionViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *panelWeb;
@property (nonatomic,strong) NSString *textoURL;
@end
