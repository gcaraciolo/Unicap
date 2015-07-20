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

@interface GCPastSubjectsViewController() <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *pastSubjects;

@end

@implementation GCPastSubjectsViewController

#pragma mark - Lifecycle

-(void)viewDidLoad {
    [super viewDidLoad];
    
    GCLoggerInfo(@"viewDidLoad");
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.pastSubjects = @[@"hhhasdasdadsadasdadaadasdd",
                          @"hhhasdasdadsadasdadaadasdd",
                          @"hhhahsdasdadsadasdadaadasd",
                          @"hhhasdasdadsadasdadaadasdd",
                          @"asdasdadsadasdadaadasddsad",
                          @"asdasdadsadasdadaadasddsad",
                          @"asdasdadsadasdadaadasddsad",
                          @"asdasdadsadasdadaadasddsad",
                          @"asdasdadsadasdadaadasddsad"
                         ];
    
//    GCPastSubjectsService *pastSubjects = [GCPastSubjectsService new];
//    [pastSubjects getPastSubjectsWithCompletition:^(NSArray *subjects) {
//
//        GCLoggerInfo(@"received past subjects");
//        self.pastSubjects = subjects;
//        [self.tableView reloadData];
//    } failure:^(NSError *error) {
//
//        GCLoggerError(@"%@",error);
//    }];


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

#pragma mark - TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pastSubjects.count;
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
    
//    GCPastSubject *pastSubject = self.pastSubjects[indexPath.row];
    cell.textLabel.text = self.pastSubjects[indexPath.row];
}

-(void)updateViewConstraints {
    [super updateViewConstraints];
    GCLoggerInfo(@"updateViewConstraints");
}


@end
