# coding: utf-8

require "spec_helper"
require "password_generator"

describe PasswordGenerator do
  before(:example) do
    @password_generator = PasswordGenerator.new
  end

  it "has method 'generate'" do
    expect(@password_generator.respond_to? :generate).to be true
  end

  it "should raise exception when parameter is less than 8" do
    expect{@password_generator.generate(7)}.to raise_error RuntimeError
    expect(@password_generator.generate(8)).to be_an_instance_of(String)
  end

  it "should raise exception when parameter is greater than 32" do
    expect(@password_generator.generate(32)).to be_an_instance_of(String)
    expect{@password_generator.generate(33)}.to raise_error RuntimeError
  end

  it "should be equal to length of parameter" do
    (8..32).each do |i|
      expect(@password_generator.generate(i).length).to be i
    end
  end

  it "should include one or more capital letters" do
    (8..32).each do |i|
      expect(@password_generator.generate(i)).to match(/[A-Z]/)
    end
  end

  it "should include one or more small letters" do
    (8..32).each do |i|
      expect(@password_generator.generate(i)).to match(/[a-z]/)
    end
  end

  it "should include one or more numeric characters" do
    (8..32).each do |i|
      expect(@password_generator.generate(i)).to match(/\d/)
    end
  end

  it "should not include similar characters" do
    (8..32).each do |i|
      expect(@password_generator.generate(i)).not_to match(/I|O|l|0|1/)
    end
  end
end
