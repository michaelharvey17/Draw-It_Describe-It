class HomeController < ApplicationController
  def index
    if Drawing.find_by(active: true) 
      @pdrawing = Drawing.find_by(active: true)
    else 
      @pdescription = Description.find_by(active: true)
    end
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
