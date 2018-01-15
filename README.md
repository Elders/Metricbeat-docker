# Metricbeat

## Setup

### Linux

`docker run --restart=always -d --name {container-name} elders/metricbeat-docker:{tag} metricbeat -e --E "output.elasticsearch.hosts=['{elastic-search-url-with-port}']" --E "setup.kibana.host='{kibana-search-url-with-port}'"  --E "name={name-to-show-as-host}"`

Example:
`docker run --restart=always -d --name metricbeat elders/metricbeat-docker:0.1.0 metricbeat -e --E "output.elasticsearch.hosts=['172.17.0.1:9200']" --E "setup.kibana.host='172.17.0.1:5601'"  --E "name=pruvit-production-log"`


### Windows
1. Download windows version of metric beat from https://www.elastic.co/downloads/beats/metricbeat
2. Modify metricbeat.yml
3. Install metricbeat service by executing in powershell `.\install-service-metricbeat.ps1


#### Windows example with custom install-service-metricbeat and metricbeat.yml
1. Download windows version of metric beat from https://www.elastic.co/downloads/beats/metricbeat
2. Use provided `custom-windows-metricbeat.yml` from this repo. Donwload it, rename it to metricbeat and place it in metricbeat folder from point 1
3. Use provided `custom-install-service-metricbeat.ps1` from this repo and place it inside metricbeat folder from point 1
4. Install metric beat service by executing in powershell `.\custom-install-service-metricbeat.ps1 -ElasticSearchAddress '{elastic-search-url-with-port}' -KibanaAddress '{kibana-search-url-with-port}'`
Example: `.\custom-install-service-metricbeat.ps1 -ElasticSearchAddress '10.147.152.12:9200' -KibanaAddress '10.147.152.12:5601'`