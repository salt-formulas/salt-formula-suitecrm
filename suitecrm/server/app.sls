{%- from "suitecrm/map.jinja" import server with context %}
{%- if server.enabled %}

include:
- git

{%- for app_name, app in server.app.iteritems() %}

{{ server.base_dir }}/sites/{{ app_name }}:
  file.directory:
  - user: www-data
  - group: www-data
  - mode: 755
  - makedirs: true

suitecrm_{{ app_name }}_git:
  git.latest:
  - name: {{ server.source.address }}
  - rev: {{ server.source.revision }}
  - target: {{ server.base_dir }}/sites/{{ app_name }} 
  - require:
    - pkg: git_packages

{#
suitecrm_{{ app_name }}_perms:
  cmd.run:
    - cwd: /root
    - name: chmod 644 /srv/suitecrm/sites/{{ app_name }}; find /srv/suitecrm/sites/{{ app_name }} -type d -print0 | xargs -0 chmod 755;
    - require:
      - cmd: suitecrm_{{ app_name }}_move
#}

suitecrm_{{ app_name }}_owners:
  cmd.run:
    - cwd: /root
    - name: chown www-data:www-data /srv/suitecrm/sites/{{ app_name }} -R;
    - require:
      - cmd: suitecrm_{{ app_name }}_perms

suitecrm_{{ app_name }}_perms2:
  cmd.run:
    - cwd: /srv/suitecrm/sites/{{ app_name }}
    - names:
      - chown www-data:www-data cache custom modules themes data upload
      - chown www-data:www-data config_override.php
    - require:
      - git: suitecrm_{{ app_name }}_git

suitecrm_{{ app_name }}_cron:
  file.managed:
  - name: /etc/cron.d/suitecrm
  - source: salt://suitecrm/files/suitecrm-cron.conf
  - user: root
  - group: root
  - mode: 644
  - template: jinja
  - defaults:
      app_name: {{ app_name }}

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

#}

{%- endfor %}

{%- endif %}
