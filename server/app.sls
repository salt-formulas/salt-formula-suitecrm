{%- from "suitecrm/map.jinja" import server with context %}
{%- if server.enabled %}

include:
- suitecrm.server.service

{%- for app_name, app in server.app.iteritems() %}

/srv/suitecrm/sites/{{ app_name }}:
  file.directory:
  - user: root
  - group: root
  - mode: 755
  - makedirs: true

suitecrm_{{ app_name }}_archive:
  archive.extracted:
  - name: /root
  - source: {{ app.source.engine }}://{{ app.source.host }}/{{ app.source.file }}
  - archive_format: zip
  - if_missing: /root/suitecrm-{{ app.version }}-max
  - require:
    - pkg: suitecrm_packages
    - file: suitecrm_dir

suitecrm_{{ app_name }}_remove:
  file.recurse:
    - name: /srv/suitecrm/sites/{{ app_name }}
    - user: root
    - group: root
{#    - template: jinja #}
    - source: /root/suitecrm-{{ app.version }}-max
    - include_empty: True
    - require:
      - archive: suitecrm_{{ app_name }}_archive

{#
{{ server.dir }}/suitecrm.conf:
  file.managed:
  - source: salt://suitecrm/files/suitecrm.conf
  - user: root
  - group: root
  - mode: 644
  - template: jinja
  - require:
    - archive: suitecrm_archive
  - watch_in:
    - service: suitecrm_service

/srv/suitecrm/sites/{{ app_name }}/theme:
  file.directory:
  - user: root
  - group: www-data
  - mode: 770
  - makedirs: true

/srv/suitecrm/sites/{{ app_name }}/root/config.php:
  file.managed:
  - source: salt://suitecrm/files/config.php
  - template: jinja
  - mode: 644
  - require:
    - git: suitecrm_{{ app_name }}_git
  - defaults:
    app_name: "{{ app_name }}"

{%- if app.initial_data is defined %}

/root/suitecrm/scripts/restore_{{ app_name }}.sh:
  file.managed:
  - user: root
  - group: root
  - source: salt://suitecrm/files/restore.sh
  - mode: 700
  - template: jinja
  - defaults:
    app_name: "{{ app_name }}"
  - require:
    - file: /root/suitecrm/scripts
    - file: /root/suitecrm/flags


restore_suitecrm_{{ app_name }}:
  cmd.run:
  - name: /root/suitecrm/scripts/restore_{{ app_name }}.sh
  - unless: "[ -f /root/suitecrm/flags/{{ app_name }}-installed ]"
  - cwd: /root
  - require:
    - file: /root/suitecrm/scripts/restore_{{ app_name }}.sh

{%- endif %}

#}

{%- endfor %}

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
