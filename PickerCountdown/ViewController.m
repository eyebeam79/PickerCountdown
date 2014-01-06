//
//  ViewController.m
//  PickerCountdown
//
//  Created by SDT1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (void)startTimer;
- (void)stopTimer;
@end

@implementation ViewController
{
    NSTimer *timer;
    bool timerWorking;
}

// 각 초마다 1분씩 감소
- (void)tickDown:(NSTimer *)timer
{
    self.datePicker.countDownDuration = self.datePicker.countDownDuration - 60;
    
    // 1분이내면 정지
    if (self.datePicker.countDownDuration <= 60)
    {
        NSLog(@"Done!");
        [self stopTimer];
    }
}

// 타이머시작
- (void)startTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tickDown:) userInfo:nil repeats:YES];
}

// 타이머정지
- (void)stopTimer
{
    [timer invalidate];
    timer = nil;
    timerWorking = NO;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)togleTimer:(id)sender
{
    // 버튼토글 설정
    NSString *title = timerWorking ? @"Start" : @"Stop";
    [sender setTitle:title forState:UIControlStateNormal];
    timerWorking = !timerWorking;
    
    if (timerWorking)
    {
        [self startTimer];
    }
    else
    {
        [self stopTimer];
    }
}

@end
