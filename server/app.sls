{%- from "suitecrm/map.jinja" import server with context %}
{%- if server.enabled %}

include:
- suitecrm.server.service

{%- for app_name, app in server.app.iteritems() %}

/srv/suitecrm/sites/{{ app_name }}:
  file.directory:
  - user: www-data
  - group: www-data
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

suitecrm_{{ app_name }}_move:
  cmd.run:
    - cwd: /root
    - name: mv /root/suitecrm-{{ app.version }}-max/* /srv/suitecrm/sites/{{ app_name }}
    - unless: "timeout 10 ls -l /srv/suitecrm/sites/{{ app_name }}/*"
    - require:
      - archive: suitecrm_{{ app_name }}_archive

suitecrm_{{ app_name }}_perms:
  cmd.run:
    - cwd: /root
    - name: chmod 644 /srv/suitecrm/sites/{{ app_name }}; find /srv/suitecrm/sites/{{ app_name }} -type d -print0 | xargs -0 chmod 755;
    - require:
      - cmd: suitecrm_{{ app_name }}_move

suitecrm_{{ app_name }}_owners:
  cmd.run:
    - cwd: /root
    - name: chown www-data:www-data /srv/suitecrm/sites/{{ app_name }} -R;
    - require:
      - cmd: suitecrm_{{ app_name }}_perms

suitecrm_{{ app_name }}_perms2:
  cmd.run:
    - cwd: /root
    - name: cd /srv/suitecrm/sites/{{ app_name }}; chmod -R 775 cache custom modules themes data upload; chmod 664 config_override.php;
    - require:
      - cmd: suitecrm_{{ app_name }}_owners

suitecrm_{{ app_name }}_cron:
  file.managed:
  - name: /etc/cron.d/suitecrm
  - source: salt://suitecrm/conf/suitecrm-cron.conf
  - user: root
  - group: root
  - mode: 644
{#  - template: jinja #}

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
  - user: www-data
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
