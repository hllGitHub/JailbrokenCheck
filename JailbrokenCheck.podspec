#
# Be sure to run `pod lib lint JailbrokenCheck.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JailbrokenCheck'
  s.version          = '0.1.0'
  s.summary          = '一款越狱检测小工具.'

  s.description      = '用来作为越狱检测和外部依赖注入检测，越狱和防越狱是无止尽的，所以这个工具会不断更新'
  s.swift_version = '4.0'

  s.homepage         = 'https://github.com/hllGitHub/JailbrokenCheck'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hllGithub' => 'hllfj922@gmail.com' }
  s.source           = { :git => 'https://github.com/hllGithub/JailbrokenCheck.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'JailbrokenCheck/Classes/**/*'
end
