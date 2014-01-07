param($installPath, $toolsPath, $package, $project)

Import-Module (Join-Path $toolsPath NewRelicHelper.psm1)

$newRelicAgentMsiFileName = "NewRelicAgent_x64_2.19.3.0.msi"
$newRelicServerMonitorMsiFileName = "NewRelicServerMonitor_x64_3.0.219.0.msi"

Write-Host "***Updating project items newrelic.cmd and $newRelicAgentMsiFileName***"
update_newrelic_project_items $project $newRelicAgentMsiFileName $newRelicServerMonitorMsiFileName

Write-Host "***Updating the Windows Azure ServiceDefinition.csdef with the newrelic.cmd Startup task***"
update_azure_service_config $project

Write-Host "***Updating the projects .config file with the NewRelic.AppName***"
update_project_config $project

Write-Host "***Package install is complete***"





