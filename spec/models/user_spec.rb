require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'Checks if user is created with a password field' do
      @user = User.create(:first_name => 'John', :last_name => "Mallory", :email => 'test@gmail.com', :password => nil, :password_confirmation => 'test')
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'Checks if user is created with a password_confirmation field' do
      @user = User.create(:first_name => 'John', :last_name => "Mallory", :email => 'test@gmail.com', :password => 'test', :password_confirmation => nil)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'Checks if password and password_confirmation match' do
      @user = User.create(:first_name => 'John', :last_name => "Mallory", :email => 'test@gmail.com', :password => 'test', :password_confirmation => 'not_test')
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'Checks if email is unique' do
      @user1 = User.create(:first_name => 'John', :last_name => "Mallory", :email => 'test@gmail.com', :password => 'test', :password_confirmation => 'test')
      @user2 = User.create(:first_name => 'John', :last_name => "Mallory", :email => 'TEST@GMAIL.com', :password => 'test', :password_confirmation => 'test')
      expect(@user2.errors.full_messages).to include('Email has already been taken')
    end

    it 'Checks if user was made with an email' do
      @user = User.create(:first_name => 'John', :last_name => "Mallory", :email => nil, :password => 'test', :password_confirmation => 'test')
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'Checks if user was made with a first name' do
      @user = User.create(:first_name => nil, :last_name => "Mallory", :email => 'test@gmail.com', :password => 'test', :password_confirmation => 'test')
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'Checks if user was made with a last name' do
      @user = User.create(:first_name => 'John', :last_name => nil, :email => 'test@gmail.com', :password => 'test', :password_confirmation => 'test')
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'Checks if password meets minimum length reqs' do
      @user = User.create(:first_name => 'John', :last_name => "Mallory", :email => 'test@gmail.com', :password => 'tst', :password_confirmation => 'tst')
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 4 characters)')
    end
  end

  describe '.authenticate_with_credentials' do
    it 'checks to see if there is a user with a given email' do
      @user = User.create(:first_name => 'John', :last_name => "Mallory", :email => 'test@gmail.com', :password => 'test', :password_confirmation => 'test')
      expect(User.authenticate_with_credentials('new@email.com', @user.password)).to be_nil
    end
    
    it 'checks to see if the password provided matches the password for the user in the database' do
      @user = User.create(:first_name => 'John', :last_name => "Mallory", :email => 'test@gmail.com', :password => 'test', :password_confirmation => 'test')
      expect(User.authenticate_with_credentials(@user.email, '1234')).to be_nil
    end

    it 'checks to see method returns the user if input has trailing and leading white space' do
      @user = User.create(:first_name => 'John', :last_name => "Mallory", :email => 'test@gmail.com', :password => 'test', :password_confirmation => 'test')
      expect(User.authenticate_with_credentials(' test@gmail.com ', 'test')).to eq(@user)
    end

    it 'checks to see method returns the user if input email is the wrong case' do
      @user = User.create(:first_name => 'John', :last_name => "Mallory", :email => 'tesT@Gmail.com', :password => 'test', :password_confirmation => 'test')
      expect(User.authenticate_with_credentials(' TESt@gMAIL.COM ', 'test')).to eq(@user)
    end
  end
end
