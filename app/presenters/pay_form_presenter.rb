class PayFormPresenter < FormPresenter
  def year_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m << error_messages_for(name)
    end
  end
  
  def month_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m << error_messages_for(name)
    end
  end
  
  def quarter_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m << error_messages_for(name)
    end
  end
end