module ApplicationHelper
  include HtmlBuilder
  
  def document_title
    if @title.present?
      "#{@title} - Chibi"
    else
      'Chibi'
    end
  end
end
