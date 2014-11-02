Pod::Spec.new do |s|
  s.name         = "SwiftStick"
  s.version      = "0.1"
  s.summary      = "SwiftStick is a virtual joystick implemented in Swift"
  s.description  = <<-DESC
  8 direction virtual joystick
                   DESC
  s.homepage     = "https://github.com/mikaoj/SwiftStick"
  s.license      = "MIT"
  s.author             = { "Joakim Gyllström" => "joakim@backslashed.se" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/mikaoj/SwiftStick.git", :tag => "0.1" }
  s.source_files  = "SwiftStick/View/*.{swift}"
  s.requires_arc = true
  s.frameworks = 'UIKit'
  s.screenshots = ["https://cloud.githubusercontent.com/assets/4034956/4519853/de47afca-4ccd-11e4-9b6b-1a5aea5d9a69.png",
                   "https://cloud.githubusercontent.com/assets/4034956/4519855/de4df42a-4ccd-11e4-865c-4d2e8de6b135.png",
                   "https://cloud.githubusercontent.com/assets/4034956/4519854/de4a3c68-4ccd-11e4-8258-314ead7e959c.png"]
end

