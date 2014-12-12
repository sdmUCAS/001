# encoding: utf-8
class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    if user = User.authenticate(params[:logname],params[:password])
      @u = User.find_by_id(user.id)
        if @u.authority !='未审核'
         session[:user_id] = user.id
         redirect_to home_index_url
        else
          redirect_to login_url,:alert=>"用户未审核"
        end
    else
      redirect_to login_url,:alert=>"用户名或密码错误"
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to home_index_url,:notice => "Logged out"
  end
end
