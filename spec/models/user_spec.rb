require 'spec_helper'
#for tests to run sucessfully you need to clone the development database structure to a test database
# bundle exec rake db:test:prepare
describe "User" do

	before do
    @user = User.new(name: "Example User", email: "user@example.com", 
                     password: "foobar", password_confirmation: "foobar")
  end

	subject{ @user }
  #calls to the attributes of the User object eg User.respond_to?(:name) returns boolean
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to (:password_digest) }
  it { should respond_to (:password) }
  it { should respond_to (:password_confirmation) }
  it { should respond_to(:authenticate) }
  # calls User.valid?
  it { should be_valid }


  # since we said the name presence has to be true in the user model, the valid? method will return
  # false if its incorrect
  describe "When name is not present" do
  	before { @user.name = " " }
  	# user.name.valid? expect false
  	it { should_not be_valid }
  end

  describe "When email is not present" do
  	before { @user.email = " " }
  	it { should_not be_valid }
  end

  describe "When name is greater than 50 characters" do
  	before { @user.name = "a" * 51 }
  	it { should_not be_valid }
  end

  describe "when email format is invalid" do
  	it "should be invailid" do
  		addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
  		addresses.each do |invalid_address|
  			@user.email = invalid_address
  			@user.should_not be_valid
  		end
  	end
  end

  # test as a saftey match to test valid addresses as regualar expressions are brittle and easy to make a mistake
  describe "When email format is valid" do
  	it "should be valid" do
  		addresses = %w[user@foo.COM A_Us-er@f.b.org first.last@foo.jp a+b@baz.cn]
  		addresses.each do |valid_address|
  			@user.email = valid_address
  			@user.should be_valid
		 end
	  end
	end

  describe "When email address is alredy taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
       it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "When password does not match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "return value of authenicate method" do
    before { @user.save }
    # rspec command let
    let(:found_user) { User.find_by_email(@user.email) }
    describe "with valid password" do
      # authenicate is a rails method
      it { should == found_user.authenticate(@user.password) }
      # it returns the username if the password is valid
      end
      describe "with invalid password" do
        let(:user_for_invalid_password) { found_user.authenticate("invalid") }
        it { should_not == user_for_invalid_password }
        specify { user_for_invalid_password.should be_false }
      end
   end
end

