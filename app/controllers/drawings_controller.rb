class DrawingsController < ApplicationController
  require 'base64'

  before_action :set_drawing, only: [:show, :edit, :update, :destroy]

  # GET /drawings
  # GET /drawings.json
  def index
    @drawings = Drawing.all
  end

  # GET /drawings/1
  # GET /drawings/1.json
  def show
  end

  # GET /drawings/new
  def new
    @drawing = Drawing.new
  end

  # GET /drawings/1/edit
  def edit
  end

  # POST /drawings
  # POST /drawings.json
  def create
    @parent = Description.find_by(active: true)


    @data=params[:image]
    @drawing = Drawing.new(drawing_params)

      @drawing.des_id = @parent.id 
      @drawing.user_id = session[:user_id]
      @drawing.parent = false
      @drawing.active = false

    respond_to do |format|
      if @drawing.save
        format.html { redirect_to '/', notice: 'Drawing was successfully created.' }
        format.json { render :show, status: :created, location: @drawing }
      else
        format.html { render :new }
        format.json { render json: @drawing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drawings/1
  # PATCH/PUT /drawings/1.json
  def update
    respond_to do |format|
      if @drawing.update(drawing_params)
        format.html { redirect_to @drawing, notice: 'Drawing was successfully updated.' }
        format.json { render :show, status: :ok, location: @drawing }
      else
        format.html { render :edit }
        format.json { render json: @drawing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drawings/1
  # DELETE /drawings/1.json
  def destroy
    @drawing.destroy
    respond_to do |format|
      format.html { redirect_to drawings_url, notice: 'Drawing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @parent = Description.find_by(active: true)
    @drawing = Drawing.find(params[:id])
    @drawing.upvote_by current_user

    if @drawing.score >= 10
      @parent.update(active: false)
      @drawing.update(parent: true, active: true)
    end
    redirect_to '/'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drawing
      @drawing = Drawing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drawing_params
      params.require(:drawing).permit(:user_id, :des_id, :image, :parent, :active)
    end
end
