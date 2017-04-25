$lbs = $env:lbs
$accounts = $env:accounts
write-output $env:lbs + $env:accounts

#Script for lb 
#Variable declaration
$tokenURI="https://identity.api.rackspacecloud.com/v2.0/tokens"
$user=$env:user
$apikey=$env:pass
$condition=$env:condition
$jsonrackkey=@{"auth"= @{
                        "RAX-KSKEY:apiKeyCredentials" = 
                            @{

                        "username"= $($user)
                        "apiKey"=$($apikey)
                              }
                        }
             } | Convertto-Json
$lb=$env:lbs
$account=$env:accounts
$ContentType="application/json"
$jenkinsserver=$env:servername
$lbURI="https://ord.loadbalancers.api.rackspacecloud.com/v1.0/$account/loadbalancers/$lb/nodes"
$noderequest=@{"node"= @{
"condition"= $($condition)}} | Convertto-Json
$noderequest
$servers=@{""server1" = "IP"; "server2" = "IP"}
$servername=$servers["$jenkinsserver"]
#Main
#Gets the token from Rackspace
Write-Host "Token request"
$token=Invoke-Webrequest -Uri $tokenURI -Method Post -Body $jsonrackkey -ContentType "application/json"
$token
$jsonResult=$token.Content | Convertfrom-Json
$XAuthToken=$jsonResult.access.token.id
$TenantID=$jsonResult.access.token.tenant
$headers=@{"X-Auth-Token" = $XAuthToken; "X-Project-Id"=$TenantID; "Accept" = "Application/json"}
#Gets loadbalnace information on the nodes
$nodes=Invoke-WebRequest -Uri $lbURI  -ContentType application/json -Headers $headers
$jsonNodesResult=$nodes.Content| Convertfrom-Json
#$jsonNodesResult | Get-Member -MemberType NoteProperty 
for($x=0; $x -le $jsonNodesResult.nodes.Length; $x++){
if($jsonNodesResult.nodes[$x].address -eq $servername){
$id=$jsonNodesResult.nodes[$x].id
$status=$jsonNodesResult.nodes[$x].status
$ip=$jsonNodesResult.nodes[$x].address
}
}
$nodesURI="https://ord.loadbalancers.api.rackspacecloud.com/v1.0/$account/loadbalancers/$lb/nodes/$id/"
#Invoke-WebRequest -Uri $nodesURI  -ContentType $ContentType -Headers $headers
#Write-Host $status
if($status -ne $condition){
Write-Host "Second request"
Write-Host $nodesURI $noderequestdisabled $headers
Invoke-WebRequest -Uri $nodesURI -Body $noderequest  -ContentType $ContentType -Headers $headers -Method PUT
Write-Host "Node is $condition"
}
else{Write-Host "Node is ALREADY $condition"}
