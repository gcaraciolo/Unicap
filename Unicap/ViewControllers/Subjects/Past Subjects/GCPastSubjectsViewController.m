//
//  GCPastSubjectsViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/14/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCPastSubjectsViewController.h"
#import "GCPastSubjectsService.h"
#import "GCPastSubject.h"
#import "GCSubjectDetailsViewController.h"
#import "GCSubjectDetails.h"

@interface GCPastSubjectsViewController()


@property (strong, nonatomic) NSArray *subjects;

@end

@implementation GCPastSubjectsViewController

#pragma mark - Lifecycle

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    GCLoggerInfo(@"viewDidLoad");
    
//    self.subjects = @[@"hhhasdasdadsadasdadaadasdd",
//                          @"hhhasdasdadsadasdadaadasdd",
//                          @"hhhahsdasdadsadasdadaadasd",
//                          @"hhhasdasdadsadasdadaadasdd",
//                          @"asdasdadsadasdadaadasddsad",
//                          @"asdasdadsadasdadaadasddsad",
//                          @"asdasdadsadasdadaadasddsad",
//                          @"asdasdadsadasdadaadasddsad",
//                          @"asdasdadsadasdadaadasddsad"
//                         ];
    
    GCPastSubjectsService *pastSubjects = [GCPastSubjectsService new];
    [pastSubjects getPastSubjectsWithCompletition:^(NSArray *subjects) {

        GCLoggerInfo(@"received past subjects");
        self.subjects = subjects;
        [self.tableView reloadData];
    } failure:^(NSError *error) {

        GCLoggerError(@"%@",error);
    }];


}

- (void)didReceiveMemoryWarning {
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
    
    GCPastSubject *pastSubject = self.subjects[indexPath.row];
//    cell.textLabel.text = self.subjects[indexPath.row];
    cell.textLabel.text = pastSubject.name;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *storyboardName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    
    GCSubjectDetailsViewController *subjectDetailsVC = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([GCSubjectDetailsViewController class])];
    
    GCSubjectDetails *subjectDetails = [GCSubjectDetails new];
    GCPastSubject *pastSubject = self.subjects[indexPath.row];
    subjectDetails.name = pastSubject.name;
    subjectDetails.code = pastSubject.code;
    subjectDetails.period = pastSubject.period;

    subjectDetailsVC.subjectDetails = subjectDetails;
    
    [self.navigationController pushViewController:subjectDetailsVC
                                         animated:YES];

}



@end
