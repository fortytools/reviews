module ApplicationHelper
  def generate_fields(f, association, object=nil)
    object ||= f.object.class.reflect_on_association(association).klass.new
    f.fields_for(association, object, :child_index => "new_#{association}") do |builder|
      render("components/fields/" + association.to_s.singularize + "_fields", :f => builder)
    end
  end

  # options
  #    container_selector: jquery selector that will be used to find container elem for new nodes
  #    additional_class: additional class to add to the button
  def link_to_add_fields(name, f, association, options = {})
    container_selector = options[:container_selector] || ''
    fields = generate_fields(f, association, options[:object] )
    function = %{add_fields(this,
                            '#{association}',
                            '#{escape_javascript(fields)}',
                            '#{container_selector}'); }
    if options[:callback]
      function = function + "#{options[:callback]}"
    end
    function = function + "return false;"
    # TODO unobstrusive javascript anyone?
    additional_class = " " + (options[:additional_class] || "")
    link_to(name, "#", class: 'button small' + additional_class, onclick: function)
  end

  def user_options_without_current_user(selected=nil)
    users = User.without_user(current_user).map do |user|
      [user.display_name, user.id]
    end
    options_for_select(users, selected: selected)
  end
end
