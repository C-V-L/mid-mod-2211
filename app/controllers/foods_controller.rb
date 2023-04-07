class FoodsController < ApplicationController
  def index
    @facade = FoodsFacade.new(params[:q])
  end
end