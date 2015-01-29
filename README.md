FramedArrangement
=================

The seventh project for iOS pre-course using views and frames.

###Resources:
- Read and do the projects in Chapter 1-2 of the Big Nerd Ranch iOS Programming book. This should have been sent to you.
- Read the section on Properties in Chapter 3.
- Read this excerpt from your BNR book:
```
The UIView subclass template has provided two method stubs for you. The first is initWithFrame:, the designated initializer for UIView. This method takes one argument, a CGRect, that will become the view’s frame, a property on UIView.

@property (nonatomic) CGRect frame;

A view’s frame specifies the view’s size and its position relative to its superview. Because a view’s size is always specified by its frame, a view is always a rectangle.
A CGRect contains the members origin and size. The origin is a C structure of type CGPoint and contains two float members: x and y. The size is a C structure of type CGSize and has two float members: width and height.

Excerpt From: Conway, Joe. “iOS Programming: The Big Nerd Ranch Guide (4th Edition) (Big Nerd Ranch Guides).” 
```
- You can modify a views frame like this:
```
self.aView.frame = CGRectMake(160, 240, 100, 150);
```
- ```CGRectMake()``` expects four arguments like such:
```CGRectMake(<CGFloat x>, <CGFloat y>, <CGFloat width>, <CGFloat height>)``` 

- Cocoa views have a very basic structure use frames for origin and size. Read Apple's Documentation on "[View and Window Architecture](https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/WindowsandViews/WindowsandViews.html)"
- For Objective C read tuts+ article "[iOS Fundamentals: Frames, Bounds, and CGGeometry](http://code.tutsplus.com/tutorials/ios-fundamentals-frames-bounds-and-cggeometry--cms-21196)"
- For Swift you'll need to read the [tuts+ article](http://code.tutsplus.com/tutorials/ios-fundamentals-frames-bounds-and-cggeometry--cms-21196), there aren't many good resources yet for UIViews and Swift.

###Step 1: Create a view controller subclass
- Clone down this project (or create a new single view controller in Xcode)
- Add a view controller to the app (if you cloned down)
- Set a new instance of the view controller to the root view controller of the window

###Step 2: Add the views to the view controller
- Add a redView, greenView, blueView, yellowView property to the interface of the view controller
- Add each view to the view controller's main view in the view did load method:
```
    self.redView = [UIView new];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
```

###Step 3: Add methods to arrange the views
*4 squares like a checkerboard*  
- Add a method called layoutSquares
  - Calculate the width and height of the squares, the x of the second column and y of the second row

*4 flat horizontal rectangles stacked*  
- Add a method called layoutHorizontalRectangles
  - Calculate the width and height of the rectangles, and the y of each row

*4 tall vertical rectangles*  
- Add a method called layoutVerticalRectangles
  - Calculate the width and height of the rectangles, and the x of each column

*4 squares arranged diagonally*  
- Add a method called layoutDiagonalSquares
  - Calculate the width and height of the squares, the x and y of the each square
