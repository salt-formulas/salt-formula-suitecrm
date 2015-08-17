{%- from "suitecrm/map.jinja" import server with context %}
{%- if server.enabled %}

suitecrm_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

suitecrm_dir:
  file.directory:
  - name: {{ server.base_dir }}/sites
  - makedirs: true

/root/suitecrm/scripts:
  file.directory:
  - user: root
  - group: root
  - mode: 700
  - makedirs: true

/root/suitecrm/flags:
  file.directory:
  - user: root
  - group: root
  - mode: 700
  - makedirs: true

{%- endif %}