Pod::Spec.new do |s|
  s.name         = "UsabillaForm"
  s.version      = "0.0.7"
  s.summary      = "Making your feedback process easier"

  s.description  = <<-DESC
                   This CocoaPods library helps you to display feedback forms and user surveys easiliy.
                    DESC


  s.module_name   = 'Usabilla'
  s.ios.deployment_target  = '12.1'

  s.homepage     = "https://github.com/kutan74/UsabillaForm"
  s.license      = { :type => "MIT", :file => "LICENSE" }  
  s.author             = { "Kutan Çıngısız" => "cingisiz.akutan@gmail.com" }
  

  s.source       = { :git => "https://github.com/kutan74/UsabillaForm.git", :tag => "#{s.version}" }
  s.source_files  = "Usabilla/**/*.{h,m,swift}"
  s.swift_version = '5.0'
  
  s.ios.framework  = 'UIKit'
end
