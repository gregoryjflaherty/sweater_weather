require 'rails_helper'
RSpec.describe 'Create New User' do
  scenario 'creates new user and returns correct format', :vcr do
    @request_body = {
                     "email": 'fake@user.com',
                     "password": 'test',
                     "password_confirmation": 'test'
                     }

    post '/api/v1/users', :params => @request_body

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(expected.keys.length).to eq(1)
    expect(expected.keys[0]).to eq(:data)

    expect(expected[:data].keys).to include(:id)
    expect(expected[:data].keys).to include(:type)
    expect(expected[:data].keys).to include(:attributes)
    expect(expected[:data][:attributes].keys).to include(:email)
    expect(expected[:data][:attributes].keys).to include(:api_key)

    expect(expected[:data][:id].to_i).to be_a Integer
    expect(expected[:data][:type]).to eq('users')

    expect(expected[:data][:attributes][:email]).to be_a String
    expect(expected[:data][:attributes][:api_key]).to be_a String
  end


  context 'Sad Path' do
    scenario 'returns error if password confirmation is wrong', :vcr do
      @request_body = {
                       "email": 'fake@user.com',
                       "password": 'test',
                       "password_confirmation": 'test2'
                       }
      post '/api/v1/users', :params => @request_body
      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(422)
      expect(expected.keys.length).to eq(1)
      expect(expected.keys[0]).to eq(:message)
      expect(expected.keys[0]).to_not eq(:data)

      expect(expected[:message][0]).to eq("Password confirmation doesn't match Password")
    end

    scenario 'returns error if email is already taken', :vcr do

      User.create!(email: 'og@user.com', password: 'real_one', password_confirmation: 'real_one')

      @request_body = {
                       "email": 'og@user.com',
                       "password": 'test',
                       "password_confirmation": 'test'
                       }
      post '/api/v1/users', :params => @request_body
      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(422)
      expect(expected.keys.length).to eq(1)
      expect(expected.keys[0]).to eq(:message)
      expect(expected.keys[0]).to_not eq(:data)

      expect(expected[:message][0]).to eq("Email has already been taken")
    end
  end
end
