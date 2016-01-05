#
# Be sure to run `pod lib lint Polly.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Polly"
  s.version          = "0.1.0"
  s.summary          = "A short description of Polly."

  s.description      = <<-DESC
    Polyfills for iOS
                       DESC

  s.homepage         = "https://github.com/<GITHUB_USERNAME>/Polly"
  s.license          = 'MIT'
  s.author           = { "James Campbell" => "james@supmenow.com" }
  s.source           = { :git => "https://github.com/jscampbell05/Polly.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jcampbell_05

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Polly' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
