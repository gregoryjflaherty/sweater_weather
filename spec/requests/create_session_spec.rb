# require 'rails_helper'
# RSpec.describe 'Log In User' do
#   before(:each) do
#     User.create!(email: 'fake@user.com', password: 'test', password_confirmation: 'test')
#   end

#   scenario 'creates new session and returns user info', :vcr do
#     @request_body = {
#                      "email": 'fake@user.com',
#                      "password": 'test',
#                      }

#     post '/api/v1/sessions', :params => @request_body, as: :json

#     expected = JSON.parse(response.body, symbolize_names: true)

#     expect(response).to be_successful
#     expect(response.status).to eq(200)
#     expect(expected.keys.length).to eq(1)
#     expect(expected.keys[0]).to eq(:data)

#     expect(expected[:data].keys).to include(:id)
#     expect(expected[:data].keys).to include(:type)
#     expect(expected[:data].keys).to include(:attributes)
#     expect(expected[:data][:attributes].keys).to include(:email)
#     expect(expected[:data][:attributes].keys).to include(:api_key)

#     expect(expected[:data][:id].to_i).to be_a Integer
#     expect(expected[:data][:type]).to eq('users')

#     expect(expected[:data][:attributes][:email]).to be_a String
#     expect(expected[:data][:attributes][:api_key]).to be_a String

#     expect(expected[:data].length).to eq(3)
#     expect(expected[:data][:attributes].length).to eq(2)
#     expect(expected[:data][:attributes].keys).to_not include(:password)
#   end


#   context 'Sad Path' do
#     scenario 'returns error if passed in via params', :vcr do

#       post '/api/v1/users?email=fake@user.com&password=test'
#       expected = JSON.parse(response.body, symbolize_names: true)

#       expect(response).to_not be_successful
#       expect(response.status).to eq(400)
#       expect(expected.keys.length).to eq(1)
#       expect(expected.keys[0]).to eq(:message)
#       expect(expected.keys).to_not include(:data)

#       expect(expected[:message]).to eq("Request must be sent in body")
#     end

#     scenario 'returns error if email is incorrect', :vcr do
#       @request_body = {
#                        "email": 'fake1@user.com',
#                        "password": 'test',
#                        }

#       post '/api/v1/sessions', :params => @request_body, as: :json

#       expected = JSON.parse(response.body, symbolize_names: true)

#       expect(response).to_not be_successful
#       expect(response.status).to eq(422)
#       expect(expected.keys.length).to eq(1)
#       expect(expected.keys[0]).to eq(:message)
#       expect(expected.keys).to_not include(:data)

#       expect(expected[:message]).to eq("Password/Email combination does not match")
#     end

#     scenario 'returns error if password is incorrect', :vcr do
#       @request_body = {
#                        "email": 'fake@user.com',
#                        "password": 'test1',
#                        }

#       post '/api/v1/sessions', :params => @request_body, as: :json

#       expected = JSON.parse(response.body, symbolize_names: true)

#       expect(response).to_not be_successful
#       expect(response.status).to eq(422)
#       expect(expected.keys.length).to eq(1)
#       expect(expected.keys[0]).to eq(:message)
#       expect(expected.keys).to_not include(:data)

#       expect(expected[:message]).to eq("Password/Email combination does not match")
#     end

#     scenario 'returns error if request not sent in body', :vcr do

#       post "/api/v1/sessions?email=g@gmail.com&password=someword"

#       expected = JSON.parse(response.body, symbolize_names: true)

#       expect(response).to_not be_successful
#       expect(response.status).to eq(400)
#       expect(expected.keys.length).to eq(1)
#       expect(expected.keys[0]).to eq(:message)
#       expect(expected.keys[0]).to_not eq(:data)

#       expect(expected[:message]).to eq("Request must be sent in body")
#     end
#   end
# end
