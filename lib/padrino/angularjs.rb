require "padrino/angularjs/version"

module Padrino
  module Angularjs
    def self.assets_path
      @assets_path ||= Dir[File.expand_path(File.dirname(__FILE__) + '../../../vendor/assets/{javascripts}')]
    end
  end
end

##
# Now we need to add angularjs generators to padrino-gen
#
begin
  require 'padrino-gen'
  Padrino::Generators.load_paths << Dir[File.dirname(__FILE__) + '/angularjs/generators/{install}.rb']
rescue LoadError
  # Fail silently
end
