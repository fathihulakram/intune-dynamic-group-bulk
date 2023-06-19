Connect-MgGraph -Scopes "Group.ReadWrite.All"

# Read the CSV file (change it to your desired data)
$data = Import-Csv -Path 'C:\Users\dell\Desktop\Book2.csv'

# Loop through each row in the CSV
foreach ($row in $data) {
    $groupName = $row.GroupName
    $displayName = $row.GroupName
    $mailNickname = $row.MailNickname
    $rule = $row.Rule  

    # Print the values
    Write-Output "Group Name: $groupName"
    Write-Output "Display Name: $displayName"
    Write-Output "Mail Nickname: $mailNickname"
    Write-Output "Rule: $rule"

    # Create the dynamic group
    $headers = @{
        'Content-Type' = 'application/json'
    }
    $body = @{
        displayName = $displayName
	      mailEnabled = $false
	      securityEnabled = $true
        mailNickname = $mailNickname
	      membershipRuleProcessingState = "On"
        membershipRule = $rule
        groupTypes = @('DynamicMembership')
    } | ConvertTo-Json

    $group = Invoke-MgGraphRequest -Uri 'https://graph.microsoft.com/v1.0/groups' -Method 'POST' -Headers $headers -Body $body -ErrorAction Stop

    Write-Output "Group created: $($group.displayName)"

    Write-Output "-----------------------"
}
