require 'spec_helper'

describe Brewery do

	let(:user) { FactoryGirl.create(:user) }
	before do
		@brewery = user.build_brewery(name: "Senor Beer", 
													 description: "A great fucking brewery",
													 site_url: "www.senorbeer.com", 
													 twitter_url: "twitter.com/senorbeer")
	end

	subject { @brewery }

	it { should respond_to(:name) }
	it { should respond_to(:description) }
	it { should respond_to(:site_url) }
	it { should respond_to(:twitter_url) }
	it { should respond_to(:user_id) }	
	it { should respond_to(:user) }
	its(:user) { should == user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @brewery.user_id = nil }
		it { should_not be_valid }
	end	

	describe "accessible attributes" do
		it "should not allow access to user_id" do
			expect do
				Brewery.new(user_id: user.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end		

	describe "with blank name" do
		before { @brewery.name = " " }
		it { should_not be_valid }
	end

	describe "with blank description" do
		before { @brewery.description = " " }
		it { should_not be_valid }
	end		
end
