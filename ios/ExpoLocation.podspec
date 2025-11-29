require 'json'

package = JSON.parse(File.read(File.join(__dir__, '..', 'package.json')))

Pod::Spec.new do |s|
  s.name           = 'ExpoLocation'
  s.version        = package['version']
  s.summary        = package['description']
  s.description    = package['description'] || 'Custom modified fork of expo-location for eclipse countdown. The altitude in iOS is the altitude over the WGS84 ellipsoid.'
  s.license        = package['license']
  s.author         = package['author']
  s.homepage       = package['homepage'] || 'https://github.com/issepela/my-expo-location'
  s.platforms      = {
    :ios => '15.1'
  }
  s.source         = { git: 'https://github.com/issepela/my-expo-location.git', tag: "v#{s.version}" }
  s.static_framework = true

  s.dependency 'ExpoModulesCore'

  # Swift/Objective-C compatibility
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
  }

  s.source_files = "**/*.{h,m,swift}"
end
