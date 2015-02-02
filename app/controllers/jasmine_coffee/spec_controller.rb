module JasmineCoffee
  class SpecController < JasmineCoffee::ApplicationController
    warn "Using JasmineCoffee::HelperMethods is deprecated and will be removed in a future release,"\
        "please use JasmineCoffee::SpecHelper to define your helpers in the future" if defined?(JasmineCoffee::HelperMethods)

    helper JasmineCoffee::HelperMethods rescue nil
    helper JasmineCoffee::SpecHelper rescue nil

    before_filter { prepend_view_path Rails.root.to_s }

    layout false

    def index
      @specsuite = params[:suite].try(:concat, "_spec") || "spec"
      @asset_options = %w(true false).include?(params[:debug]) ? { :debug => params[:debug] == 'true' } : {}
    end

    def fixtures
      render "#{JasmineCoffee.fixture_path}/#{params[:filename]}"
    end
  end
end
