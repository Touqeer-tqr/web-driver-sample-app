# ruby version used 2.3.2
p `which ruby`
# gem install selenium-webdriver
require 'httparty'
# require 'geocoder'
require "selenium-webdriver"
require 'watir'
require 'nokogiri'
require 'byebug'

# url = "https://www.amazon.com/"
url = "https://www.daraz.pk/"

Selenium::WebDriver::Chrome.driver_path = "browser-drivers/chromedriver"
@browser = Watir::Browser.new :chrome#, headless: true

@browser.goto(url)

# jQuery_script = "var script = document.createElement('script'); script.src = 'https://code.jquery.com/jquery-3.3.1.min.js; document.head.appendChild(script);"
# @browser.execute_script(jQuery_script)
# @browser.execute_script("jQuery('input#twotabsearchtextbox').val('Book')")
# @browser.execute_script("jQuery('select#searchDropdownBox option:contains('Book')').attr('selected', 'selected')")
# @browser.execute_script("$('form.nav-searchbar').submit()")
# @browser.div(:class => "s-results-list-atf").present?
# while(@browser.div(:class => "s-results-list-atf").present?)
#   sleep(0.5)
# end


@browser.execute_script("$('#q').val('watch')")
@browser.execute_script("$('#topActionHeader').find('form').submit()")
while(!@browser.div(:class => "c3Pa4S").present?)
  sleep(0.5)
end
nokogiri_page = Nokogiri::HTML(@browser.html)
p items_list = nokogiri_page.css(".c3Pa4S").text

# sleep(60)
