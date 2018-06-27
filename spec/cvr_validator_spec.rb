require "rails_helper"

describe CvrValidator do
  it "is true for an 8-digit string with valid check digit" do
    expect_valid "35408002"
  end

  it "accounts for the special case of a 0 check digit" do
    expect_valid "25472020"
  end

  it "allows '-' separators" do
    expect_valid "35-40-80-02"
  end

  it "allows whitespace separators" do
    expect_valid " 35 40 80 02"
  end

  it "does not allow blanks" do
    expect_invalid nil
  end

  it "does not allow extra text" do
    expect_invalid "foo 35408002 bar"
  end

  it "rejects too-short strings" do
    expect_invalid "123"
  end

  it "rejects strings with invalid check digit" do
    expect_invalid "35408003"
  end

  # Let's validate some real examples to make sure we got it right.
  # From: https://datacvr.virk.dk/data/
  %w[37272884 25555619 21459895 35408002].each do |number|
    it "accepts real-life number #{number}" do
      expect_valid number
    end
  end

private

  def expect_valid(number)
    expect(Company.new(vat_number: number).valid?).to eq true
  end

  def expect_invalid(number)
    expect(Company.new(vat_number: number).valid?).to eq false
  end
end
