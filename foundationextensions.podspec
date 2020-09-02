#
# Be sure to run `pod lib lint foundationextensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'foundationextensions'
  s.version          = '0.2.0'
  s.summary          = 'Helpful set of homemade Foundation extensions'

  s.homepage         = 'http://dashdevs.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dashdevs llc' => 'hello@dashdevs.com' }
  s.source           = { :git => 'https://github.com/itomych/foundationextensions.git', :tag => s.version }

  s.ios.deployment_target = '9.0'
  
  s.source_files = 'foundationextensions/Classes/**/*'
  
  s.swift_version = '4.2'
  
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |ss|
      ss.source_files = 'foundationextensions/Classes/*.{h,m,swift}'
  end
  
  s.subspec 'NSBundle' do |ss|
      ss.source_files = 'foundationextensions/Classes/NSBundle+DDExtensions.{h,m}'
  end
  
  s.subspec 'NSString' do |ss|
      ss.source_files = 'foundationextensions/Classes/NSString+DDExtensions.{h,m}'
  end
  
  s.subspec 'NSDictionary' do |ss|
      ss.source_files = 'foundationextensions/Classes/NSDictionary+DDExtensions.{h,m}'
  end
  
  s.subspec 'NSURLRequest' do |ss|
      ss.source_files = 'foundationextensions/Classes/NSURLRequest+DDExtensions.{h,m}'
  end
  
  s.subspec 'NSData' do |ss|
      ss.source_files = 'foundationextensions/Classes/NSData+DDExtensions.{h,m}'
  end
  
  s.subspec 'NSFileManager' do |ss|
      ss.source_files = 'foundationextensions/Classes/NSFileManager+DDExtensions.{h,m}'
  end
  
  s.subspec 'NSURLComponents' do |ss|
      ss.source_files = 'foundationextensions/Classes/NSURLComponents+DDExtensions.{h,m}'
  end

end
