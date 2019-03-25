class CustomerFormPresenter < UserFormPresenter
  def birthday_field_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      if options[:class].kind_of?(String)
        classes = options[:class].strip.split + [ 'birthday-picker' ]
        options[:class] = classes.uniq.join(' ')
      else
        options[:class] = 'birthday-picker'
      end
      m << text_field(name, options)
      m << error_messages_for(name)
    end
  end

  def gender_field_block
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(:gender, 'あなたの性別')
      m << radio_button(:gender, 'male')
      m << label(:gender_male, '男性')
      m << radio_button(:gender, 'female')
      m << label(:gender_female, '女性')
    end
  end
  
  def bk_name_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m << error_messages_for(name)
    end
  end
  
  #def nickname_field_block(name, label_text, options = {})
    #markup(:div, class: 'input-block') do |m|
      #m << decorated_label(name, label_text, options)
      #m << text_field(name, options)
      #m.span ' (半角英数字で入力してください。)', class: 'notes'
      #m << error_messages_for(name)
    #end
  #end
  
  #def sponsor1_field_block(name, label_text, options = {})
    #markup(:div, class: 'input-block') do |m|
      #m << decorated_label(name, label_text, options)
      #m << text_field(name, options)
      #m.span ' (半角英数字で入力してください。)', class: 'notes'
      #m << error_messages_for(name)
    #end
  #end
end
