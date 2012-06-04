class ApplicationController < ActionController::Base
  before_filter :add_initial_breadcrumbs
  protect_from_forgery

  private
    def add_initial_breadcrumbs
        breadcrumbs.add 'Home', root_path
    end
end
