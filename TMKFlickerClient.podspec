Pod::Spec.new do |s|
  s.name         = "TMKFlickerClient"
  s.version      = "0.0.1"
  s.summary      = "Flicker client"

  s.description  = <<-DESC
                   A Flicker client.
                   DESC

  s.homepage     = "https://github.com/tmtk75/TMKFlickerClient"
  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author       = 'Tomotaka Sakuma'
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/tmtk75/TMKFlickerClient.git", :tag => "0.0.1" }
  s.source_files  = 'TMKFlickerClient', 'TMKFlickerClient/**/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'

  s.dependency 'ReactiveCocoa'
  s.dependency 'Mantle'

end
