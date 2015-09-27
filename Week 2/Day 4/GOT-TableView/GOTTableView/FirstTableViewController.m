//
//  FirstTableViewController.m
//  GOTTableView
//
//  Created by Mateo Mauricio Samaranch on 17/09/15.
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
    
    self.gotModel = [[GotModel alloc]init];
    [self.gotModel cargaModelo];
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Kill";
}

- (void)didPressKillPersonaje:(Personaje *)personaje
{
    NSLog(@"DEAD");
    [self.navigationController popViewControllerAnimated:YES];
    
    [self.gotModel killPersonaje:personaje];
    
    [self.tableView reloadData];
    
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



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


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


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
