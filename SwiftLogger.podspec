Pod::Spec.new do |s|
  s.name              = "SwiftLogger"
  s.version           = "0.1.0"
  s.summary           = "SwiftLogger is a lightweight, no frills, logging library written in Swift"
  s.author            = { "Ayush Newatia" => "ayush.newatia@icloud.com" }
  s.platform          = :ios, '8.0'
  s.requires_arc      = true
  s.source_files      = 'SwiftLogger/*.swift'
end
