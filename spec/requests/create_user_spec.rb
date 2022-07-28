require 'rails_helper'
RSpec.describe 'Create New User' do
  scenario 'creates new user and returns correct format', :vcr do
    @request_body = {
                     "email": 'fake@user.com',
                     "password": 'test12345678',
                     "password_confirmation": 'test12345678'
                     }

    post '/user', :params => @request_body, as: :json

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
  end


  context 'Sad Path' do
    scenario 'returns error if password confirmation is wrong', :vcr do
      @request_body = {
                       "email": 'fake@user.com',
                       "password": 'test12345678',
                       "password_confirmation": 'test2'
                       }
      post '/user', :params => @request_body, as: :json
      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(422)
    end

    scenario 'returns error if email is already taken', :vcr do

      User.create!(email: 'og@user.com', password: 'real_one', password_confirmation: 'real_one')

      @request_body = {
                       "email": 'og@user.com',
                       "password": 'test12345678',
                       "password_confirmation": 'test12345678'
                       }
      post '/user', :params => @request_body, as: :json
      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(422)
      expect(expected.keys.length).to eq(1)
      expect(expected.keys[0]).to eq(:message)
      expect(expected.keys[0]).to_not eq(:data)

      expect(expected[:message][0]).to eq("Email has already been taken")
    end

    scenario 'ok if request not sent in body', :vcr do

      post "/user?email=g@gmail.com&password=someword&password_confirmation=someword"

      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
    end
  end
end
