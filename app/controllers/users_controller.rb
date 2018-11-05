class UsersController < ApplicationController
  before_action :authenticate_user!

  def account
    redirect_to user_category_path unless current_user.category.in?([1, 2, 3])
  end

  def category; end

  def update_category
    category = params[:category].to_i
    category = 1 unless category.in?([1, 2, 3])
    current_user.update! category: category
  end
end
