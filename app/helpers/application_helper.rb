module ApplicationHelper
  def breadcrumb
    result = []
    result << link_to(t("breadcrumb.#{controller_name}.root"), url_for(:controller => controller_name.to_sym, :action => :index))
    result << link_to(t("breadcrumb.#{controller_name}.#{action_name}"), url_for(:controller => controller_name.to_sym, :action => action_name.to_sym)) if action_name != 'index'
    result.join " &raquo; "
  end
end