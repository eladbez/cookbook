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
       image_tag('feast_normal.jpg', :size => '260x260', :alt => 'feast picture') 
    else
       image_tag feast.image_url.to_s, :size => '260x260' 
    end
  end
  
  def dish_image(dish='',size='')
    if dish.image.blank?
       image_tag('dish_normal.jpg', :size => size, :alt => 'dish picture') 
    else
       image_tag dish.image_url.to_s, :size => size 
    end
  end
  def one_unpersisted?(grp='')
    one_not_db = false
    grp.each do |g|
      unless g.persisted?
        one_not_db = true
      end
    end
  one_not_db
  end
  
  def add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
