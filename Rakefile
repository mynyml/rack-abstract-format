def gem_opt
  defined?(Gem) ? "-rubygems" : ""
end

# --------------------------------------------------
# Tests
# --------------------------------------------------
task(:default => :test)

desc "Run tests"
task(:test) do
  exit system("ruby #{gem_opt} test/test_abstract_format.rb")
end

# --------------------------------------------------
# Docs
# --------------------------------------------------
desc "Generate YARD Documentation"
task(:yardoc) do
  require 'yard'
  files   = %w( lib/**/*.rb )
  options = %w( -o doc/yard --readme README --files LICENSE )
  YARD::CLI::Yardoc.run *(options + files)
end

