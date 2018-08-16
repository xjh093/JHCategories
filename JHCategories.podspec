
Pod::Spec.new do |s|
  s.name         = 'JHCategories'
  s.summary      = 'A chainable categories for UIView'
  s.version      = '1.0.1'
  s.license      = { :type => 'MIT'}
  s.authors      = { 'Haocold' => 'xjh093@126.com' }
  s.homepage     = 'https://github.com/xjh093/JHCategories-Chainable'

  s.ios.deployment_target = '8.0'

  s.source       = { :git => 'https://github.com/xjh093/JHCategories-Chainable.git', :tag => "1.0.0"}
  
  s.source_files = 'JHCategories/**/*.{h,m}'
  s.public_header_files = 'JHCategories/**/*.{h}'
  s.requires_arc = true
  s.frameworks = 'UIKit', 'Foundation'

end