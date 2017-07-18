class Authors::AccountsController < Authors::BaseController
  before_action :authenticate_author!

  def edit; end

  def update_info
    if current_author.update(author_info_params)
      flash[:success] = 'Successfuly saved info.'
    else
      flash[:danger] = current_author.display_error_messages
    end
    redirect_to authors_account_path
  end

  def change_password
    if current_author.valid_password?(author_password_params[:current_password])
      if current_author.change_password(author_password_params)
        sign_in(current_author, bypass: true)
        flash[:success] = 'Successfully changed password.'
      else
        flash[:danger] = current_author.display_error_messages
      end
    else
      flash[:danger] = 'Current password was incorrect.'
    end
    redirect_to authors_account_path
  end

  private

    def author_info_params
      params.require(:author).permit(:name, :email, :bio)
    end

    def author_password_params
      params.require(:author).permit(:current_password, :new_password, :new_password_confirmation)
    end
end
