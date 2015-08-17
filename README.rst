
========
SuiteCRM
========

SuiteCRM is SugarCRM, Supercharged! SuiteCRM is a fork of the popular open source SugarCRM Community Edition. This release features a host of additional open source modules, along with the standard features and functionality found within SugarCRM CE. 

Sample pillars
==============

Simple server with 1 app

    suitecrm:
      server:
        enabled: true
        app:
          devel1:
            enabled: true
            version: '7.1.3'
            database:
              engine: 'postgresql'
              host: '127.0.0.1'
              name: 'suitecrm_devel'
              password: 'password'
              user: 'suitecrm_devel'

Read more
=========

* https://suitecrm.com/
* https://suitecrm.com/index.php?option=com_wrapper&view=wrapper&Itemid=1383 installation guide
