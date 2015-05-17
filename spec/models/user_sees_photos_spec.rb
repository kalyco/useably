require 'rails_helper'

feature 'main page shows photos' do
  let(:photo) { FactoryGirl.create(:photo) }

  pending 'visitor sees photos on main page' do
    visit photo_path
    expect(page).to have_content(photo.name)
    end
  end
