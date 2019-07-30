# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

target 'VIPERSwift' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  

  # Pods for VIPERSwift

  pod 'Alamofire'
  pod 'ObjectMapper'
  pod 'RxSwift', '~> 4.4.0'
  pod 'RxAlamofire', '~> 4.4.0'
  
  target 'VIPERSwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'VIPERSwiftUITests' do
    inherit! :complete
    # Pods for testing
  end
  

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
    end
  end
end
