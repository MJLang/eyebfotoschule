class Admin::NestedController < Admin::BaseController

  before_action :retrieve_parent
  before_action :retrieve_scope

  layout :retrieve_layout

  def retrieve_scope
    @scope = @parent.nil? ? controller_name : @parent.class.name.pluralize.downcase || ''
  end

  def retrieve_view
    controller_name + '/' + @scope + '/' + action_name
  end

  def retrieve_parent
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @parent = $1.classify.constantize.find(value)
      end
    end
  end

  def retrieve_layout
   template_exists?(@scope, 'layouts') ? @scope : 'application'
  end

end