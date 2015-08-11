//
//  GCSubjectDetailsViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/20/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCSubjectDetailsViewController.h"

@interface GCSubjectDetailsViewController ()

@property (strong, nonatomic) IBOutlet UILabel *lblNome;
@property (strong, nonatomic) IBOutlet UILabel *lblCodigoDaDisciplina;
@property (strong, nonatomic) IBOutlet UILabel *lblTurma;
@property (strong, nonatomic) IBOutlet UILabel *lblSala;
@property (strong, nonatomic) IBOutlet UILabel *lblHorario;
@property (strong, nonatomic) IBOutlet UILabel *lblPeriodo;

@end

@implementation GCSubjectDetailsViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fillLabels];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Setups

- (void)fillLabels {
    _lblNome.text = _subject.name;
    _lblCodigoDaDisciplina.text = _subject.subjectCode;
    _lblTurma.text = _subject.classCode;
    _lblSala.text = _subject.classroom;
    _lblHorario.text = _subject.schedule;
    _lblPeriodo.text = _subject.period;
}

@end
