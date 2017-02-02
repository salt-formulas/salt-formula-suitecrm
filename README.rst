
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

Documentation and Bugs
======================

To learn how to install and update salt-formulas, consult the documentation
available online at:

    http://salt-formulas.readthedocs.io/

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate issue tracker. Use Github issue tracker for specific salt
formula:

    https://github.com/salt-formulas/salt-formula-suitecrm/issues

For feature requests, bug reports or blueprints affecting entire ecosystem,
use Launchpad salt-formulas project:

    https://launchpad.net/salt-formulas

You can also join salt-formulas-users team and subscribe to mailing list:

    https://launchpad.net/~salt-formulas-users

Developers wishing to work on the salt-formulas projects should always base
their work on master branch and submit pull request against specific formula.

    https://github.com/salt-formulas/salt-formula-suitecrm

Any questions or feedback is always welcome so feel free to join our IRC
channel:

    #salt-formulas @ irc.freenode.net
