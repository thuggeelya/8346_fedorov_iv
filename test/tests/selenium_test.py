from seleniumwire import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.service import Service
import time

URL = "8346_fedorov_iv-app-1:5000"

class TestSelenium:
    def setup_method(self):
        option = webdriver.FirefoxOptions()
        option.binary_location = '/firefox/firefox'
        driverService = Service('/geckodriver')
        self.driver = webdriver.Firefox(service=driverService, options=option)

    def test_custom_button(self):
        self.driver.get(f"http://{URL}/")
        time.sleep(1)
        self.driver.execute_script(
            "document.getElementById('timeout_buttons').innerHTML = '<button id=\"custom_btn\">custom button</button>'")
        time.sleep(1)
        assert self.driver.find_element(By.ID, "custom_btn").get_attribute('innerHTML') == 'custom button'

    def teardown_method(self):
        self.driver.close()

