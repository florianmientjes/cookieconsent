require "cookieconsent/version"

module Cookieconsent
  def tracking_consent(&block)
    cookies['cookies-consent'] = params['cookies-consent'] unless params['cookies-consent'].nil?
    if cookies['cookies-consent'] == 'yes'
      capture(&block)
    else
      buffer = "".html_safe
      buffer += I18n.t('cookieconsent.no-consent')
      buffer += " "
      buffer += link_to I18n.t('cookieconsent.no-consent-link'), url_for('cookies-consent' => 'yes')
    end
  end
end

ActionView::Base.send :include, Cookieconsent
I18n.load_path += [File.expand_path('../../config/locales/nl.yml', __FILE__)]