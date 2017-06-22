module TariffsHelper
  def tariff_options(cur_id)
    Tariff.all.map do |x|
      cur_id == x.id ? [x.name + " (текущий)", x.id] : [x.name, x.id]
    end
  end

  def new_tariff_form(form, vals = nil)
    @tar_vals = vals
    form.fields_for(:tariff, Tariff.new) do |fr|
      render 'orders/one_tariff_form', fr: fr
    end
  end

  def exist_tariff_form(form, tariff = nil, vals = nil)
    @tar_vals = vals
    form.fields_for(:tariff, tariff) do |fr|
      render 'orders/one_tariff_form', fr: fr
    end
  end
end
