//
//  GCClassesTableViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/21/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCClassesTableViewController.h"
#import "GCCurrentSubjectsServices.h"
#import "GCSubject.h"
#import "GCDayScheduleTableViewCell.h"
#import "GCStudent.h"

@interface GCClassesTableViewController ()

@property (strong, nonatomic) NSArray *days;
@property (strong, nonatomic) GCStudent *student;

@end

@implementation GCClassesTableViewController

static NSString *CellIdentifier = @"classCellID";

#pragma mark - Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUpTableView];
    [self setUpData];
    
    GCCurrentSubjectsServices *service = [GCCurrentSubjectsServices new];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [service getInformationsFromCurrentPeriodWithCompletition:^(NSArray *subjects) {

        GCLoggerInfo(@"receive subjects");
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } failure:^(NSError *error) {
        
        GCLoggerError(@"error in request of class");
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    

    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.days.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//TODO: colocar quantas cadeiras tem no dia.
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GCDayScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                            forIndexPath:indexPath];
    
    [self fillCell:cell forIndexPath:indexPath];
    return cell;
}

- (void)fillCell:(GCDayScheduleTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
//    cell.lblDay.text = self.days[indexPath.row];
//
//    //TODO:
//    [cell fillCellWithSubjects:[self.student getSubjectsFromDay:indexPath.row]];
////    [cell fillCellWithSubject:self.student.currentSubjects[indexPath.row]];

}

#pragma mark - Helper Methods

- (void)setUpData {
    
    self.days = @[
                  @"Segunda-feira",
                  @"Terça-feira",
                  @"Quarta-feira",
                  @"Quinta-feira",
                  @"Sexta-feira",
                  @"Sábado"
                  ];
}

- (void)setUpTableView {
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}

@end
