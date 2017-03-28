Pod::Spec.new do |s|
  s.name             = "ImagePreview"
  s.version          = "0.5.0"
  s.summary          = "Render low-res image previews with only ~200 bytes of unique data generated by the Q42.ImagePreview.net library."

  s.description      = <<-DESC
ImagePreview.swift is a Swift client for rendering the ~200 byte preview images generated by the https://github.com/Q42/Q42.ImagePreview.net lib.
                       DESC

  s.homepage         = "https://github.com/Q42/Q42.ImagePreview.swift"
  s.screenshots      = "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/screen1.png", "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/screen2.png"
  s.license          = 'MIT'
  s.author           = { "Tim van Steenis" => "vansteenis.tim@gmail.com" }
  s.source           = { :git => "https://github.com/Q42/Q42.ImagePreview.swift.git", :tag => s.version }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'src/*'

end
