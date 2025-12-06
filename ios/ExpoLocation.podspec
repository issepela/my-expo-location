require 'json'

package = JSON.parse(File.read(File.join(__dir__, '..', 'package.json')))

Pod::Spec.new do |s|
  s.name           = 'ExpoLocation'
  s.version        = package['version']
  s.summary        = 'Custom expo-location for iOS ellipsoid height'
  s.description    = 'Custom modified fork of expo-location to show height above the ellipsoid WGS84 also on iOS'
  s.license        = 'MIT'
  s.author         = 'issepela'
  s.homepage       = 'https://github.com/issepela/my-expo-location'
  s.platforms      = {
    :ios => '15.1'
  }
  s.source         = { :git => 'https://github.com/issepela/my-expo-location.git', :tag => "v#{s.version}" }
  s.static_framework = true

  s.dependency 'ExpoModulesCore'

  # Swift/Objective-C compatibility
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
  }

  s.source_files = "**/*.{h,m,swift}"
end