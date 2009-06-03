--- !ruby/object:Gem::Specification 
name: rack-abstract-format
version: !ruby/object:Gem::Version 
  version: 0.9.4
platform: ruby
authors: 
- Martin Aumont
autorequire: 
bindir: bin
cert_chain: []

date: 2009-06-03 00:00:00 -04:00
default_executable: 
dependencies: []

description: Rack middleware that abstracts format (extension) away from the path (into env)
email: mynyml@gmail.com
executables: []

extensions: []

extra_rdoc_files: []

files: 
- Rakefile
- test
- test/test_abstract_format.rb
- test/test_helper.rb
- examples
- examples/app.ru
- rack-abstract-format.gemspec
- lib
- lib/rack
- lib/rack/abstract_format.rb
- LICENSE
- README
has_rdoc: true
homepage: ""
licenses: []

post_install_message: 
rdoc_options: []

require_paths: 
- lib
required_ruby_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
required_rubygems_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
requirements: []

rubyforge_project: 
rubygems_version: 1.3.3
signing_key: 
specification_version: 3
summary: Rack middleware that abstracts format (extension) away from the path (into env)
test_files: []

