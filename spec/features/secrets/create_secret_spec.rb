require 'rails_helper'
RSpec.describe 'Creating a secret' do
	it 'create a new secret and redirects to profile page' do
		user = create_user
		log_in user
		fill_in 'New Secret', with: 'My Secret'
		click_button 'Create Secret'
		expect(current_path).to eq("/users/#{user.id}")
		expect(page).to have_text('My Secret')
	end
end

		