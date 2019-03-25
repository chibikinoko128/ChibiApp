$(document).on 'turbolinks:load', ->
  $('form.edit_administrator').on 'click', '#enable-password-field', ->
    $('#enable-password-field').hide()
    $('#disable-password-field').show()
    $('#administrator_password').removeAttr('disabled')
    $('label[for=administrator_password]').addClass('required')
  $('form.edit_administrator').on 'click', '#disable-password-field', ->
    $('#disable-password-field').hide()
    $('#enable-password-field').show()
    $('#administrator_password').attr('disabled', 'disabled')
    $('label[for=administrator_password]').removeClass('required')
