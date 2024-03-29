class StaticPagesController < ApplicationController
  def home
  end

  def friends
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_microposts = current_user.feed.paginate(page: params[:page], :per_page => 8)
    else
      redirect_to login_url, status: :see_other
    end
  end

  def search
    @categories = Category.paginate(page: params[:page])
  end

  def help
  end

  def about
  end

  def contact
  end
end
