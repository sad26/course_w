class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]
  before_action -> {check_app_auth ["admin", "operator"]}, except: [:show, :index]

  # GET /drivers
  # GET /drivers.json
  def index
    @drivers = Driver.all
  end

  # GET /drivers/1
  # GET /drivers/1.json
  def show
  end

  # GET /drivers/new
  def new
    @driver = Driver.new
  end

  # GET /drivers/1/edit
  def edit
    @cur = @driver.automobile
  end

  # POST /drivers
  # POST /drivers.json
  def create
    @driver = Driver.new(driver_params)

    respond_to do |format|
      if @driver.save
        format.html { redirect_to @driver, notice: 'Водитель успешно создан.' }
        format.json { render :show, status: :created, location: @driver }
      else
        format.html { render :new }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    @cur = @driver.automobile
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to @driver, notice: 'Водитель успешно обновлен.' }
        format.json { render :show, status: :ok, location: @driver }
      else
        if (@new = !(params[:driver][:automobile_id].present?))
          @cur_params = driver_params[:automobile_attributes]
          @vals = {:automobile_model => @cur.automobile_model,
            :automobile_type => @cur.automobile_type,
            :state_number => @cur.state_number, :color => @cur.color,
            :release => @cur.release}
        end

        format.html { render :edit }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to drivers_url, notice: 'Водитель успешно удалён.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_params
      params.require(:driver).permit(:last_name, :first_name, :patronymic,
        :date_of_birth, :itn, :passport, :automobile_id,
        automobile_attributes: [:_destroy, :id, :automobile_model, :automobile_type,
          :state_number, :color, :release])
    end
end
