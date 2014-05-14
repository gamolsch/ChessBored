require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the SessionHelper. For example:
#
# describe SessionHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe SessionsHelper do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is able identify current user" do
  	user = User.create(email: "rmathur101@gmail.com", password: "password")
  	session[:user_id] = user.id
  	expect(current_user.id).to eq(user.id)  
  end
end