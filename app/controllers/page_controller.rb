class PageController < ApplicationController
  def home
  end

  def login
  end

  def products
  end

  def calendar
    @year = params[:year]
    @month = params[:month]
  end

  def support
  end
end
