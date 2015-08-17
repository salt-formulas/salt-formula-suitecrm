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
  - name: {{ app.source.address }}
  - rev: {{ app.source.revision }}
  - target: {{ server.base_dir }}/sites/{{ app_name }} 
  - require:
    - pkg: git_packages

{{ server.base_dir }}/sites/{{ app_name }}/cache:
  file.directory:
  - mode: 755
  - makedirs: true
  - require:
    - git: suitecrm_{{ app_name }}_git

suitecrm_{{ app_name }}_base_perms:
  cmd.run:
  - cwd: /root
  - name: chmod 644 /srv/suitecrm/sites/{{ app_name }}; find /srv/suitecrm/sites/{{ app_name }} -type d -print0 | xargs -0 chmod 755;
  - require:
    - git: suitecrm_{{ app_name }}_git

suitecrm_{{ app_name }}_owners:
  cmd.run:
    - cwd: /root
    - name: chown www-data:www-data /srv/suitecrm/sites/{{ app_name }} -R;
    - require:
      - git: suitecrm_{{ app_name }}_git

suitecrm_{{ app_name }}_perms:
  cmd.run:
  - cwd: /srv/suitecrm/sites/{{ app_name }}
  - names:
    - chown www-data:www-data cache custom modules themes data upload -R
    - chown www-data:www-data config_override.php -R
  - require:
    - git: suitecrm_{{ app_name }}_git

/srv/suitecrm/sites/{{ app_name }}/config.php:
  file.managed:
  - source: salt://suitecrm/files/config.php
  - user: root
  - group: root
  - mode: 644
  - template: jinja
  - require:
    - git: suitecrm_{{ app_name }}_git

{%- endfor %}

{%- endif %}