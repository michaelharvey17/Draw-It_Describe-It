class DescriptionsController < ApplicationController
  before_action :set_description, only: [:show, :edit, :update, :destroy]

  # GET /descriptions
  # GET /descriptions.json
  def index
    @descriptions = Description.all
  end

  # GET /descriptions/1
  # GET /descriptions/1.json
  def show
  end

  # GET /descriptions/new
  def new
    @description = Description.new
  end

  # GET /descriptions/1/edit
  def edit
  end

  # POST /descriptions
  # POST /descriptions.json
  def create
    @parent = Drawing.find_by(active: true)

    @description = Description.new(description_params)

      @description.draw_id = @parent.id 
      @description.user_id = session[:user_id]
      @description.parent = false
      @description.active = false
      
    respond_to do |format|
      if @description.save
        format.html { redirect_to '/', notice: 'Description was successfully created.' }
        format.json { render :show, status: :created, location: @description }
      else
        format.html { render :new }
        format.json { render json: @description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /descriptions/1
  # PATCH/PUT /descriptions/1.json
  def update
    respond_to do |format|
      if @description.update(description_params)
        format.html { redirect_to @description, notice: 'Description was successfully updated.' }
        format.json { render :show, status: :ok, location: @description }
      else
        format.html { render :edit }
        format.json { render json: @description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descriptions/1
  # DELETE /descriptions/1.json
  def destroy
    @description.destroy
    respond_to do |format|
      format.html { redirect_to descriptions_url, notice: 'Description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @parent = Drawing.find_by(active: true)
    @description = Description.find(params[:id])
    @description.liked_by current_user

    if @description.score >= 5
      @parent.update(active: false)
      @description.update(parent: true, active: true)
    end
    redirect_to '/'
  end
  
  def unlike
    @parent = Drawing.find_by(active: true)
    @description = Description.find(params[:id])
    @description.unliked_by current_user

    if @description.score >= 5
      @parent.update(active: false)
      @description.update(parent: true, active: true)
    end
    redirect_to '/'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_description
      @description = Description.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def description_params
      params.require(:description).permit(:user_id, :draw_id, :content, :parent, :active)
    end
end
