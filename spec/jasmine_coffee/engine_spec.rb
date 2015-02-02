require "spec_helper"

describe JasmineCoffee::Engine do

  it "is a class" do
    JasmineCoffee::Engine.should be_a(Class)
  end

  it "has been isolated with a name" do
    expect(JasmineCoffee::Engine.isolated?).to be(true)
    expect(JasmineCoffee::Engine.railtie_name).to eql("jasminecoffee")
  end

  it "adds asset paths from configuration" do
    expect(Rails.application.config.assets.paths).to include(Rails.root.join("spec/javascripts").to_s)
    expect(Rails.application.config.assets.paths).to include(Rails.root.join("spec/stylesheets").to_s)
  end

end
