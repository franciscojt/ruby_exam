require 'rails_helper'
RSpec.describe 'Updating user' do
	it 'updates user and redirect to the profile page' do
		user = create_user
		log_in user
		expect(page).to have_text('kobe')
		click_link 'Edit Profile'
		fill_in 'Name', with: 'drake'
		fill_in 'Password', with: 'password'
		fill_in 'Password Confirmation', with: 'password'
		click_button 'Update'
		expect(page).not_to have_text('kobe')
		expect(page).to have_text('drake')
	end
end