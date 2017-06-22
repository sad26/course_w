class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  before_action -> {check_app_auth ["admin", "operator"]}, except: [:show, :index]

  def search
    if params.has_key?('search')
      @orders = Order.search(params['search'])
    else
      @orders = []
    end
    params['search'] ||= {}

    # для ajax
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @cur = @order.automobile
    @cur2 = @order.tariff
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Заказ успешно создан.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @cur = @order.automobile
    @cur2 = @order.tariff
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Заказ успешно обновлен.' }
        format.json { render :show, status: :ok, location: @order }
      else
        if (@new = !(params[:order][:automobile_id].present?))
          @cur_params = order_params[:automobile_attributes]
          @vals = {:automobile_model => @cur.automobile_model,
            :automobile_type => @cur.automobile_type,
            :state_number => @cur.state_number, :color => @cur.color,
            :release => @cur.release}
          end
        if (@new2 = !(params[:order][:tariff_id].present?))
          @cur_params2 = order_params[:tariff_attributes]
          @vals2 = {:name => @cur2.name, :time_of_day => @cur2.time_of_day,
            :range => @cur2.range, :price_per_kilometer => @cur2.price_per_kilometer}
        end
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Заказ успешно удалён.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:time_of_travel, :departure_address,
        :arrival_address, :number_of_passengers, :length_of_route, :automobile_id, :tariff_id,
        tariff_attributes: [:_destroy, :id, :name, :time_of_day, :range, :price_per_kilometer],
        automobile_attributes: [:_destroy, :id, :automobile_model, :automobile_type,
          :state_number, :color, :release])
    end
end
