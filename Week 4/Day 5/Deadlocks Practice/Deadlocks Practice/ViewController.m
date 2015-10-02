//
//  ViewController.m
//  Deadlocks Practice
//
//  Created by Fran on 2/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     
     Una cola SERIAL o CONCURRENT al que le pasamos una operación sincrona o asíncrona
     Serial -> Ejecución en un único hilo
     Concurren -> Ejecución en múltiples hilos
     
     syn -> Debe realizar toda la ejecución del bloque antes de seguir el flujo de ejecución del programa
     asyn -> Puede continuar con la ejecución del programa sin haber realizado la ejecución del bloque
     
     */
    
    
    //Se crea una cola Serial, que ejecuta las operaciones en el mismo hilo, llega a la primera operacion y la realiza, pero al llegar a la segunda se bloquea al querer ejecutar la operacion en otro hilo y ser la cola SERIAL y realizar las operaciones en el mismo hilo
    dispatch_queue_t myDispatchQueue = dispatch_queue_create("deadLocks", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(myDispatchQueue, ^{
        NSLog(@"HELLO ");
        dispatch_sync(myDispatchQueue, ^{
            NSLog(@"WORLD ");
        });
        NSLog(@"HELLO2 ");
        NSLog(@"HELLO3 ");
    });
    NSLog(@"HELLO FNAL");
    
    //Actualmente estamos en la cola principal que por defecto es SERIAL por lo que si le decimos que ejecute una operacion en otro hilo se quedara bloqueado. Sería el mismo caso que el ejemplo anterior,
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"deadLocks");
//    });
//    NSLog(@"ASDAS");
}

@end
