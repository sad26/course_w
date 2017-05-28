change_form_automobile = ->
  $(".automobile-select").change ->
    # Находим форму, которая находится в .automobile-main-fields
    elem = $(".automobile-main-fields")
    # Если авто текущее, то форма редактирования
    if ($(this).val() == $(this).attr("data-current-id"))
      elem.html(elem.attr("data-content-exist"))
    # Если авто новое, то форма создания
    else if ($(this).val() == "")
      elem.html(elem.attr("data-content-new"))
    # Иначе выбрано существующее авто, то форму надо скрыть
    else
      elem.html("")
    window.datepicker_activation_by_item(elem)

change_form_tariff = ->
  $(".tariff-select").change ->
    elem = $(".tariff-main-fields")
    if ($(this).val() == $(this).attr("data-current-id"))
      elem.html(elem.attr("data-content-exist"))
    else if ($(this).val() == "")
      elem.html(elem.attr("data-content-new"))
    else
      elem.html("")
    window.datepicker_activation_by_item(elem)

all_actions = ->
  if( $("#new-form").length > 0 )
    elem = $(".automobile-main-fields")
    elem.html(elem.attr("data-content-new"))
    elem = $(".tariff-main-fields")
    elem.html(elem.attr("data-content-new"))

  change_form_automobile()
  change_form_tariff()

$(document).ready all_actions
$(document).on 'page:load', all_actions
