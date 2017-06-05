class Authors::BaseController < ApplicationController
  before_action :authenticate_author!
  before_action :check_admin

  protected

  def check_admin
    redirect_to root_path, alert: 'У вас нет прав для просмотра этой страницы' unless current_author.admin?
  end
end
