Pod::Spec.new do |s|
  s.name           = 'ExpoLocation'
  s.version        = '19.0.7'
  s.summary        = 'Custom expo-location'
  s.description    = 'Custom modified fork of expo-location for eclipse countdown. The altitude in iOS is the altitude over the WGS84 ellipsoid.'
  s.homepage       = 'https://github.com/issepela/my-expo-location'
  s.license        = { :type => 'MIT' }
  s.author         = { 'YOU' => 'issepela@gmail.com' }

  s.platforms      = { :ios => '13.0' }

  s.source = {
    :git => 'https://github.com/issepela/my-expo-location.git',
    :tag => "v#{s.version}"
  }

  s.source_files   = 'ios/**/*.{h,m,mm,swift}'
  s.requires_arc   = true

  s.swift_version  = '5.0'

  s.dependency 'ExpoModulesCore'
end
