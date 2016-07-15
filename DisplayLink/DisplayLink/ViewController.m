//
//  ViewController.m
//  DisplayLink
//
//  Created by TomatoPeter on 16/7/13.
//  Copyright © 2016年 ChenJianglin. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayRun:)];
    link.frameInterval = 30;
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    //默认是每秒钟60帧， 此时
//    NSTimer初始化器接受调用方法逻辑之间的间隔作为它的其中一个参数，预设一秒执行30次。CADisplayLink默认每秒运行60次，通过它的frameInterval属性改变每秒运行帧数，如设置为2，意味CADisplayLink每隔一帧运行一次，有效的逻辑每秒运行30次。
//    
//    此外，NSTimer接受另一个参数是否重复，而把CADisplayLink设置为重复（默认重复？）直到它失效。
//    
//    还有一个区别在于，NSTimer一旦初始化它就开始运行，而CADisplayLink需要将显示链接添加到一个运行循环中，即用于处理系统事件的一个Cocoa Touch结构。
//    
//    NSTimer 我们通常会用在背景计算，更新一些数值资料，而如果牵涉到画面的更新，动画过程的演变，我们通常会用CADisplayLink。
    
//    一但 CADisplayLink 以特定的模式注册到runloop之后，每当屏幕需要刷新的时候，runloop就会调用CADisplayLink绑定的target上的selector，这时target可以读到 CADisplayLink 的每次调用的时间戳，用来准备下一帧显示需要的数据。例如一个视频应用使用时间戳来计算下一帧要显示的视频数据。在UI做动画的过程中，需要通过时间戳来计算UI对象在动画的下一帧要更新的大小等等。
//    在添加进runloop的时候我们应该选用高一些的优先级，来保证动画的平滑。可以设想一下，我们在动画的过程中，runloop被添加进来了一个高优先级的任务，那么，下一次的调用就会被暂停转而先去执行高优先级的任务，然后在接着执行CADisplayLink的调用，从而造成动画过程的卡顿，使动画不流畅。
//
//    iOS设备的屏幕刷新频率是固定的，CADisplayLink在正常情况下会在每次刷新结束都被调用，精确度相当高。
//    NSTimer的精确度就显得低了点，比如NSTimer的触发时间到的时候，runloop如果在阻塞状态，触发时间就会推迟到下一个runloop周期。并且 NSTimer新增了tolerance属性，让用户可以设置可以容忍的触发的时间的延迟范围。
//    CADisplayLink使用场合相对专一，适合做UI的不停重绘，比如自定义动画引擎或者视频播放的渲染。NSTimer的使用范围要广泛的多，各种需要单次或者循环定时处理的任务都可以使用。在UI相关的动画或者显示内容使用 CADisplayLink比起用NSTimer的好处就是我们不需要在格外关心屏幕的刷新频率了，因为它本身就是跟屏幕刷新同步的。
    
}
- (void)displayRun:(CADisplayLink *)link
{
    self.view.backgroundColor = [UIColor colorWithRed:(arc4random()%100)/100.0 green:(arc4random()%100)/100.0 blue:(arc4random()%100)/100.0 alpha:0.5];
    NSLog(@"%f", link.timestamp);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
