module ApplicationHelper
 
  def status_tag(boolean, options={})
    options[:true]        ||= ''
    options[:true_class]  ||= 'status true'
    options[:false]       ||= ''
    options[:false_class] ||= 'status false'

    if boolean
      content_tag(:span, options[:true], :class => options[:true_class])
    else
      content_tag(:span, options[:false], :class => options[:false_class])
    end
  end

  def error_messages_for( object )
    render(:partial => 'shared/error_messages', :locals => {:object => object})
  end
  
  def user_image(user='')
    if user.image.blank?
       image_tag('user_normal.jpg', :size => '100x100', :alt => 'user picture') 
    else
       image_tag u.image_url.to_s, :size => '100x100' 
    end
  end
  
  def feast_image(feast='')
    if feast.image.blank?
       image_tag('feast_normal.jpg', :size => '260x260', :alt => 'user picture') 
    else
       image_tag feast.image_url.to_s, :size => '260x260' 
    end
  end
  
end
