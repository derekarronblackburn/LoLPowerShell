# Assumes api key has been stored as $apitoken
# Api key can be obtained at https://developer.riotgames.com/
[cmdletbinding()]
param(
    # Player name
    [Parameter(Mandatory)]
    [string]
    $playerName,
    # Player tag, i.e. NA1
    [Parameter(Mandatory)]
    [ValidateSet('BR1','EUN1','EUW1','JP1','KR','LA1','LA2','NA1','OC1','TR1','RU','PH2','SG2','TH2','TW2','VN2')]
    [string]
    $playerTag
)

$headers = @{
    "Accept-Language" = 'en-US,en;q=0.9'
    "Origin" = 'https://developer.riotgames.com'
    "X-Riot-Token" = $apitoken
}
$baseUrl = 'https://americas.api.riotgames.com/riot'

function Get-PlayerInfo(){
    $url = '{0}/account/v1/accounts/by-riot-id/{1}/{2}' -f $baseUrl, $playerName, $playerTag
    $playerInfo = Invoke-RestMethod -Uri $url -Headers $headers -Method GET
    return $playerInfo
}
