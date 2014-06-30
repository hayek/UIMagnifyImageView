Pod::Spec.new do |s|
  s.name         = 'UIMagnifyImageView'
  s.version      = '1.0'
  s.license      =  { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = 'https://github.com/hayek/UIMagnifyImageView'
  s.authors      =  {'Amir Hayek' => 'free4sale@gmail.com'}
  s.summary      = '<#Summary (Up to 140 characters#>'
  s.description      = <<-DESC
                       UIReadMoreLabel is an UILabel extention that supports truncation string for "read more" cases when the text is too large to fit the UILabel frame. UIReadMoreLabel supports dynamic font size and attributed string values.
                       DESC

# Source Info
  s.platform     =  :ios, '7.0'
  s.source       =  :git => 'https://github.com/hayek/UIMagnifyImageView.git', :tag => '<#Tag name#>'
  s.source_files = '<#Resources#>'
  s.framework    =  '<#Required Frameworks#>'

  s.requires_arc = true
  
# Pod Dependencies
  s.dependencies =	pod 'AsyncImageView', '~> 1.5'

end