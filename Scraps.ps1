# Set a temporary password and the username
$password = Read-HostAsSecureString

# Set up new user
New-LocalUser -Name "Chango" _Password $password _FullName "ChangoUser" -Description "Sample User"

# Set groups
Add-LocalGroupMember -Group Users-Member Chango

________________________________________________________
