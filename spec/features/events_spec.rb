require 'rails_helper'

feature 'CRUDing Events' do
  scenario 'user deletes an event' do
    Event.create!(
      description: "SantaCon",
    )

    visit root_path
    click_on "delete"
    expect(page.current_path).to eq events_path
  end

  scenario 'user creates an event' do
    visit root_path
    click_on "New Event"
    fill_in "Description", with: "SantaCon"
    fill_in "Location", with: "Union Square"
    click_on "Create Event"
    expect(page).to have_content("Union Square","SantaCon")
  end

  scenario 'user edits an event' do
    Event.create!(
      description: "SantaCon",
    )

    visit root_path
    click_on "edit"
    fill_in "Location", with: "North Pole"
    click_on "Update Event"
    expect(page).to have_content("North Pole")
  end

  scenario 'user visits show page' do
    Event.create!(
      description: "SantaCon",
    )

    visit root_path
    click_on "SantaCon"

    expect(page).to have_content("Description: SantaCon")
  end




end
