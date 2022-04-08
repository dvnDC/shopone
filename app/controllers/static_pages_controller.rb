class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_microposts = current_user.feed.paginate(page: params[:page], :per_page => 8)
    end
  end

  def friends
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_microposts = current_user.feed.paginate(page: params[:page], :per_page => 8)
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def search
  end
end
