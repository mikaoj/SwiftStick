Pod::Spec.new do |s|
  s.name         = "SwiftStick"
  s.version      = "0.1"
  s.summary      = "8 direction virtual joystick"
  s.description  = <<-DESC
  8 direction virtual joystick implemented in Swift
                   DESC
  s.homepage     = "https://github.com/mikaoj/SwiftStick"
  s.license      = "MIT"
  s.author             = { "Joakim Gyllström" => "joakim@backslashed.se" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/mikaoj/SwiftStick.git", :tag => "0.1" }
  s.source_files  = "SwiftStick/**/*.{h,swift}"
  s.exclude_files = "SwiftStick/Controller/*.{swift}"
  s.requires_arc = true
  s.frameworks = 'Foundation', 'UIKit', 'CoreGraphics'
  s.screenshots = ["https://cloud.githubusercontent.com/assets/4034956/4874688/26d3e87a-6269-11e4-8b28-87a8fe090df9.png",
                   "https://cloud.githubusercontent.com/assets/4034956/4874687/26ccf452-6269-11e4-8bd5-abca55fd83c6.png"]
end

