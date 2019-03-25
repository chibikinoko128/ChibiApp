require "rails_helper"

RSpec.describe SpMemberMailer, type: :mailer do
  describe "sp_money" do
    let(:mail) { SpMemberMailer.sp_money }

    it "renders the headers" do
      expect(mail.subject).to eq("Sp money")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
