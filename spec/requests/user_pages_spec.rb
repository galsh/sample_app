require 'spec_helper'

describe "UserPages" do

	subject { page }

	describe "Sign up page " do
		# You can use the signup_path as it's set in the routes page
		before { visit signup_path }

		it { should have_selector('h1', text: 'Sign up') }
		it { should have_selector('title', text: full_title("Sign up")) } 
	end

	it "should have the right links on pages" do
		visit root_path
		click_link "Sign up now!"
		page.should have_selector('title', text: full_title("Sign up"))
	end

	describe "profile page " do
		# the first user is used for the rest of this block the second one references
		# the Factory Girl created one in spec/factories.rb
		let(:user) { FactoryGirl.create(:user) }
		# You can use the signup_path as it's set in the routes page
		before { visit user_path(user) }

		it { should have_selector('h1',	text: user.name) }
		it { should have_selector('title', text: user.name) }
	end
end
