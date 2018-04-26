Validation Log
==============

Guidelines
----------

* All new features incorporated into a tagged release should have their validation documented.
  * Document the new feature.
  * Perform tests to validate the new feature.
  * If the feature is slated for incorporation into an official analysis, perform tests to show that the overall analysis works and benefits from this feature.
  * Indicate in this log where to find documentation of the new feature.
  * Indicate in this log what tests were performed, and where to find a writeup of the results.
* Fixes to existing features should also be validated.
  * Perform tests to show that the fix solves the problem that had been indicated.
  * Perform tests to shwo that the fix does not cause other problems.
  * Indicate in this log what tests were performed and how you know the problem was fixed.
  
Template
--------

Version: 
~~~~~~~~

Release Date: 
'''''''''''''

New Features:
'''''''''''''

* Feature 1
    * Details
* Feature 2
    * Details
  
Fixes:
''''''

* Fix 1
    * Details
* Fix 2
    * Details
  
Log
---

Version: build-2018-04-26
~~~~~~~~~~~~~~~~~~~~~~~~~

Release Date: Apr 26 2018
'''''''''''''''''''''''''

New Features:
'''''''''''''

* Bump dependencies-common
* Safer install using absolute paths and moving cleanup to its own script

Version: build-2018-04-20
~~~~~~~~~~~~~~~~~~~~~~~~~

Release Date: Apr 20 2018
'''''''''''''''''''''''''

New Features:
'''''''''''''

* Documentation (ValidationLog and Versions)
* Bump dependencies-common
* Setup.sh defines the build numbers

Fixes:
''''''

* Prevent pip to be reinstalled every time: use of pip3 with --prefix
