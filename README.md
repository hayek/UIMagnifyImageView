# UIMagnifyImageView
UIMagnifyImageView is a UIView extention that shows an image inside loupe that when touched pops the image. It's useful in cases where you want to let the user view an image quickly without moving to other screen.

UIMagnifyImageView is optemised to work inside UITableView.

[![License](http://img.shields.io/packagist/l/doctrine/orm.svg)](http://cocoadocs.org/docsets/UIMagnifyImageView)
[![cocoapods](http://img.shields.io/cocoapods/v/UIMagnifyImageView.svg)](http://cocoadocs.org/docsets/UIMagnifyImageView)

![UIMagnifyImageView](https://github.com/hayek/UIMagnifyImageView/blob/master/UIMagnifyImageView/Screen%20Shot.gif?raw=true)

## Usage
To use UIMagnifyImageView, create a UIMagnifyImageView programaticly or set a UIView's class to UIMagnifyImageView in storyboard.


An example of making a UIMagnifyImageView:

```objective-c
UIMagnifyImageView *magnifyView = [[UIMagnifyImageView alloc] initWithFrame:self.view.bounds];
[magnifyView setImage:@"image.png"];

[self.view magnifyView];
```
####Setting the image
UIMagnifyImageView uses [AsyncImageView] (https://github.com/nicklockwood/AsyncImageView) for the images.

```objective-c
@property (retain, nonatomic) NSURL* imageUrl;
@property (retain, nonatomic) UIImage* image;
```

####wrapperView property
When set, UIMagnifyImageView presents the image on it upon touch.
To use UIMagnifyImageView inside UITableViewCell set the wrapperView property to the table's view. 

####Multiple views
Multiple UIMagnifyImageViews can work together out of the box. User can pan finger between views to browse the images in them without lifting the finger. Views can be seperated into groups by giving them same tag number.

## Installation
UIMagnifyImageView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'UIMagnifyImageView', '~> 1.1'
    
Or Manually add the source files into your Xcode project.


## License
UIMagnifyImageView is licensed under the The MIT License (MIT) license found in the LICENSE file in the root directory of this source tree.