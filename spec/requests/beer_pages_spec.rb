require 'spec_helper'

describe "Beer pages" do

	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	describe "beer creation" do
		before { visit new_user_beer_path(user) }

		describe "with invalid information" do
			
			it "should not create a beer" do
				expect { click_button "Post" }.not_to change(Beer, :count)
			end

			describe "error messages" do
				before { click_button "Post" }
				it { should have_content('error') }
			end
		end			

		describe "with valid information" do
			
			before do
				fill_in 'beer_name',        with: "Stella Artois"
				fill_in 'beer_beer_type',   with: "Pilsner"
				fill_in 'beer_description', with: "A delightful beer in a fancy ass glass." 
			end				

			it "should create a beer" do
				expect { click_button "Post" }.to change(Beer, :count).by(1)
			end				
		end	
	end	

	describe "editing a beer" do
		let(:beer) { FactoryGirl.create(:beer, 
																		name: "Bohemia", 
																		beer_type: "mexican lager",
																		description: "Tasty Mexican goodness",
																		user: user) }

		before { visit edit_user_beer_path(user, beer) }

		describe "page" do
			it { should have_selector('h1',    text: "Update beer") }	
			it { should have_selector('title', text: "Edit beer") }			
		end	

		describe "with invalid information" do
		end

		describe "with valid information" do	
			let(:new_name)        { "New Beer Name" }
			let(:new_beer_type)	  { "New Beer Type" }
			let(:new_description)	{ "New Beer Description" }
			before do
				fill_in "Name",        with: new_name
				fill_in "Beer type",   with: new_beer_type				
				fill_in "Description", with: new_description	
				click_button "Save changes"
			end	

			it { should have_selector('div.alert.alert-success') }
			specify { beer.reload.name.should == new_name }
			specify { beer.reload.beer_type.should == new_beer_type }
			specify { beer.reload.description.should == new_description }
		end	
	end	

	describe "beer destruction" do
		before { FactoryGirl.create(:beer, user: user) }

		describe "as correct user" do
			before { visit user_path(user) }

			it "should delete a beer" do
				expect { click_link "delete" }.to change(Beer, :count).by(-1)
			end
		end
	end		
end
