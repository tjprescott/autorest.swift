# Uncomment the next line to define a global platform for your project
platform :macos, '10.10'
workspace 'AutorestSwift'

target 'AutorestSwift' do
  # Comment the next line if you don't want to use dynamic frameworks
  # use_frameworks!

  project 'AutorestSwift'

  # Pods for AutorestSwift
  pod 'Yams'
  pod 'Stencil', :git => 'https://github.com/stencilproject/Stencil.git', :branch => 'trim_whitespace'
  pod 'SwiftFormat/CLI'
  pod 'SwiftLint'

  target 'AutorestSwiftTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Yams'
  end
end

#target 'SwiftApiView' do
#  # Comment the next line if you don't want to use dynamic frameworks
#  # use_frameworks!
#
#  project 'SwiftApiView'
#
#  # Pods for SwiftApiView
#  pod 'SwiftSyntax'
#end
