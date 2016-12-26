( Refinery::I18n.frontend_locales ).each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-race_registrations').blank?
        user.plugins.create(:name => 'refinerycms-race_registrations',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/race_registrations/registrations"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'Registrations',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end
end

(Refinery::I18n.frontend_locales).each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-race_registrations').blank?
        user.plugins.create(:name => 'refinerycms-race_registrations',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/race_registrations/people/new"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'People',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end
end
