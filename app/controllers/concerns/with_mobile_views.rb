# http://scottwb.com/blog/2012/02/23/a-better-way-to-add-mobile-pages-to-a-rails-site/
module WithMobileViews
  extend ActiveSupport::Concern

  included do
    helper_method :mobile_device?
  end

  def check_for_mobile
    cookies.permanent[:mobile_override] = params[:mobile] if params[:mobile]
    prepare_for_mobile if mobile_device?
  end

  def prepare_for_mobile
    prepend_view_path Rails.root.join('app', 'views_mobile')
    @body_mobile_class = 'mobile-body'
  end

  def mobile_device?
    return false unless mimic_user&.sudo?
    return cookies.permanent[:mobile_override] == '1' if cookies.permanent[:mobile_override]
    (request.user_agent =~ /iPhone|iPod|Android|webOS|Mobile/) && (request.user_agent !~ /iPad/)
  end
end
