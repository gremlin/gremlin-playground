# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [v0.4.0] - 2021-01-12
### Added
- Added sysstat package so attacks effects are more easily visible

### Changed

### Removed
- Updated kickstart file to remove more unnecessary packages

## [v0.3.1] - 2021-01-05
### Added

### Changed
- Updated CentOS install ISO URL

### Removed

## [v0.3.0] - 2021-01-05
### Added
- Makefile added to automate and speed up development

### Changed
- Added `kernel-modules-extra` and `iproute-tc` to the build.

### Removed

## [v0.2.0] - 2020-11-11
### Added
- `generate-traffic` command added to simulate webapp traffic

### Changed
- Updated webapp to output to logs for better debugging
- Reorganized command line tools within the scripts directory. Notable, this meant removing the `.sh` file extension. This change will make future CLI tools easier to add.
- Minor text changes

### Removed

## [v0.1.0] - 2020-10-27
### Added
- Initial release of Gremlin Playground.

### Changed

### Removed

[Unreleased]: https://github.com/gremlin/gremlin-playground/compare/v0.1.0...HEAD
[0.4.0]: https://github.com/gremlin/gremlin-playground/releases/tag/v0.4.0
[0.3.1]: https://github.com/gremlin/gremlin-playground/releases/tag/v0.3.1
[0.3.0]: https://github.com/gremlin/gremlin-playground/releases/tag/v0.3.0
[0.2.0]: https://github.com/gremlin/gremlin-playground/releases/tag/v0.2.0
[0.1.0]: https://github.com/gremlin/gremlin-playground/releases/tag/v0.1.0
