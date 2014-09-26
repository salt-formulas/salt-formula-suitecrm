{%- from "suitecrm/map.jinja" import server with context %}
{%- if server.enabled %}

{# include:
- php
#}

suitecrm_packages:
  pkg.installed:
  - names:
    - unzip
    - php5-mysql

suitecrm_dir:
  file.directory:
  - name: {{ server.dir }}/sites
  - makedirs: true

{%- endif %}