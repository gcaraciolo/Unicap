//
//  GCTestingScheduleViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/14/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCTestingScheduleViewController.h"
#import "GCTestingScheduleService.h"
#import "GCTestingSchedule.h"
#import "GCTestingScheduleDetailsViewController.h"

@interface GCTestingScheduleViewController()

@property (strong, nonatomic) NSArray *testingSchedules;

@end

@implementation GCTestingScheduleViewController

-(void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    GCLoggerInfo(@"viewDidLoad");
    
    GCTestingScheduleService *testingSchedule = [GCTestingScheduleService new];
    [testingSchedule getTestingScheduleWithCompletition:^(NSArray *schedule) {
        
        GCLoggerInfo(@"received schedules");
        self.testingSchedules = schedule;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
        GCLoggerError(@"%@", error);
    }];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.testingSchedules.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"testingScheduleCellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                            forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    [self fillTableViewCell:cell
               forIndexPath:indexPath];
    
    return cell;
}

-(void)fillTableViewCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    GCTestingSchedule *testingSchedule = self.testingSchedules[indexPath.row];
    cell.textLabel.text = testingSchedule.name;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *storyboardName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    
    GCTestingScheduleDetailsViewController *testingScheduleDetailsVC = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([GCTestingScheduleDetailsViewController class])];
    
    testingScheduleDetailsVC.testingSchedule = self.testingSchedules[indexPath.row];
    
    [self.navigationController pushViewController:testingScheduleDetailsVC
                                         animated:YES];
     
}






@end
