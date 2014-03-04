//
//  PhotoStackViewController.m
//
//  Created by Tom Longo
//  Edited by Daniel Larsson
//

#import "PhotoStackViewController.h"

@interface PhotoStackViewController ()
    @property (nonatomic, strong) NSMutableArray *photos;
    -(void)setup;
@end

@implementation PhotoStackViewController

@synthesize photoStack = _photoStack;



#pragma mark -
#pragma mark Getters

-(NSArray *)photos {
    if(!_photos) {

        _photos = [NSMutableArray arrayWithObjects:
                   [UIImage imageNamed:@"photo2.png"],
                   [UIImage imageNamed:@"photoLandscape.png"],
                   [UIImage imageNamed:@"photo2.png"],
                   [UIImage imageNamed:@"photoLandscape.png"],
                   [UIImage imageNamed:@"photo2.png"],
                   [UIImage imageNamed:@"photo2.png"],
                   [UIImage imageNamed:@"photo2.png"],
                   [UIImage imageNamed:@"photo2.png"],
                   [UIImage imageNamed:@"photo2.png"],
                   [UIImage imageNamed:@"photo2.png"],
                   [UIImage imageNamed:@"photo2.png"],
                   [UIImage imageNamed:@"photo2.png"],
                   nil];
    }
    return _photos;
}

-(PhotoStackView *)photoStack {
    if(!_photoStack) {        
        _photoStack = [[PhotoStackView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        _photoStack.center = CGPointMake(self.view.center.x, 300);
        _photoStack.dataSource = self;
        _photoStack.delegate = self;
    }
    
    return _photoStack;
}



#pragma mark -
#pragma mark Deck DataSource Protocol Methods

-(NSUInteger)numberOfPhotosInPhotoStackView:(PhotoStackView *)photoStack {
    return [self.photos count];
}

-(UIImage *)photoStackView:(PhotoStackView *)photoStack photoForIndex:(NSUInteger)index {
    return [self.photos objectAtIndex:index];
}



#pragma mark -
#pragma mark Deck Delegate Protocol Methods

-(void)photoStackView:(PhotoStackView *)photoStackView willStartMovingPhotoAtIndex:(NSUInteger)index
{
    // User started moving a photo
}

-(void)photoStackView:(PhotoStackView *)photoStackView willFlickAwayPhotoAtIndex:(NSUInteger)index {
    // User flicked the photo away, revealing the next one in the stack
    //[self insertPhoto];
}

-(void)photoStackView:(PhotoStackView *)photoStackView didRevealPhotoAtIndex:(NSUInteger)index {
    if ([self.photos lastObject])
        [self.photos removeObjectAtIndex:0];
}

-(void)photoStackView:(PhotoStackView *)photoStackView didSelectPhotoAtIndex:(NSUInteger)index {
    // User tapped on a photo, implement tagging here
}



#pragma mark -
#pragma mark Actions

- (void)insertPhoto {
    NSMutableArray *photosMutable = [self.photos mutableCopy];
    [photosMutable addObject:[UIImage imageNamed:@"photo1.jpg"]];
    self.photos = photosMutable;
    [self.photoStack reloadData];
}



#pragma mark -
#pragma mark Setup

-(void)setup {
    [self.view addSubview:self.photoStack];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
