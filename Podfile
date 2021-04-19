# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

workspace 'DIExample.xcworkspace'
use_frameworks!

project 'DIExample'
project 'DIExamplePresenter/DIExamplePresenter'

def shared_pods
  pod 'Swinject', '2.7.0'
  pod 'SwinjectAutoregistration', '2.7.0'
end

target 'DIExample' do
  project 'DIExample.xcodeproj'
  shared_pods
end

target 'DIExamplePresenter' do
  project 'DIExamplePresenter/DIExamplePresenter.xcodeproj'
  shared_pods
end
