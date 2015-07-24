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

#pragma mark - Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.days = @[
                  @"Segunda-feira",
                  @"Terça-feira",
                  @"Quarta-feira",
                  @"Quinta-feira",
                  @"Sexta-feira",
                  @"Sábado"
                  ];
    
    self.student = [GCStudent new];
    
    GCCurrentSubjectsServices *service = [GCCurrentSubjectsServices new];
    [service getInformationsFromCurrentPeriodWithCompletition:^(NSArray *subjects) {

        self.student.currentSubjects = subjects;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.days.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"classCellID";
    GCDayScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                            forIndexPath:indexPath];
    
    [self fillCell:cell
      forIndexPath:indexPath];
    
    return cell;
}

- (void)fillCell:(GCDayScheduleTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    cell.lblDay.text = self.days[indexPath.row];

    //TODO:
    [cell fillCellWithSubjects:[self.student getSubjectsFromDay:indexPath.row]];
//    [cell fillCellWithSubject:self.student.currentSubjects[indexPath.row]];

}

@end
