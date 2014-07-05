//
//  EventosTableViewController.m
//  eventosEuskadi
//
//  Created by Ruben Jeronimo Fernandez on 04/07/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "EventosTableViewController.h"
#import "EventosDetalleViewController.h"
#import "EventoTableViewCell.h"
@interface EventosTableViewController ()
@property (nonatomic,strong) NSArray *listaEventos;
@property (nonatomic,strong) NSDictionary *evento;
@end

@implementation EventosTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *string = @"http://www.kulturklik.euskadi.net/?api_call=events&from=2012-03-20&to=2012-03-28&lang=es&max=20Eventos";
    NSURL *urlEvento = [NSURL URLWithString:string];
    NSURLRequest *consultaEvento = [NSURLRequest requestWithURL:urlEvento];
    
    AFHTTPRequestOperation *operacion = [[AFHTTPRequestOperation alloc]initWithRequest:consultaEvento];
    operacion.responseSerializer = [AFJSONResponseSerializer serializer];
    [operacion setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.title = @"Eventos Euskadi";
        self.evento = (NSDictionary *)responseObject;
        self.listaEventos = [self.evento valueForKey:@"eventos"];
        [self.tableView reloadData];
      //  NSLog(@"array:%@",self.listaEventos);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"que mal");
    }];
    [operacion start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d",[self.listaEventos count]);
    // Return the number of rows in the section.
    return [self.listaEventos count];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"CeldaEvento";
    EventoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    self.evento = [self.listaEventos objectAtIndex:indexPath.row];
    cell.tituloEventoLabel.text = [self.evento objectForKey:@"evento_titulo"];
    cell.tipoEventoLabel.text = [self.evento objectForKey:@"evento_tipo"];
//    cell.textLabel.text = [self.evento objectForKey:@"evento_titulo"];
//    cell.detailTextLabel.text = [self.evento objectForKey:@"evento_tipo"];
    
    
    return cell;
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier  isEqualToString: @"segueDetalle"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        EventosDetalleViewController *eventosVC = [segue destinationViewController];
        NSDictionary *proyecto = [self.listaEventos objectAtIndex:indexPath.row];
        NSString *tituloVC = [proyecto objectForKey:@"evento_titulo"];
        NSString *detalleVC = [proyecto objectForKey:@"evento_tipo"];
        NSString *latitudVC = [proyecto objectForKey:@"latitude"];
        NSString *longitudVC = [proyecto objectForKey:@"longitude"];
        NSString *urlVC = [proyecto objectForKey:@"evento_url"];
        eventosVC.tituloString = tituloVC;
        eventosVC.tipoString = detalleVC;
        eventosVC.urlString = urlVC;
        eventosVC.latString = latitudVC;
        eventosVC.lonString = longitudVC;
    }
}
@end
