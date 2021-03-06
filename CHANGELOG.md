# yum-ius Cookbook CHANGELOG

This file is used to list changes made in each version of the yum-ius cookbook.

## 2.1.0 (2016-12-22)

- Allow the use of any valid property via attributes
- Depend on the latest compat_resource cookbook
- Cookstyle fixes

## 2.0.0 (2016-11-26)
- Replace yum dependency with compat_resource
- Add inspec integration test

## 1.0.0 (2016-09-06)
- Testing updates
- Add chef_version metadata
- Remove support for Chef 11

## v0.4.6 (2016-04-27)

- Remove support for fedora / amazon from metadata as they are not actually supported

## v0.4.5 (2015-11-30)

- Fixed attributes with a false value being skipped

## v0.4.4 (2015-10-28)

- Fixing logic bug around managed attribute

## v0.4.3 (2015-10-28)

- Fixing Chef 13 nil property deprecation warnings

## v0.4.2 (2015-09-21)

- Added Chef standard Rubocop file and resolved all warnings
- Updated platforms in Kitchen CI config
- Add supported platforms to the metadata
- Added Chef standard chefignore and .gitignore files
- Updated and expanded development dependencies in the Gemfile
- Added contributing, testing, and maintainers docs
- Added platform requirements to the readme
- Added Travis and cookbook version badges to the readme
- Update Chefspec to 4.X format
- Convert all hash rockets to the Ruby 1.9+ hash format

## v0.4.1 (2015-06-21)

- Updating URLs for https and new mirrorlists
- Depending on yum ~> 3.2

## v0.4.0 (2014-10-29)

- Accounting for differences between RHEL and Centos
- Adding EL7 Support

## v0.3.0 (2014-09-11)

- Add the yum-epel::default recipe if at least one yum-ius repository managed

## v0.2.0 (2014-02-14)

- Updating test harness
- Disabling uncommonly used repositories by default

## v0.1.4

Adding CHANGELOG.md

## v0.1.0

initial release
