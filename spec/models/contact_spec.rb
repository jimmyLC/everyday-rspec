require 'rails_helper'

RSpec.describe Contact, :type => :model do
  it "is vaild with a first name, lastname and email" do
    contact = Contact.new(
      firstname: "Aaron",
      lastname: "Summer",
      email: "tester@example.com")
    expect(contact).to be_valid
  end

  it "invalid without a firstname" do
    contact = Contact.new(firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  it "invalid without a lastname" do
    contact = Contact.new(lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it "invalid without a email address" do
    contact = Contact.new(email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end
  it "invalid without a duplicate email address" do
    Contact.create(
                  firstname: "jimmy",
                  lastname: "Lin",
                  email: "aaa@aaa.com")
    contact = Contact.create(
                  firstname: "jim",
                  lastname: "L",
                  email: "aaa@aaa.com")
    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end
  it "returns a contact's full name as a string" do
    contact = Contact.create(
                  firstname: "jimmy",
                  lastname: "Lin",
                  email: "aaa@aaa.com")
    expect(contact.name).to eq("jimmy Lin")
  end
end
