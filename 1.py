import pytest
from selenium import webdriver
import time

from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support import expected_conditions as EC

def test_edureka():
    #service_log_path = "{}/firefox.log".format("/home/vagrant/jenkins/workspace/job5_5")
    #service_args = ['--verbose']
    #driver = webdriver.Chrome(executable_path="/usr/bin/chromedriver", service_args=service_args,service_log_path=service_log_path)
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--disable-dev-shm-usage")
    chrome_options.add_argument("--disable-extensions")
    chrome_options.add_argument("--no-sandbox");
    driver = webdriver.Chrome(options=chrome_options)
    driver.get("http://192.168.0.130:5000/index.php")
    driver.maximize_window()
    link = driver.find_element_by_xpath("//a[@id='About Us']")
    link.click()

