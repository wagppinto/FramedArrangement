//
//  ViewController.m
//  FramedArrangement
//
//  Created by Joshua Howland on 12/23/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// Properties are added here

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *yellowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // This is the method that is called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set. In our case, it's using a storyboard and is being called after the storyboard is completed.
    
    
    // A frame is made up of 4 parts (x, y, width, height)
    
    // The x is the horizontal location on the screen. It starts at 0 on the left and as you move right the value increases.
    
    // The y is the vertical location on the screen. It starts at 0 at the top and as you move down the value increases.

    
    self.redView = [UIView new];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];

    self.blueView = [UIView new];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];

    self.greenView = [UIView new];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];
    
    self.yellowView = [UIView new];
    self.yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.yellowView];
    
    [self layoutSquares];
    // [self layoutHorizontalRectangles];
    // [self layoutVerticalRectangles];
    // [self layoutDiagonalSquares];

}

- (void)layoutSquares {

    // Let's make the width and height of the squares 1/2 the width of the screen
    
    CGFloat squareWidth = self.view.frame.size.width / 2;
    CGFloat squareHeight = self.view.frame.size.width / 2;

    // The frames for the second column need to have an x value that starts at the end of the first column (that's 0 + their width)
    
    CGFloat secondColumnX = squareWidth;

    // The frames of the first row should be 64 (or some other number larger than 20) so that it isn't behind the status bar
    // The frames for the second row need to have a y value that starts at the bottom of the first row
    
    CGFloat topRowY = 64;
    CGFloat secondRowY = topRowY + squareHeight;

    // Then we can set all the values. They could also be set direclty, but these calculations and variables make it easier to debug and see what is going on.
    
    self.redView.frame = CGRectMake(0, topRowY, squareWidth, squareHeight);
    self.blueView.frame = CGRectMake(secondColumnX, topRowY, squareWidth, squareHeight);
    self.greenView.frame = CGRectMake(0, secondRowY, squareWidth, squareHeight);
    self.yellowView.frame = CGRectMake(secondColumnX, secondRowY, squareWidth, squareHeight);

}

- (void)layoutHorizontalRectangles {

    // Let's make the rectangles the full width of the screen, and their height 1/4th the width (so that it's still a square)
    
    CGFloat rectangleWidth = self.view.frame.size.width;
    CGFloat rectangleHeight = self.view.frame.size.width / 4;

    // We can start the first row at 64 again, and then just add the height of a row to get the top of each row.
    
    CGFloat topRowY = 64;
    CGFloat secondRowY = topRowY + rectangleHeight;
    CGFloat thirdRowY = secondRowY + rectangleHeight;
    CGFloat fourthRowY = thirdRowY + rectangleHeight;
    
    self.redView.frame = CGRectMake(0, topRowY, rectangleWidth, rectangleHeight);
    self.blueView.frame = CGRectMake(0, secondRowY, rectangleWidth, rectangleHeight);
    self.greenView.frame = CGRectMake(0, thirdRowY, rectangleWidth, rectangleHeight);
    self.yellowView.frame = CGRectMake(0, fourthRowY, rectangleWidth, rectangleHeight);
    
}

- (void)layoutVerticalRectangles {
    
    // Everything is just rotated from the y values to the x values to make the rectangles layout horizontally.
    
    CGFloat rectangleWidth = self.view.frame.size.width / 4;
    CGFloat rectangleHeight = self.view.frame.size.width;

    CGFloat topY = 64;

    CGFloat secondColumnX = rectangleWidth;
    CGFloat thirdColumnX = secondColumnX + rectangleWidth;
    CGFloat fourthColumnX = thirdColumnX + rectangleWidth;
    
    self.redView.frame = CGRectMake(0, topY, rectangleWidth, rectangleHeight);
    self.blueView.frame = CGRectMake(secondColumnX, topY, rectangleWidth, rectangleHeight);
    self.greenView.frame = CGRectMake(thirdColumnX, topY, rectangleWidth, rectangleHeight);
    self.yellowView.frame = CGRectMake(fourthColumnX, topY, rectangleWidth, rectangleHeight);
    
}

- (void)layoutDiagonalSquares {

    // We'll make the squares 1/2 the width again.
    
    CGFloat squareWidth = self.view.frame.size.width / 2;
    CGFloat squareHeight = self.view.frame.size.width / 2;

    // I want to lay out the views diagonally overlapping so that they are evenly distributted and begin at the left side of the screen and end at the right side of the screen.
    // Each view needs to overlap 2/3 of the other in order to evenly distribute. That means it needs to start 1/3 into the view.
    // Another way to look at it is that after you have the first square, if you want to evenly space the rest of the squares you have 1 square worth of space to fit 3 squares, so they each only get 1/3 of a square width.
    
    CGFloat topRowY = 64;
    CGFloat secondRowY = topRowY + squareHeight / 3;
    CGFloat thirdRowY = secondRowY + squareHeight / 3;
    CGFloat fourthRowY = thirdRowY + squareHeight / 3;

    CGFloat secondColumnX = squareWidth / 3;
    CGFloat thirdColumnX = secondColumnX + squareWidth / 3;
    CGFloat fourthColumnX = thirdColumnX + squareWidth / 3;
    
    self.redView.frame = CGRectMake(0, topRowY, squareWidth, squareWidth);
    self.blueView.frame = CGRectMake(secondColumnX, secondRowY, squareWidth, squareWidth);
    self.greenView.frame = CGRectMake(thirdColumnX, thirdRowY, squareWidth, squareWidth);
    self.yellowView.frame = CGRectMake(fourthColumnX, fourthRowY, squareWidth, squareWidth);
    
}

@end
