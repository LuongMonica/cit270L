function Check-Service ([string] $service) {

  if (Get-Service -name $service -ErrorAction SilentlyContinue) {
    if ((Get-Service -name $service).Status -eq "Running") {
      Write-Host "$service is installed and running"
    }
    else {
      Write-Host "$service is installed but not running"
    }
  }
  else {
    Write-Host "$service isn't installed"
  }

}
