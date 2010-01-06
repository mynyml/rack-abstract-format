require 'pathname'

require 'rack'
require 'nanotest'
begin
  require 'ruby-debug'
  require 'redgreen'        # gem install mynyml-redgreen
  require 'nanotest/focus'  # gem install nanotest_extensions
  require 'nanotest/stats'  # gem install nanotest_extensions
rescue LoadError, RuntimeError
end

$:.unshift Pathname(__FILE__).dirname.parent + 'lib'
require 'rack/abstract_format'

include Nanotest
