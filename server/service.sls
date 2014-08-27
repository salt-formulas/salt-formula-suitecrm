{%- from "suitecrm/map.jinja" import server with context %}
{%- if server.enabled %}

include:
- php

suitecrm_packages:
  pkg.installed:
  - names:
    - unzip

suitecrm_dir:
  file.directory:
  - name: {{ server.dir }}

suitecrm_log:
  file.exists:
  - user: suitecrm
  - group: suitecrm
  - name: /var/log/suitecrm.log

suitecrm_user:
  user.present:
  - name: suitecrm
  - system: True
  - home: {{ server.dir }}
  - require:
    - file: {{ server.dir }}

suitecrm_workspace:
  file.directory:
  - name: {{ server.dir }}/workspace
  - user: suitecrm
  - group: suitecrm
  - require:
    - file: suitecrm_dir
    - user: suitecrm_user

suitecrm_archive:
  archive.extracted:
  - name: {{ server.dir }}
  - source: {{ server.source.engine }}://{{ server.source.host }}/{{ server.source.file }}
  - archive_format: zip
  - if_missing: {{ server.dir }}/eclipse
  - require:
    - pkg: suitecrm_packages
    - file: suitecrm_dir
    - user: suitecrm_user

{{ server.dir }}/eclipse/suitecrm.conf:
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

{{ server.dir }}/eclipse/suitecrm.ini:
  file.managed:
  - source: salt://suitecrm/files/suitecrm.ini
  - user: root
  - group: root
  - mode: 644
  - template: jinja
  - require:
    - archive: suitecrm_archive
  - watch_in:
    - service: suitecrm_service

/etc/init.d/suitecrm:
  file.managed:
  - source: salt://suitecrm/files/suitecrm-service
  - user: root
  - group: root
  - mode: 755
  - template: jinja
  - require:
    - archive: suitecrm_archive
  - watch_in:
    - service: suitecrm_service

suitecrm_service:
  service.running:
  - name: {{ server.service }}
  - enable: true

{%- endif %}