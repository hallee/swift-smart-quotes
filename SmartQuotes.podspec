Pod::Spec.new do |s|
    s.name = 'SmartQuotes'
    s.version = '0.0.1'
    s.swift_version = '5.0'
    s.summary = 'String extension for typographically correct quotes & apostrophes'
    s.description = <<-DESC
A simple String extension for converting straight apostrophes and quotes in to typographically correct curly versions.
    DESC
    s.homepage = 'https://github.com/hallee/swift-smart-quotes'
    s.license = { :type => 'MIT', :file => 'LICENSE' }
    s.author = { 'Hal Lee' => 'hal@lee.me' }
    s.source = { :git => 'https://github.com/hallee/swift-smart-quotes.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/hal_lee'
    s.ios.deployment_target = '9.0'
    s.tvos.deployment_target = '9.0'
    s.osx.deployment_target = '10.11'
    s.source_files = 'Sources/**/*.{swift}'
end