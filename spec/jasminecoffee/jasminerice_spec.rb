require "spec_helper"

describe JasmineCoffee do

  it "has configuration properties" do
    expect(JasmineCoffee.mount).to be(true)
    expect(JasmineCoffee.mount_at).to eql('/jasminecoffee')
    expect(JasmineCoffee.spec_path).to eql('spec')
    expect(JasmineCoffee.fixture_path).to eql('spec/dummy/spec/javascripts/fixtures')
  end

  describe ".setup" do

    after do
      JasmineCoffee.mount_at = '/jasminecoffee'
    end

    it "yields self" do
      config = nil
      JasmineCoffee.setup { |c| config = c }
      expect(config).to be(JasmineCoffee)
    end

    it "allows changing configuration" do
      JasmineCoffee.setup { |c| c.mount_at = '/jasminecoffee' }
      expect(JasmineCoffee.mount_at).to eql('/jasminecoffee')
    end

  end

end
