$repos = Invoke-RestMethod -Uri "https://api.github.com/orgs/THD-C/repos" -Method Get -Headers @{
    "Authorization"= "Bearer $(gh auth token)"
    "Accept" = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
}

foreach($r in $repos){
    $UrlToClone = $r.clone_url
    git clone $UrlToClone
    $repoName = "THDc-$($r.name)"
    Compress-Archive -Path $($r.name) -DestinationPath "$repoName.zip"
    Remove-Item -Path $($r.name) -Recurse -Force
}