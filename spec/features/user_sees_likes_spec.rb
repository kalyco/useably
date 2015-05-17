require 'rails_helper'

feature 'main page shows photos' do
  let(:photo) { FactoryGirl.create(:photo) }

  pending 'visitor sees photo likes on main page' do
    visit photo_path
    expect(page).to have_content(photo.likes)
    end
  end
