Given /^I am on the home page$/ do
  visit('/ncr')
end

Given /^I have entered "([^"]*)" into the "([^"]*)" field$/ do |text, field|
  fill_in field, :with => text
end

Then /^I should see "([^"]*)"$/ do |text|
  expect(page).to have_content text
end

Given(/^I click on "([^"]*)"$/) do |link|
  click_on link
end
