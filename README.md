# UIMagnifyImageView
UIMagnifyImageView is an UILabel extention that supports truncation string for "read more" cases when the text is too large to fit the UILabel frame.

UIMagnifyImageView supports dynamic font size and attributed string values.

[![License](http://img.shields.io/packagist/l/doctrine/orm.svg)](http://cocoadocs.org/docsets/UIMagnifyImageView)
[![cocoapods](http://img.shields.io/cocoapods/v/UIMagnifyImageView.svg)](http://cocoadocs.org/docsets/UIMagnifyImageView)

![UIMagnifyImageView](https://github.com/hayek/UIMagnifyImageView/blob/master/UIMagnifyImageView/Screen%20Shot.png?raw=true)

## Usage
To use UIMagnifyImageView, create a UIMagnifyImageView programaticly or set a UILabel's class to UIMagnifyImageView in storyboard.


An example of making a UIMagnifyImageView:

```objective-c
UIMagnifyImageView *readMoreLabel = [[UIMagnifyImageView alloc] initWithFrame:self.view.bounds];
[readMoreLabel setTruncationString:@"... Continue Reading"];

[self.view addSubView:readMoreLabel];
```

There's also isTruncated property that will be set to YES in case the text was truncated.

## Installation
UIMagnifyImageView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'UIMagnifyImageView', '~> 1'
    
Or Manually add the two source files into your Xcode project.


## License
UIMagnifyImageView is licensed under the The MIT License (MIT) license found in the LICENSE file in the root directory of this source tree.