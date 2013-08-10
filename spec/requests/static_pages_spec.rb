require 'spec_helper'

describe "Static Pages" do

	describe "Home Page" do

		it "should have the content 'Sample App'" do

			visit '/static_pages/home'
			page.should have_selector('h1', :text => 'Sample App')

			page.should have_selector('title', 
				:text => "Ruby on Rails Tutorial Sample App | Home")
		end
	end

	describe "Help Page" do

		it "should have the content help" do

			visit '/static_pages/help'
			page.should have_selector('h1', :text => 'Help')

			
		end
	end

	describe "About Page" do

		it "should have the content 'About Us'" do

			visit '/static_pages/about'
			page.should have_content('About Us')
		end
	end

	describe "Contact Us Page" do

		it "should have the content 'Contact Us'" do

			visit '/static_pages/contact'
			page.should have_selector('h1', :text => 'Contact Us')
		end
	end



end
