class PageController < ApplicationController
  before_filter :setup
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
    @name = params[:Name]
    @email = params[:Email]
    @phone = params[:Phone]
  end

  def setup
    @prod_array = {"1" => "Skiis", "2" => "boots", "3" => "poles", "4" => "mittens", "5" => "mask", "6" => "hat", "7" => "gloves"}
  end
end
