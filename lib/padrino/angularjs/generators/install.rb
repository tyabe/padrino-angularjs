module Padrino
  module Angularjs
    module Generators
      class Install < Thor::Group
        Padrino::Generators.add_generator(:angularjs_install, self)

        def self.source_root; File.expand_path(File.dirname(__FILE__)); end
        def self.banner; 'padrino-gen angularjs_install'; end

        include Thor::Actions
        include Padrino::Generators::Actions

        desc "Description:\n\n\tSetup AngularJS assets on your Padrino Apprication"

        class_option :root, :desc => 'The root destination',              :aliases => '-r', :default => '.',    :type => :string
        class_option :app,  :desc => 'The application destination path',  :aliases => '-a', :default => '/app', :type => :string
        class_option :destroy,                                            :aliases => '-d', :default => false,  :type => :boolean
        class_option :help, :desc => 'Show help usage',                                                         :type => :boolean

        def add_assets
          self.destination_root = options[:root]
          if in_app_root?
            app = options[:app]
            check_app_existence(app)
            self.behavior = :revoke if options[:destroy]

            unless options[:destroy]
              require_dependencies('padrino-sprockets', :require => 'padrino/sprockets', :git => 'https://github.com/nightsailer/padrino-sprockets.git')
            end

            javascript_root = destination_root(app, '/assets/javascripts')
            javascript_file = File.join(javascript_root, 'application.js')
            if File.exist?(javascript_file)
              insert_into_file javascript_file, "//= require angular\n", :before => "//= require_tree \.\n"
            else
              empty_directory javascript_root
              template  'templates/application.js.tt', javascript_file
            end

            angularjs_register = <<-ANGULARJS

    register Padrino::Sprockets
    sprockets :paths => Padrino::Angularjs.assets_path
            ANGULARJS

            inject_into_file destination_root(app, 'app.rb'), angularjs_register, :after => "register Padrino::Helpers\n"

            return if self.behavior == :revoke

            say
            say '='*65, :green
            say 'All set for use the AngularJS! Next, follow these steps:', :green
            say '='*65, :green
            say 'Run "bundle install"'
            say '='*65, :green
            say

          else
            say 'You are not at the root of a Padrino application! (config/boot.rb not found)'
          end
        end

        def detect_js_format

        end

        def detect_css_format

        end

      end # Install
    end # Angularjs
  end # Generators
end # Padrino
