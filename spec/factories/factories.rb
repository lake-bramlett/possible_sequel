require 'rails_helper'

FactoryBot.define do
  factory :user do
    email { 'test@test.com'}
    username { 'Tester'}
    password { '123456'}
  end

  factory :user2 do
    email { 'test2@test.com'}
    username { 'Tester2'}
    password { '123456'}
  end

end
