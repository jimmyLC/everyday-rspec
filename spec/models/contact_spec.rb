require 'rails_helper'

RSpec.describe Contact, :type => :model do

  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end

  it "is vaild with a first name, lastname and email" do
    contact = build( :contact,
      firstname: "Aaron",
      lastname: "Summer",
      email: "tester@example.com")
    expect(contact).to be_valid
  end

  it "invalid without a firstname" do
    contact = build(:contact, firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  it "invalid without a lastname" do
    contact = build(:contact, lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it "invalid without a email address" do
    contact = build(:contact, email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it "invalid without a duplicate email address" do
    create(:contact, email: "aaa@aaa.com")
    contact = build(:contact, email: "aaa@aaa.com")

    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end

  it "returns a contact's full name as a string" do
    contact = build( :contact,
                  firstname: "jimmy",
                  lastname: "Lin")
    expect(contact.name).to eq("jimmy Lin")
  end


end






