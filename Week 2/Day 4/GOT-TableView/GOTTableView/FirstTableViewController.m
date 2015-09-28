//
//  FirstTableViewController.m
//  GOTTableView
//
//  Created by Francisco Jimenez Moral on 17/09/15.
//  Copyright (c) 2015 Ricardo Sanchez. All rights reserved.
//

#import "FirstTableViewController.h"
#import "GotModel.h"
#import "Personaje.h"
#import "Casa.h"
#import "TableViewCell.h"
#import "DetailViewController.h"

@interface FirstTableViewController () <DetailViewControllerDelegate>

@property (strong, nonatomic) GotModel *gotModel;

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //loadModel
    self.gotModel = [[GotModel alloc]init];
    [self.gotModel cargaModelo];
    
    //SetupNavBar
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"Game of Thrones";
    
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Kill";
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"pushSegue"]){
        DetailViewController *detailViewController = segue.destinationViewController;
        Casa *casa = [self.gotModel.casas objectAtIndex:self.tableView.indexPathForSelectedRow.section];
        Personaje *personaje = [casa.personajes objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        detailViewController.personaje = personaje;
        detailViewController.delegate = self;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [self.gotModel.casas count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //return [self.gotModel.personajes count];;
    Casa *casa = [self.gotModel.casas objectAtIndex:section];
    return [casa.personajes count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Casa *casa = [self.gotModel.casas objectAtIndex:section];
    return casa.nombre;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celda2" forIndexPath:indexPath];
    Casa *casa = [self.gotModel.casas objectAtIndex:indexPath.section];
    Personaje *auxPersonaje = [casa.personajes objectAtIndex:indexPath.row];
    
    cell.imageCell.image =[UIImage imageNamed:auxPersonaje.imagen];
    cell.labelName.text = auxPersonaje.nombre;
    //cell.imageBackground.image = [UIImage imageNamed:casa.imagen];

    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 52;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
        return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    Casa *casa = [self.gotModel.casas objectAtIndex:section];
    UIImage *casaImagen = [UIImage imageNamed:casa.imagen];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:casaImagen];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    return imageView;
}





// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
//        Casa *casa = [self.gotModel.casas objectAtIndex:indexPath.section];
//        NSMutableArray *personajes = [casa.personajes mutableCopy];
//        [personajes removeObjectAtIndex:indexPath.row];
//        casa.personajes = personajes.copy;
        [self.gotModel killCharacter:indexPath];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


#pragma mark - DetailViewController delegate

- (void)didPressKillPersonaje:(Personaje *)personaje
{
    //NSLog(@"DEAD");
    //[self.navigationController popViewControllerAnimated:YES];
    [self.gotModel killPersonaje:personaje];
    [self.tableView reloadData];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    for (TableViewCell* cell in self.tableView.visibleCells) {
        float distancia = cell.frame.origin.y-scrollView.contentOffset.y;
        //NSLog(@"%.2f %.2f",distancia, self.view.bounds.size.height);
        [cell setOffset:distancia/self.view.bounds.size.height];
    }
}



@end
