class DocumentDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def file_link
  	h.link_to model.title , model.attached_doc.url if model.attached_doc && h.can?(:read , model)
  end

  def edit_link
    if h.can? :update , model.lesson
      h.tag_label h.link_to("Edit" , h.edit_lesson_document_path(object.lesson,object)) , :success
    end
  end

  def destroy_link remote = false
    if h.can? :update , model.lesson
      h.tag_label h.link_to("Delete" , h.lesson_document_path(object.lesson,object) , 
                          method: :delete , remote: remote,
                          data: {confirm: "Are you sure?"}) , :danger
    end
  end

end
