//
//  FirstViewController.m
//  KVODemo
//
//  Created by Maybe on 14-1-5.
//  Copyright (c) 2014年 Maybe. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstView.h"

@interface FirstViewController ()
{
    FirstView *_fView;
    NSString *_name;
}
@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
   
    _fView = [[FirstView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:_fView];
    [_fView addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:NULL];
//    fView.value = @"hello,world!";
    [_fView setValue:@"where are you from? " forKey:@"value"];
    

    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSString * newValue = [object valueForKeyPath:keyPath];
    NSLog(@"The key path %@ changed to %@",keyPath,newValue);
 //   NSLog(@"fView.vlaue = %@",_fView.value);
//    NSLog(@"%@",change);
//    NSString * newValue = [change objectForKey:NSKeyValueChangeNewKey];
//    NSString * oldValue = [change objectForKey:NSKeyValueChangeOldKey];
//    NSLog(@"The key path %@ changed from %@ to %@",keyPath,oldValue,newValue);
   // NSLog(@"I heard about the change!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"value"];
}
@end
