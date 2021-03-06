require "rails_helper"

RSpec.describe DirectMailer, type: :mailer do
  describe "d_mail" do
    let(:mail) { DirectMailer.d_mail }

    it "renders the headers" do
      expect(mail.subject).to eq("D mail")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
