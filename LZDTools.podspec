#
# Be sure to run `pod lib lint LZDTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LZDTools'
  s.version          = '0.1.0'
  s.summary          = 'LZDTools.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
增加一些其他的扩展e和常用的工具,
DESC

  s.homepage         = 'https://github.com/511815816@qq.com/LZDTools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '511815816@qq.com' => '511815816@qq.com' }
  s.source           = { :git => 'https://github.com/9032lu/LZDTools.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

#  s.source_files = 'LZDTools/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LZDTools' => ['LZDTools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'---3.2.1
  
  s.subspec 'Catagory' do |ca|
       ca.source_files = 'LZDTools/Classes/Catagory/*'
       ca.public_header_files = 'LZDTools/Classes/Catagory/*.h'

   end
   
   s.subspec 'LZDLoopView' do |lp|
       lp.source_files = 'LZDTools/Classes/LZDLoopView/*'
   end
   
   s.subspec 'Encryptions' do |en|
       en.source_files = 'LZDTools/Classes/Encryptions/*'
   end
   s.subspec 'PlaceholderTextView' do |en|
         en.source_files = 'LZDTools/Classes/PlaceholderTextView/*'
     end
  
end
