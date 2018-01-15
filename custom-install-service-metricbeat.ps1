param(
    [Parameter(mandatory = $true)]
    [string]$ElasticSearchAddress,

    [Parameter(mandatory = $true)]
    [string]$KibanaAddress
)

$elasticSearchAddress = $ElasticSearchAddress
$kibanaAddress = $KibanaAddress

Write-Output "ElasticSearchAddress: $elasticSearchAddress";
Write-Output "KibanaAddress: $kibanaAddress";

# delete service if it already exists
if (Get-Service metricbeat -ErrorAction SilentlyContinue) {
  $service = Get-WmiObject -Class Win32_Service -Filter "name='metricbeat'"
  $service.StopService()
  Start-Sleep -s 1
  $service.delete()
}

$workdir = Split-Path $MyInvocation.MyCommand.Path
$hostname = HOSTNAME
$es_address = 

# create new service
New-Service -name metricbeat `
  -displayName metricbeat `
  -binaryPathName "`"$workdir\\metricbeat.exe`" -c `"$workdir\\metricbeat.yml`" -path.home `"$workdir`" -path.data `"C:\\ProgramData\\metricbeat`" -path.logs `"C:\\ProgramData\\metricbeat\logs`" --E ""output.elasticsearch.hosts=['$elasticSearchAddress']"" --E ""setup.kibana.host='$kibanaAddress'"" --E ""name=$hostname""" 
