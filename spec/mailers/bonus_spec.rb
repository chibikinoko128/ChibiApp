require "rails_helper"

RSpec.describe BonusMailer, type: :mailer do
  describe "bonus_get" do
    let(:mail) { BonusMailer.bonus_get }

    it "renders the headers" do
      expect(mail.subject).to eq("Bonus get")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
