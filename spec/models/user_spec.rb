require 'rails_helper'

describe User do
  it { should have_many :posts }
  it { should validate_presence_of :email }
  it { should validate_presence_of :username }
  it { should validate_confirmation_of :password }

end
