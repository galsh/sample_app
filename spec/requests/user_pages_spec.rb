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
end
