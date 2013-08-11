require 'spec_helper'

describe "Static Pages" do

	describe "Home Page" do

		it "should have the content 'Sample App'" do

			visit root_path
			page.should have_selector('h1', text: 'Sample App')
		end
		it "should have the base title" do

			visit root_path
			page.should have_selector('title', 
				text: "Ruby on Rails Tutorial Sample App")
		end

		it "should not have a custom page title" do
			visit root_path
			page.should_not have_selector('title', text: '| Home')
		end
		
	end

	describe "Help Page" do

		it "should have the content help" do

			visit help_path
			page.should have_selector('h1', text: 'Help')

			
		end
	end

	describe "About Page" do

		it "should have the content 'About Us'" do

			visit about_path
			page.should have_content('About Us')
		end
	end

	describe "Contact Us Page" do

		it "should have the content 'Contact Us'" do

			visit contact_path
			page.should have_selector('h1', text: 'Contact Us')
		end
	end



end
