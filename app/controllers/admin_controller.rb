class AdminController < ApplicationController
  skip_before_filter :authorize
  def index
   # @total_order =Order.count
  end
end
