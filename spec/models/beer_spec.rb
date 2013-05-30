require 'spec_helper'

describe Beer do
	
	let(:user) { FactoryGirl.create(:user) }
	before do
		@beer = user.beers.build(name: "Guiness", 
										         beer_type: "stout",
										         description: "Creamy Irish goodness.")
	end

	subject { @beer }

	it { should respond_to(:name) }
	it { should respond_to(:beer_type) }
	it { should respond_to(:description) }
	it { should respond_to(:user_id) }	
	it { should respond_to(:user) }
	its(:user) { should == user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @beer.user_id = nil }
		it { should_not be_valid }
	end		

	describe "accessible attributes" do
		it "should not allow access to user id" do
			expect do
				Beer.new(user_id: user.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end	

	describe "with blank name" do
		before { @beer.name = " " }
		it { should_not be_valid }
	end		

	describe "with blank beer type" do
		before { @beer.beer_type = " " }
		it { should_not be_valid }
	end		

	describe "with blank description" do
		before { @beer.description = " " }
		it { should_not be_valid }
	end		
end
