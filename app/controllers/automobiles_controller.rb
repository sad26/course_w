class AutomobilesController < ApplicationController
  before_action :set_automobile, only: [:show, :edit, :update, :destroy]

  # GET /automobiles
  # GET /automobiles.json
  def index
    @automobiles = Automobile.all
  end

  # GET /automobiles/1
  # GET /automobiles/1.json
  def show
  end

  # GET /automobiles/new
  def new
    @automobile = Automobile.new
  end

  # GET /automobiles/1/edit
  def edit
  end

  # POST /automobiles
  # POST /automobiles.json
  def create
    @automobile = Automobile.new(automobile_params)

    respond_to do |format|
      if @automobile.save
        format.html { redirect_to @automobile, notice: 'Automobile was successfully created.' }
        format.json { render :show, status: :created, location: @automobile }
      else
        format.html { render :new }
        format.json { render json: @automobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /automobiles/1
  # PATCH/PUT /automobiles/1.json
  def update
    respond_to do |format|
      if @automobile.update(automobile_params)
        format.html { redirect_to @automobile, notice: 'Automobile was successfully updated.' }
        format.json { render :show, status: :ok, location: @automobile }
      else
        format.html { render :edit }
        format.json { render json: @automobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /automobiles/1
  # DELETE /automobiles/1.json
  def destroy
    @automobile.destroy
    respond_to do |format|
      format.html { redirect_to automobiles_url, notice: 'Automobile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_automobile
      @automobile = Automobile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def automobile_params
      params.require(:automobile).permit(:automobile_model, :automobile_type, :state_number, :color, :release)
    end
end
