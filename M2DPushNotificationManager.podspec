#
# Be sure to run `pod lib lint M2DPushNotificationManager.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "M2DPushNotificationManager"
  s.version          = "0.1.3"
  s.summary          = "Get device token and send to your server."
  s.description      = <<-DESC
						Get device token from APNS and send to your server.
                       DESC
  s.license          = 'MIT'
  s.author           = { "Akira Matsuda" => "akira.m.itachi@gmail.com" }
  s.source           = { :git => "https://github.com/0x0c/M2DPushNotificationManager.git", :tag => s.version.to_s }
  s.homepage         = "https://github.com/0x0c/M2DPushNotificationManager"

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  # s.public_header_files = 'Pod/Classes/**/*.h'
end
