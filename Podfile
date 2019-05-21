# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'BabyCare' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
pod 'CarbonKit'
pod 'Alamofire'
pod 'R.swift'
pod 'LayoutKit'
pod 'SDWebImage'
pod 'DeviceKit'
pod 'MBProgressHUD'
pod 'KLCPopup'
pod 'RxSwift', '~> 5'
pod 'RxCocoa', '~> 5'

pod 'Firebase/Core'
pod 'Firebase/Auth'
pod 'Firebase/Storage'
pod 'Kingfisher'
pod 'Firebase/Firestore'
pod 'ALLoadingView'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['LayoutKit'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.0'
      end
    end
  end
end

end
