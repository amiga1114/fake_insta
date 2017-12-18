class HomeController < ApplicationController
  def index
    # erb :index 생략가능(def뒤에 이름과 .erb 이름이 같은 경우)
  end

  def hello
    @name = params[:name]
  end

  def lotto
    @num = (1..45).to_a.sample(6)
  end

  def lunch
    @lunch = ["rice", "noodle", "meat"].sample
  end

  def search

  end

end
