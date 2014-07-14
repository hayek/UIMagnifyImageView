Pod::Spec.new do |s|
  s.name         = 'UIMagnifyImageView'
  s.version      = '1.2'
  s.license      =  { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = 'http://hayek.github.io/UIMagnifyImageView'
  s.authors      =  {'Amir Hayek' => 'free4sale@gmail.com'}
  s.summary      = 'Peekable image view'
  s.description      = <<-DESC
                       UIMagnifyImageView is a UIView extention that shows an image inside loupe that when touched pops the image. It's useful in cases where you want to let the user view an image quickly without moving to other screen.
                       DESC

# Source Info
  s.platform     =  :ios, '7.0'
  s.source       =  {:git => 'https://github.com/hayek/UIMagnifyImageView.git', :tag => s.version.to_s}
  s.source_files = 'UIMagnifyImageView/Source/*'
  s.framework    =  'Foundation', 'CoreGraphics', 'UIKit'

  s.requires_arc = true
  
# Pod Dependencies
  s.dependency 'AsyncImageView', '~> 1.5'

end