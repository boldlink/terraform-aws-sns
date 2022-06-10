# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- Feature: Expand the complete example
- Add an example that creates within the module a kms key (most likely with an external example)
- Add subscription examples on the complete for multiple endpoints, this will be also on the complete

## [1.1.0] - 2022-06-10
### Changes
- Added the `.github/workflow` folder
- Added `CHANGELOG.md`
- Added `CODEOWNERS`
- Added `versions.tf`, which is important for pre-commit checks
- Added `Makefile` for examples automation
- Added new `.gitignore` file

[1.1.0]: https://github.com/boldlink/terraform-aws-sns/releases/tag/1.1.0

## [1.0.2] - 2022-05-09
### Changes
- Refactored examples
- Refactored sns topic subscription
- Removed unused variables

[1.0.2]: https://github.com/boldlink/terraform-aws-sns/releases/tag/1.0.2

## [1.0.1] - 2022-04-20
### Changes
- Removed unnecessary role
- Added encryption options

[1.0.1]: https://github.com/boldlink/terraform-aws-sns/releases/tag/1.0.1

## [1.0.0] - 2022-03-25
- Initial commit
- sns module with an example

[1.0.0]: https://github.com/boldlink/terraform-aws-sns/releases/tag/1.0.0