class BankFormPresenter < FormPresenter
  def bk_name_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m << error_messages_for(name)
    end
  end
  
  def office_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m << error_messages_for(name)
    end
  end
  
  def account_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m.span ' (普通預金口座番号のみ)', class: 'notes'
      m << error_messages_for(name)
    end
  end
  
  def acc_name_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m.span ' (本人名以外は無効です。)', class: 'notes'
      m << error_messages_for(name)
    end
  end
  
  def acc_name_kana_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m.span ' (カタカナで入力してください。)', class: 'notes'
      m << error_messages_for(name)
    end
  end
  
  def bk_name_check_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m.span ' (カタカナで入力してください。)', class: 'notes'
      m << error_messages_for(name)
    end
  end
  
  def office_check_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m.span ' (カタカナで入力してください。)', class: 'notes'
      m << error_messages_for(name)
    end
  end
  
  def account_check_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m.span ' (カタカナで入力してください。)', class: 'notes'
      m << error_messages_for(name)
    end
  end
  
  def web_registration_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m.span ' (カタカナで入力してください。)', class: 'notes'
      m << error_messages_for(name)
    end
  end
end
