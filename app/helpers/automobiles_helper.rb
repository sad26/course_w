module AutomobilesHelper
  def automobile_options(cur_id)
    Automobile.all.map do |x|
      cur_id == x.id ? [x.automobile_model + " (текущий)", x.id] : [x.automobile_model, x.id]
    end
  end

  def new_automobile_form(form)
    form.fields_for(:automobile, Automobile.new) do |fr|
      render 'orders/one_automobile_form', fr: fr
    end
  end

  def exist_automobile_form(form)
    form.fields_for(:automobile) do |fr|
      render 'orders/one_automobile_form', fr: fr
    end
  end
end
