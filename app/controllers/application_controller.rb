class ApplicationController < ActionController::Base
  include Pagy::Backend

  include Language
end
