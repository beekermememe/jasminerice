module JasmineCoffee
  # Determine whether or not to mount the JasmineCoffee engine implicitly. True/False
  mattr_accessor :mount
  @@mount = true

  # Specify location at which to mount the engine, default to '/jasmine'
  mattr_accessor :mount_at
  @@mount_at = '/jasmine'

  # Specify the path for specs, defaults to 'spec'
  mattr_accessor :spec_path
  @@spec_path = 'spec'

  #Specify the path for fixutures, defaults to 'spec/javascripts/fixtures'
  mattr_accessor :fixture_path
  @@fixture_path = 'spec/javascripts/fixtures'

  # Default way to setup JasmineCoffee. Run rails generate jasminecoffee:install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end

  class Engine < Rails::Engine
    isolate_namespace JasmineCoffee

    initializer :assets, :group => :all do |app|
      app.config.assets.paths << Rails.root.join(JasmineCoffee.spec_path, "javascripts").to_s
      app.config.assets.paths << Rails.root.join(JasmineCoffee.spec_path, "stylesheets").to_s
    end

    config.after_initialize do |app|
      app.routes.prepend do
        mount JasmineCoffee::Engine => JasmineCoffee.mount_at
      end if JasmineCoffee.mount
    end
  end
end
