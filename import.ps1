Import-Module ActiveDirectory
$Domain="@pp.local"
$UserOu="OU=import,DC=pp,DC=local"
$NewUsersList=Import-CSV "C:\ps\import.csv

ForEach ($User in $NewUsersList) {
$FullName=$User.SurName+" "+$User.GivenName
$DisplayName=$User.DisplayName
$Name=$User.GivenName
$surName=$User.SurName
$Department=$User.Department
$Description=$User.Title
$Title=$User.title
$OfficePhone=$User.telephoneNumber
$sAMAccountName=$User.SamAccountName
$userPassword=$User.Password
$CannotChangePassword=$User.CannotChangePassword
$PasswordNeverExpires=$User.PasswordExpired
$Company=$User.Company
$userPrincipalName=$User.SamAccountName+$Domain
$expire=$null

New-ADUser -PassThru `
        -Path $UserOu `
        -Name $FullName `
        -DisplayName $DisplayName `
        -givenName $Name `
        -SurName $SurName `
        -Department $Department `
        -Description $Description `
        -Title $Title `
        -OfficePhone $OfficePhone `
        -UserPrincipalName $userPrincipalName `
        -SamAccountName $sAMAccountName `
        -AccountPassword (ConvertTo-SecureString $userPassword -AsPlainText -Force) `
        -Enabled $true `
        -CannotChangePassword $True `
        -PasswordNeverExpires $true `
        -LogonWorkstations $LogonWorkstations `
        -Company $Company
}
