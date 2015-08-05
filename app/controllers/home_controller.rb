class HomeController < ApplicationController
  def index
    if Drawing.find_by(active: true) 
      @pdrawing = Drawing.find_by(active: true)
      @cdescription = Description.where(draw_id: @pdrawing.id)
    else 
      @pdescription = Description.find_by(active: true)
      @cdrawing = Drawing.where(des_id: @pdescription.id)
    end



    @drawing = Drawing.new
    @description = Description.new
  end

  def login

  end


  def login_process
        @user = User.where(username: params[:username]).first   
    if @user && @user.password_digest == params[:password_digest]     
      session[:user_id] = @user.id
      redirect_to '/'   
    else     
      redirect_to '/login'   
    end 

  end

  def logout
    session.clear
    redirect_to '/'
  end

end
