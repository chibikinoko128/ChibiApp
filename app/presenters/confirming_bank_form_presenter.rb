class ConfirmingBankFormPresenter < ConfirmingFormPresenter
  def bk_name_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def office_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def account_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def acc_name_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def acc_name_kana_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
end