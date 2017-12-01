#
# Be sure to run `pod lib lint SZWorkPods.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SZWorkPods'
  s.version          = '0.1.0'
  s.summary          = 'Engineering auxiliary tools.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/sunzeboy/SZWorkPods'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sunzeboy' => '13162153278@163.com' }
  s.source           = { :git => 'https://github.com/sunzeboy/SZWorkPods.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SZWorkPods/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SZWorkPods' => ['SZWorkPods/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'Foundation'
  s.dependency 'SDWebImage', '~> 3.7.2'
  s.dependency 'FMDB'
  s.dependency 'Masonry'

end
