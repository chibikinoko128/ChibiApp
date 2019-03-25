class ConfirmingRegisterFormPresenter < ConfirmingFormPresenter
  def rg_1_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def rg_2_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def rg_3_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def rg_4_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def rg_5_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def rg_6_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def rg_7_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def rg_8_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def rg_9_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def rg_10_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def rg_11_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
  
  def rg_12_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m.div(object.send(name), class: 'field-value')
      m << hidden_field(name, options)
    end
  end
end
  