require "spec_helper"

describe BookingMailer do
  describe "confirmation_mail" do
    let(:mail) { BookingMailer.confirmation_mail }

    it "renders the headers" do
      mail.subject.should eq("Confirmation mail")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "summary_mail" do
    let(:mail) { BookingMailer.summary_mail }

    it "renders the headers" do
      mail.subject.should eq("Summary mail")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
