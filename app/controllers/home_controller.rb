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


    if @user && @user.authenticate(params[:password])     
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

  def losers
  #   @descriptions=[]
  #   @drawings=[]
  #   Description.where(parent: false).reverse.each do |x|
  #     if x.score>=1 && !x.pdrawing || x.pdrawing.active == false
  #       @descriptions << x
  #     end
  #   end
  #   Drawing.where(parent: false).reverse.each do |x|
  #     if x.score>=1 && x.pdescription.active == false
  #       @descriptions << x
  #     end
  #   end

    @descriptions = Description.where(parent: false).reverse
    @drawings = Drawing.where(parent: false).reverse
  end

  def winners
    @descriptions = Description.where(parent: true, active: false).reverse
    @drawings = Drawing.where(parent: true, active: false).reverse
  end

end
