class PagesController < ApplicationController
  def index
    count = 0
    current_user.microposts.each do |m|
      count = count + m.favorites.count
    end
    @count = count
  end

  def show
  end

  def help
  end

  def contact
  end

  def about
  end
end
