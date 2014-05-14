require 'spec_helper' #need this (make sure the gem is in the gemfile (gem respec-rails) and be sure to run the rails generate rspec:install)

# describe User do
#   pending "add some examples to (or delete) #{__FILE__}" 
# end

describe User do
  it "is able to create user" do
    new_user = User.create!(email: "rmathur101@gmail.com", password_hash: "password")

    expect(new_user.email).to eq("rmathur101@gmail.com")
    expect(new_user.password_hash).to eq("password")
  end
end
