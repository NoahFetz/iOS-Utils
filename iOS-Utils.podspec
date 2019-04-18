Pod::Spec.new do |s|
    s.name = 'iOS-Utils'
    s.version = '1.2.0'
    s.summary = 'A set of convenient iOS utilities'
    s.homepage = 'https://gitlab.com/_arkdev/ios-utils'
    s.license = {:type => 'MIT', :file => 'LICENSE.md'}
    s.author = '_arkdev'
    s.source = { :git => 'https://gitlab.com/_arkdev/ios-utils.git', :tag => s.version.to_s }

    s.ios.deployment_target = '11.0'
    s.swift_version = '5.0'

    s.source_files = 'Source/**/*.swift'
end
