{%- from "suitecrm/map.jinja" import server with context %}
{%- if server.enabled %}

suitecrm_packages:
  pkg.installed:
  - names:
    - unzip
{%- if grains.osfullname in ['Ubuntu'] %}
    - php5-mysql
    - cron
{%- endif %}

suitecrm_dir:
  file.directory:
  - name: {{ server.dir }}/sites
  - makedirs: true

{%- endif %}