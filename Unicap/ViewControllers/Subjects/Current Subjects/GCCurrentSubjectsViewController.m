//
//  GCCurrentSubjectsViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/15/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCCurrentSubjectsViewController.h"
#import "GCCurrentSubjectsServices.h"
#import "GCSubject.h"
#import "GCSubjectDetails.h"
#import "GCSubjectDetailsViewController.h"

@interface GCCurrentSubjectsViewController()

@property (strong, nonatomic) NSArray *subjects;

@end

@implementation GCCurrentSubjectsViewController

#pragma mark - Lifecycle

-(void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    GCCurrentSubjectsServices *currentSubjectsService = [GCCurrentSubjectsServices new];
    [currentSubjectsService getInformationsFromCurrentPeriodWithCompletition:^(NSArray *subjects) {

        GCLoggerInfo(@"received current subjects");
        self.subjects = subjects;
        [self.tableView reloadData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    GCLoggerInfo(@"viewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    GCLoggerInfo(@"viewDidAppear");
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    GCLoggerInfo(@"viewWillDisappear");
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    GCLoggerInfo(@"viewDidDisapear");
}

#pragma mark - Layout

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGRect rect = self.navigationController.navigationBar.frame;
    float y = rect.size.height + rect.origin.y;
    self.tableView.contentInset = UIEdgeInsetsMake(y ,0,0,0);
}

#pragma mark - TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subjects.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"subjectsCellID";
    
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
    
    GCSubject *subject = self.subjects[indexPath.row];
//    cell.textLabel.text = self.subjects[indexPath.row];
    cell.textLabel.text = subject.name;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *storyboardName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    
    GCSubjectDetailsViewController *subjectDetailsVC = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([GCSubjectDetailsViewController class])];
    
    GCSubject *subject = self.subjects[indexPath.row];
    subjectDetailsVC.subject = subject;

    [self.navigationController pushViewController:subjectDetailsVC
                                         animated:YES];
    
}



@end
