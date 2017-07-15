class Authors::BaseController < ApplicationController
  before_action :authenticate_author!
end
