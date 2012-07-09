Pod::Spec.new do |s|
  s.name     = 'BSCButtonBar'
  s.version  = '0.2'
  
  s.license      = {
     :type => 'free',
     :text => 'Redistribution and use in source and binary forms is allowed without restriction'
   }  
  s.summary  = 'A button bar with animated indicator.'
  s.homepage = 'https://github.com/bsorrentino/BSCButtonBar'
  s.author   = { 'bsorrentino' => 'bartolomeo.sorrentino@gmail.com' }

  s.source   = { :git => 'https://github.com/bsorrentino/BSCButtonBar.git', :tag => '0.2' }

  s.description = '.'

  s.platform = :ios

  s.source_files = 'Classes'

  s.resources = "Resources/*.png"

  s.frameworks = 'UIKit', 'Foundation', 'CoreGraphics'

  s.requires_arc = true

end
