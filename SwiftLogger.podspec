Pod::Spec.new do |s|
  s.name              = "SwiftLogger"
  s.version           = "0.2.0"
  s.summary           = "SwiftLogger is a lightweight, no frills, logging library written in Swift"
  s.author            = { "Ayush Newatia" => "ayush.newatia@icloud.com" }
  s.platform          = :ios, '8.0'
  s.homepage          = "https://github.com/ayushn21/SwiftLogger"
  s.source            = { :git => "https://github.com/ayushn21/SwiftLogger.git", :tag => s.version.to_s }
  s.social_media_url  = 'https://twitter.com/ayushn21'
  s.license           = 'MIT'
  s.requires_arc      = true
  s.source_files      = 'SwiftLogger/*.swift'
end
