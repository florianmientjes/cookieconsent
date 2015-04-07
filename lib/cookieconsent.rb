require "cookieconsent/version"

module Cookieconsent
  def cookie_consent(&block)
    cookies['cookie-consent'] = params['cookie-consent'] unless params['cookie-consent'].nil?
    if cookies['cookie-consent'] == 'yes'
      capture(&block)
    else
      buffer = "".html_safe
      buffer += I18n.t('cookieconsent.no-consent')
      buffer += " "
      buffer += link_to I18n.t('cookieconsent.no-consent-link'), url_for('cookie-consent' => 'yes')
    end
  end
end

ActionView::Base.send :include, Cookieconsent
I18n.load_path += [File.expand_path('../../config/locales/nl.yml', __FILE__)]