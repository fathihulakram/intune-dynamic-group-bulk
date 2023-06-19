# Bulk create for dynamic group in Microsoft Intune
This PowerShell script is created for Ministry of Education (MOE) of Malaysia in conjucntion with Microsoft M365A1 provisioning project. This script greatly reduce our time to create multiple dynamic device group in Microsoft Intune instead of creating them manually in the Intune portal. The value of the dynamic group is determined by CSV file that would be created before executing the script.

## 1. Pre-requisite 
- [PowerShell 7.3.4](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3 "Visit PowerShell Website") or later
- Microsoft Graph

## 2. Installation
1. Install [PowerShell 7.3.4](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3 "Visit PowerShell Website") or later
2. Install Microsoft Graph module using PowerShell
```
Install-Module -Name Microsoft.Graph
```

## 3. CSV file creation
1. Create a .csv file with three column: `GroupName`, `MailNickname` and `Rule`.
2. `MailNickname` value can be anything since it is required detail for Intune. Mail is already dislabled for dynamic group by this line:
```
mailEnabled = $false
```
3. Value for `Rule` must comply with Intune rule syntax. For example:
```
(device.displayName -contains "SABAH_01_XBA3001")
```

## 4. Usage
1. Import Microsoft Graph module in PowerShell
```
Import-Module -Name Microsoft.Graph
```
2. Sign-in to Microsoft Graph using your credential
```
Connect-MgGraph -Scopes "Group.ReadWrite.All"
```
3. Edit `bulkCreate.ps1` to replace the path to your CSV file
```
# Read the CSV file
$data = Import-Csv -Path 'C:\Users\dell\Desktop\Book2.csv'
```
