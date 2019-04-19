Pod::Spec.new do |s|
    s.name = 'iOS-Utils'
    s.version = '1.2.1'
    s.summary = 'A set of convenient iOS utilities'
    s.homepage = 'https://github.com/ark-develop/iOS-Utils'
    s.license = {:type => 'MIT', :file => 'LICENSE.md'}
    s.author = 'ark-develop'
    s.source = { :git => 'https://github.com/ark-develop/iOS-Utils.git', :tag => s.version.to_s }

    s.ios.deployment_target = '11.0'
    s.swift_version = '5.0'

    s.source_files = 'Source/**/*.swift'
end
