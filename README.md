The PhotoStackViewDataSource protocol requires two methods to be implemented. These are modelled off Apple's TableView convention so they should be familiar to most developers.

``` 
-(NSUInteger)numberOfPhotosInPhotoStackView:(PhotoStackView *)photoStack;
```

The above should return the number of photos in the PhotoStack view.

``` 
-(UIImage *)photoStackView:(PhotoStackView *)photoStack photoForIndex:(NSUInteger)index;
```

The above should return a UIImage for the provided index.

## Set Up Delegate

There is also a PhotoStackViewDelegate protocol which can be used like so:

``` 
photoStack.delegate = self;
```

This protocol contains four optional methods:

``` 
-(void)photoStackView:(PhotoStackView *)photoStackView willStartMovingPhotoAtIndex:(NSUInteger)i
```

Called when the user starts to pan the top photo with their finger.

``` 
-(void)photoStackView:(PhotoStackView *)photoStackView willFlickAwayPhotoAtIndex:(NSUInteger)index;
```

Called when the user flicks the top photo left or right with sufficient velocity to cause it to fly away and go to the bottom of the stack.

``` 
-(void)photoStackView:(PhotoStackView *)photoStackView didRevealPhotoAtIndex:(NSUInteger)index;
```

Called when a new card is revealed at the top of the stack because the previous one was flicked away.

``` 
-(void)photoStackView:(PhotoStackView *)photoStackView didSelectPhotoAtIndex:(NSUInteger)index;
```

Called when the user taps on the top photo of the stack.


## Properties

A PhotoStackView has a number of useful properties for controlling the appearance of the stack.

``` 
@property (nonatomic, strong) UIImage *borderImage;
```

The image to use for the border (default is white rounded corner, similar to eBay's).

``` 
@property BOOL showBorder;
```

Whether or not to show a border at all (default is YES).

``` 
@property float borderWidth;
```

The width of the border (default is 5.0).

``` 
@property float rotationOffset;
```

How many degrees each photo in the stack could be rotated (Default is 4.0). For example, a value of 10.0 will randomly rotate each photo from -10 to +10 degrees.

``` 
@property (nonatomic, strong) UIColor *highlightColor;
```

The overlay colour that appears when the user taps on a photo (Default is black at 0.15 alpha).


##Other Methods

Just two public methods currently: 

``` 
-(void)reloadData;
```

Reloads the data, re-fetching photos from the PhotoStackViewDataSource.

``` 
-(void)goToPhotoAtIndex:(NSUInteger)index;
```

Brings the photo at the specified index to the front.
