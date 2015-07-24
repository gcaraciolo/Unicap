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
#import "GCClassesTableViewCell.h"

@interface GCClassesTableViewController ()

@property (strong, nonatomic) NSArray *subjects;
@property (strong, nonatomic) NSArray *days;

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
    
    GCCurrentSubjectsServices *service = [GCCurrentSubjectsServices new];
    [service getInformationsFromCurrentPeriodWithCompletition:^(NSArray *subjects) {
        
        self.subjects = subjects;
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
    GCClassesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                            forIndexPath:indexPath];
    
    [self fillCell:cell
      forIndexPath:indexPath];
    
    return cell;
}

- (void)fillCell:(GCClassesTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
//    GCSubject *subject = self.subjects[indexPath.row];
//    cell.textLabel.text = subject.name;
    cell.lblDay.text = self.days[indexPath.row];

}

@end
