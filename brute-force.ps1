function brute-force-login {
    param(
        [array]$userList,
        [array]$passwordList
    )

    # Simulated correct credentials
    $userPasswords = @{
        "luke" = "1234"
        "leia" = "5678"
        "han"  = "abcd"
    }

    foreach ($user in $userList) {

        if (-not $userPasswords.ContainsKey($user)) {
            Write-Host "User $user not found.`n"
            continue
        }

        foreach ($password in $passwordList) {
            Write-Host "Trying: $user with $password"

            if ($password -eq $userPasswords[$user]) {
                Write-Host "SUCCESS: $user logged in with $password`n"
                break  # Stop trying passwords for this user
            }
        }
    }
}

# Example usage
$users = @("luke","leia","han","vader")
$passwords = @("1111","1234","abcd","5678","0000")

brute-force-login -userList $users -passwordList $passwords
