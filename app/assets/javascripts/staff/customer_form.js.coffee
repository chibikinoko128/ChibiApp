$(document).on 'turbolinks:load', ->
  $('form.edit_form').on 'click', '#enable-password-field', ->
    $('#enable-password-field').hide()
    $('#disable-password-field').show()
    $('#form_customer_password').removeAttr('disabled')
    $('label[for=form_customer_password]').addClass('required')
  $('form.edit_form').on 'click', '#disable-password-field', ->
    $('#disable-password-field').hide()
    $('#enable-password-field').show()
    $('#form_customer_password').attr('disabled', 'disabled')
    $('label[for=form_customer_password]').removeClass('required')
    
  $('form.edit_form').on 'click', '#enable-nickname-field', ->
    $('#enable-nickname-field').hide()
    $('#disable-nickname-field').show()
    $('#form_customer_nickname').removeAttr('disabled')
    $('label[for=form_customer_nickname]').addClass('required')
  $('form.edit_form').on 'click', '#disable-nickname-field', ->
    $('#disable-nickname-field').hide()
    $('#enable-nickname-field').show()
    $('#form_customer_nickname').attr('disabled', 'disabled')
    $('label[for=form_customer_nickname]').removeClass('required')
    
  $('form.edit_form').on 'click', '#enable-sponsor1-field', ->
    $('#enable-sponsor1-field').hide()
    $('#disable-sponsor1-field').show()
    $('#form_customer_sponsor1').removeAttr('disabled')
    $('label[for=form_customer_sponsor1]').addClass('required')
  $('form.edit_form').on 'click', '#disable-sponsor1-field', ->
    $('#disable-sponsor1-field').hide()
    $('#enable-sponsor1-field').show()
    $('#form_customer_sponsor1').attr('disabled', 'disabled')
    $('label[for=form_customer_sponsor1]').removeClass('required')
  toggle_home_address_fields()
  $('input#form_inputs_home_address').on 'click', ->
    toggle_home_address_fields()
 
toggle_home_address_fields = ->
  checked = $('input#form_inputs_home_address').prop('checked')
  $('fieldset#home-address-fields input').prop('disabled', !checked)
  $('fieldset#home-address-fields select').prop('disabled', !checked)
  $('fieldset#home-address-fields').toggle(checked)
