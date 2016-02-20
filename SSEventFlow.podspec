Pod::Spec.new do |s|
  s.name             = "SSEventFlow"
  s.version          = "0.1.0"
  s.summary          = "SSEventFlow is a type safe alternative to NSNotification, inspired by Flux"

  s.description      = <<-DESC
                       This is a tiny implementation of the Flux Application Architecture, invented by Facebook.
                       See video to how Flux works: https://facebook.github.io/flux/docs/overview.html
                       DESC

  s.homepage         = "https://github.com/neoneye/SSEventFlow"
  s.license          = 'MIT'
  s.author           = { "Simon Strandgaard" => "neoneye@gmail.com" }
  s.source           = { :git => "https://github.com/neoneye/SSEventFlow.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/neoneye'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SSEventFlow' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
