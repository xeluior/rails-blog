module ApplicationHelper
  class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
    def text_field(attribute, options = {})
      options[:class] = 'form-control'
      options[:placeholder] = attribute.to_s
      @template.content_tag :div, class: 'form-floating' do
        super + label(attribute)
      end
    end

    def text_area(attribute, options = {})
      options[:class] = 'form-control'
      options[:placeholder] = attribute.to_s
      @template.content_tag :div, class: 'form-floating' do
        super + label(attribute)
      end
    end

    def submit(value = nil, options = {})
      options[:class] = 'btn btn-primary'
      super
    end
  end
end
