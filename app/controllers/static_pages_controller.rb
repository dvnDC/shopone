class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_microposts = current_user.feed.paginate(page: params[:page], :per_page => 12)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
