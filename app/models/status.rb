class Status < ActiveRecord::Base
  self.per_page = RailsApp::Application.config.per_page
end
