require "cookieconsent/version"

module Cookieconsent
  def cookie_consent(&block)
    cookies['cookie-consent'] = params['cookie-consent'] unless params['cookie-consent'].nil?
    if cookies['cookie-consent'] == 'yes'
      capture(&block)
    else
      buffer = "<div class='cookieconsent'>".html_safe
      buffer += "<p>#{I18n.t('cookieconsent.no-consent')}</p>".html_safe
      buffer += link_to I18n.t('cookieconsent.no-consent-link'), url_for('cookie-consent' => 'yes'), {class: "cookieconsent-link"}
      buffer += "</div>".html_safe
    end
  end

  def cookie_consent_bar
    cookies['cookie-consent'] = params['cookie-consent'] unless params['cookie-consent'].nil?
    unless cookies['cookie-consent'] == 'yes' || cookies['cookie-consent'] == 'no'
      buffer = "<div class='cookieconsentbar'>".html_safe
      buffer += "<p>#{I18n.t('cookieconsent.bar.no-consent')}</p>".html_safe
      buffer += link_to I18n.t('cookieconsent.bar.no-consent-link'), url_for('cookie-consent' => 'yes'), {class: "cookieconsent-link-allow"}
      buffer += link_to I18n.t('cookieconsent.bar.no-consent-link-deny'), url_for('cookie-consent' => 'no'), {class: "cookieconsent-link-deny"}
      buffer += "</div>".html_safe
    end
  end
end

ActionView::Base.send :include, Cookieconsent

locales_dir = File.expand_path('../../config/locales/', __FILE__)
files = Dir[File.join(locales_dir, '*.yml')]
I18n.load_path += files