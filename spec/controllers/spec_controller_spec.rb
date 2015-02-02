require 'spec_helper'

describe JasmineCoffee::SpecController do
  describe "view paths" do
    before do
      JasmineCoffee::SpecController.any_instance.stub(:render) { @view_paths = controller.view_paths }
      get 'fixtures', :use_route => :jasminecoffee
    end

    subject { @view_paths.map(&:original_path_set).flatten.map(&:to_s) }

    it { should include Rails.root.to_s }
  end
end