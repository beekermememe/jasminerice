# Use this file to set configuration options for JasmineCoffee, all of these are initialized to their respective defaults,
# but you can change them here.
JasmineCoffee.setup do |config|
  # Tell JasmineCoffee to JasmineCoffee mount itself in your application. If set to false, you must manually mount the
  # engine in order to use JasmineCoffee.
  #config.mount = true

  # If automatically mounting JasmineCoffee, specify the location that it should be mounted at.  Defaults to /jasmine, so
  # you could access your tests at http://YOUR_SERVER_URL/jasmine
  #config.mount_at = '/jasmine'

  # Specify a path where your specs can be found. Defaults to 'spec'
  #config.spec_path = 'spec'

  # Specify a path where your fixutures can be found. Defaults to 'spec/javascripts/fixtures'
  config.fixture_path = 'spec/dummy/spec/javascripts/fixtures'
end
