require 'spec_helper'

describe "Static pages" do

	describe "Home page" do
		
		it "should have the content 'Cheve Makers'" do
			visit '/static_pages/home'
			page.should have_content('Cheve Makers')
		end
	end	
end
