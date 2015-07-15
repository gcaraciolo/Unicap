//
//  GCLeftMenuViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCLeftMenuViewController.h"
#import "AppDelegate.h"

#import "GCSubjectsViewController.h"
#import "GCPanelViewController.h"

@interface GCLeftMenuViewController() <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *firstSectionTable;
@property (strong, nonatomic) NSArray *secondSectionTable;

@end

@implementation GCLeftMenuViewController

#pragma mark - Lifecycle

-(void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.sideMenuViewController = appDelegate.sideMenuViewController;
    
    GCLoggerInfo(@"viewDidLoad");
    
    
    [self fillTable];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return self.firstSectionTable.count;
        case 1:
            return self.secondSectionTable.count;
        default:
            break;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"menuCellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    [self fillCell:cell indexPath:indexPath];
    
    return cell;
    
}

-(void)fillCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = self.firstSectionTable[indexPath.row];
            break;
        case 1:
            cell.textLabel.text = self.secondSectionTable[indexPath.row];
            break;
        default:
            break;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                [self instatiateViewController:NSStringFromClass([GCPanelViewController class])];
                break;
            case 1:
                [self instatiateViewController:NSStringFromClass([GCSubjectsViewController class])];
                break;
            case 2:
                
                break;
            case 3:
                
                break;
            case 4:
                
                break;
            default:
                break;
        }
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:

                break;
            case 1:

                break;
            case 2:
                
                break;
            default:
                break;
        }
    }
    
    
}

-(void) instatiateViewController:(NSString *)identifier {
    
    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc]
                                                           initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:identifier]]
                                                 animated:YES];
    
    [self.sideMenuViewController hideMenuViewController];
    
}


#pragma mark - Load fields

- (void) fillTable {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.firstSectionTable =  @[
                                @"Painel",
                                @"Disciplinas",
                                @"Calendário",
                                @"Aulas",
                                @"Notas"
                                ];
    
    self.secondSectionTable = @[
                                @"Feedback",
                                @"Sobre",
                                @"Sair"
                                ];
    
    
}




@end


































