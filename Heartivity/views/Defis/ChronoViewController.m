//
//  ChronoViewController.m
//  Heartivity
//
//  Created by Manouana on 20/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "ChronoViewController.h"

@interface ChronoViewController ()

@end

@implementation ChronoViewController
@synthesize chronolabel = _chronolabel;
@synthesize timeP = _timeP;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startChrono:(id)sender {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];
}
- (void)timerTick:(NSTimer *)timer {
    
    NSDate *now = [NSDate date];
    
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"h:mm:ss a";  // very simple format  "8:47:22 AM"
    }
    self.chronolabel.text = [dateFormatter stringFromDate:now];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
