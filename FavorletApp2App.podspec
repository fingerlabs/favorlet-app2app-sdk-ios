#
# Be sure to run `pod lib lint FavorletApp2App.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FavorletApp2App'
  s.version          = '1.1.0'
  s.summary          = 'This is a library for interaction on blockchain in a native application'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/fingerlabs/favorlet-app2app-sdk-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fingerlabs' => '@fingerlabs.io' }
  s.source           = { :git => 'https://github.com/fingerlabs/favorlet-app2app-sdk-ios.git', :tag => "#{s.version}" }
  
  s.ios.deployment_target = '15.0'
  s.swift_version = '5.0'

  s.source_files = 'FavorletApp2App/Classes/**/*'
  
  # Alamofire (https://github.com/Alamofire/Alamofire)
  s.dependency 'Alamofire', '~> 5.6.2'
end
