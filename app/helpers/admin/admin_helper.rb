module Admin::AdminHelper
  def sortable_link(column, sort_order)
    link_class = "glyphicon glyphicon-triangle-#{sort_order == 'asc' ? 'top' : 'bottom'}"
    if params[:sort] == column && params[:direction] == sort_order
      link_class << ' disable-sort-link'
    end
    link_to '', "#{request.path}/?sort=#{column}&direction=#{sort_order}", class: link_class
  end
end