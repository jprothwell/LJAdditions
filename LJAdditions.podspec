Pod::Spec.new do |s|
s.name         = "LJAdditions"
s.version      = "1.0.5"
s.summary      = "LJAdditions"
s.description  = "awesome! utils"
s.homepage     = "https://github.com/jprothwell/LJAdditions"
s.license      = "MIT"
s.author       = "Leon"
s.source       = { :git => "https://github.com/jprothwell/LJAdditions.git", :tag => s.version }
s.source_files = "**/LJAdditions/*.{h,m}"
s.ios.deployment_target = "9.0"
end


