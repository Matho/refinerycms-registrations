def search_chosen(selector, search)
  page.execute_script "jQuery('#{selector}').click();"
  find('div.chzn-search input').set search
end

def select_from_chosen(selector, name)
  page.execute_script "jQuery('#{selector}').click();"
  page.execute_script "jQuery(\".chzn-results .active-result:contains('#{name}')\").click();"
  wait_for_ajax
end

def visible_in_chosen(*args)
  within '.chzn-drop' do
    args.each do |text|
      page.should have_css('li', :text => text)
    end
  end
end

def not_visible_in_chosen(*args)
  within '.chzn-drop' do
    args.each do |text|
      page.should have_no_css('li', :text => text)
    end
  end
end

def wait_for_ajax
  if Capybara.current_driver == :poltergeist
    delay = Capybara.default_wait_time/100.0
    100.times do
      break if evaluate_script('jQuery.active').to_i == 0
      sleep delay
    end
    unless evaluate_script('jQuery.active').to_i == 0
      raise "Giving up waiting for AJAX to complete after #{Capybara.default_wait_time} seconds"
    end
  end
end