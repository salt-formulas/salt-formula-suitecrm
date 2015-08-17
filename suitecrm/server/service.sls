{%- from "suitecrm/map.jinja" import server with context %}

{%- if server.enabled %}

include:
- apache.common.service

suitecrm_packages:
  pkg.installed:
  - names: {{ server.pkgs }}
  - watch_in:
    - service: apache_service

suitecrm_dir:
  file.directory:
  - name: {{ server.dir }}/sites
  - makedirs: true

{%- endif %}
