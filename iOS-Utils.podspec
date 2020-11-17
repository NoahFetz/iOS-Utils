Pod::Spec.new do |s|
  s.name = 'iOS-Utils'
  s.version = '1.6.0'
  s.summary = 'A set of convenient iOS utilities'
  s.homepage = 'https://github.com/ark-develop/iOS-Utils'
  s.license = { type: 'MIT', file: 'LICENSE.md' }
  s.author = 'ark-develop'
  s.source = { git: 'https://github.com/ark-develop/iOS-Utils.git', tag: s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'

  s.source_files = 'Sources/iOS\ Utils/**/*.swift'

  s.subspec 'Designable' do |ss|
    ss.source_files = 'Sources/iOS\ Utils/DesignableView.swift', 'Sources/iOS\ Utils/DesignableButton.swift'
  end

  s.subspec 'AlertController' do |ss|
    ss.source_files = 'Sources/iOS\ Utils/UIAlertController+Convenience.swift', 'Sources/iOS\ Utils/UIAlertController+UIWindow.swift', 'Sources/iOS\ Utils/UIApplication+UIWindow.swift'
  end

  s.subspec 'Keyboard' do |ss|
    ss.source_files = 'Sources/iOS\ Utils/KeyboardNotificationInfo.swift', 'Sources/iOS\ Utils/KeyboardObservable.swift', 'Sources/iOS\ Utils/KeyboardRespondable.swift', 'Sources/iOS\ Utils/UIApplication+UIWindow.swift'
  end
end
