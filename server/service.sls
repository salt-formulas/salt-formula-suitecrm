{%- from "suitecrm/map.jinja" import server with context %}

{%- if server.enabled %}

include:
- apache.common.service
 
suitecrm_packages:
  pkg.installed:
  - names:
    - unzip
{%- if grains.osfullname in ['Ubuntu'] %}
    - php5-mysql
    - php5-imap
    - php5-curl
    - php5-gd
    - cron
{%- elif grains.osfullname in ['CentOS'] %}
    - cronie
{%- endif %}
  - watch_in:
    - service: apache_service

suitecrm_dir:
  file.directory:
  - name: {{ server.dir }}/sites
  - makedirs: true

{%- endif %}
