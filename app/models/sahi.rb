class Sahi
	attr_accessor :browser

	def browser
		@browser ||= "firefox"
		browser.to_sym
	end

	def browser=(val)
		self.browser = val
	end

	def driver
		@driver ||= Selenium::WebDriver.for browser
		@driver.manage.timeouts.implicit_wait = 6 # seconds
		return @driver
	end

	def _navigateTo(params)
		driver.navigate.to(params)
	end

	def _wait(number, params = nil)
		driver.wait
	end

	def _assertEqual(element_1, element_2)
		driver.assertEqual(element_1,element_2)
	end
end