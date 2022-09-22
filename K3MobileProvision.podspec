Pod::Spec.new do |spec|
  spec.name         = "K3MobileProvision"
  spec.version      = "0.0.5"
  spec.summary      = "A tool to decode *mobileprovision* plist file."

  spec.description  = <<-DESC
    - A tool to decode *mobileprovision* plist file.
    - It is part of resign tool.
                   DESC

  spec.module_name  = "MobileProvision"
  spec.homepage     = "https://github.com/CrazyFanFan/MobileProvision"
  spec.license      = "GNU Affero General Public License v3.0"
  spec.author       = { "Crazy凡" => "827799383@qq.com" }
  spec.ios.deployment_target = "9.0"
  spec.osx.deployment_target = "10.10"
  # spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"
  spec.source       = { :git => "https://github.com/CrazyFanFan/MobileProvision.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/**/*.swift"
  spec.requires_arc = true
  spec.swift_versions = "5.4.2"
end
