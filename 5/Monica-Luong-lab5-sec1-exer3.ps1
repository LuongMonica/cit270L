"For TapiSrv:"
get-service tapisrv | format-list -Property dependentServices, requiredServices

"For RpcSs:"
get-service Rpcss | format-list -Property requiredServices

if (get-service DcomLaunch -RequiredServices) {}
else {"For DcomLaunch: no RequiredServices"}

if (get-service RpcEptMapper -RequiredServices) {}
else {"For RpcEptMapper: no RequiredServices"}