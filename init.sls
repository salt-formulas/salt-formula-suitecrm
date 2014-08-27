{%- if pillar.suitecrm is defined %}
include:
{%- if pillar.suitecrm.server is defined %}
- suitecrm.server
{%- endif %}
{%- endif %}