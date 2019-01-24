Pod::Spec.new do |s|

  # 基本信息
  s.name         = "iOSUtil"
  s.version      = "0.0.1"
  s.summary      = "iOS 工具类"
  s.description  = <<-DESC
                   DESC

  s.homepage     = "http://EXAMPLE/iOSUtil"

  # 开源协议
  s.license      = "MIT"

  # 作者信息
  s.author             = { "chales" => "charles@bqteam.com" }
  
  # 适用平台
  s.platform     = :ios
  # s.platform     = :ios, "5.0"

  # 地址（这里不支持ssh的地址，只支持HTTP和HTTPS，最好使用HTTPS）
  s.source       = { :git => "https://github.com/Charles1198/iOSUtil.git" }

  # 源码
  s.source_files  = "iOSUtil", "iOSUtil/*.swift"

  # 所需的framework,多个用逗号隔开
  s.frameworks = 'UIKit', 'Foundation' 

  # 模块名称
  s.module_name = 'O2View'             

end
