class Authors::BaseController < ApplicationController
  before_action :authenticate_author!
  http_basic_authenticate_with name: 'foobar', password: 'foobar', only: [:admin, :new, :edit, :destroy]
end
