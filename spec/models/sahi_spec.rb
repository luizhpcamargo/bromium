require 'spec_helper'

context "sahi functions" do
  let(:sahi) { Sahi.new}
  let(:driver) { double(:manage,manage: double(:timeout, timeouts: double(:implicit_wait, :implicit_wait= => nil))) }
  describe "browser" do
    it "should return the instance of browser as a symbol" do
      sahi.browser = "web_browser"
      expect(sahi.browser).to eql :web_browser
    end
    it "shoudl return firefox by default" do
      expect(sahi.browser).to eql :firefox
    end
  end
  describe "driver" do
    it "should call a instance of selenium web browser" do
      expect(driver.manage.timeouts).to receive(:implicit_wait=).with(6)
      expect(Selenium::WebDriver).to receive(:for).with(:firefox).and_return(driver)

      expect(sahi.driver).to eql driver
    end 
  end
end

