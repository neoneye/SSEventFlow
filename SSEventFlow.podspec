Pod::Spec.new do |s|
  s.name             = "SSEventFlow"
  s.version          = "1.3.0"
  s.summary          = "SSEventFlow is a type safe alternative to NotificationCenter, inspired by Flux"
  s.description      = <<-DESC
                       This is a tiny variant of the Flux Application Architecture, invented by Facebook.
                       See video to how Flux works: https://facebook.github.io/flux/docs/in-depth-overview
                       DESC
  s.homepage         = "https://github.com/neoneye/SSEventFlow"
  s.license          = { :type => 'MIT' }
  s.author           = { "Simon Strandgaard" => "neoneye@gmail.com" }
  s.source           = { :git => "https://github.com/neoneye/SSEventFlow.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/neoneye'
  s.swift_version = '5.2'
  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'
  s.watchos.deployment_target = '6.0'
  s.source_files = 'SSEventFlow_Framework/Classes/*'
end
