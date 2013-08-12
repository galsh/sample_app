require 'spec_helper'

describe "Static Pages" do
	subject { page }

	describe "Home Page" do
		before { visit root_path }

		it { should have_selector('h1', text: 'Sample App') }
		it { should have_selector('title', text: full_title("")) } 
	end

	describe "Help Page" do
		before { visit help_path }

		it { should have_selector('h1', text: 'Help') }
		it { should have_selector('title', text: full_title("Help")) } 
	end

	describe "About Page" do
		before { visit about_path }

		it { should have_content('About Us') }
		it { should have_selector('title', text: full_title("About Us")) } 
	end

	describe "Contact Us Page" do
		before {visit contact_path}

		it { should have_selector('h1', text: 'Contact Us') }
		it { should have_selector('title', text: full_title("Contact Us")) } 
	end

	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		page.should have_selector('title', text: full_title("About Us"))
		click_link "Help"
		page.should have_selector('title', text: full_title("Help"))
		click_link "Contact"
		page.should have_selector('title', text: full_title("Contact"))
	end
end
