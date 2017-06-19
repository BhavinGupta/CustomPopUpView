Pod::Spec.new do |s|
  s.name         = "CustomPopUpView"
  s.version      = "1.0.0"
  s.summary      = "Custom Pop Up View for iPad and iPhone using Auto Layout"
  s.homepage     = "https://github.com/BhavinGupta/CustomPopUpView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Bhavin Gupta" => "bhavingupta007@yahoo.co.in" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/BhavinGupta/CustomPopUpView.git", 
		     :tag => s.version 
		   }
  s.source_files = "CustomPopUpView"
  s.requires_arc = true
end
