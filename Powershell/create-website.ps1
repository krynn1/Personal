Set-ExecutionPolicy Bypass -Scope Process
Install-Package Carbon -AllowClobber

Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpRedirect
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment
Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpLogging
Enable-WindowsOptionalFeature -Online -FeatureName IIS-LoggingLibraries
Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestMonitor
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpTracing
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Security
Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestFiltering
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Performance
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools
Enable-WindowsOptionalFeature -Online -FeatureName IIS-IIS6ManagementCompatibility
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Metabase
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication
Enable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit
Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionDynamic
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Customlogging
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools


New-item -type directory -path c:\sites
New-item -type directory -path c:\sites\users-uat.thetread.com
New-item -type directory -path c:\sites\identity-uat.thetread.com
Add-Content -path "c:\windows\system32\drivers\etc\hosts" -Value "127.0.0.1 identity-uat.thetread.com users-uat.thetread.com"

Install-IisWebsite "users-uat.thetread.com"  -PhysicalPath "c:\sites\users-uat.thetread.com"  -Binding "http/*:80:users-uat.thetread.com" -AppPoolName "users-uat.thetread.com" -SiteID '2' -PassThru -Force
Install-IisWebsite "identity-uat.thetread.com"  -PhysicalPath "c:\sites\identity-uat.thetread.com"  -Binding "http/*:80:identity-uat.thetread.com" -AppPoolName "identity-uat.thetread.com" -SiteID '3' -PassThru -Force

$acl= Get-Acl "c:\sites\users-uat.thetread.com"
$ar= New-Object system.security.accesscontrol.filesystemaccessrule("iusr","FullControl","Allow")
$Acl.SetAccessRule($ar)


$acl= Get-Acl "c:\sites\users-uat.thetread.com"
$ar= New-Object system.security.accesscontrol.filesystemaccessrule("iis apppool\users-uat.thetread.com","FullControl","Allow")
$Acl.SetAccessRule($ar)

$acl= Get-Acl "c:\sites\identity-uat.thetread.com"
$ar= New-Object system.security.accesscontrol.filesystemaccessrule("iis apppool\identity-uat.thetread.com","FullControl","Allow")
$Acl.SetAccessRule($ar)