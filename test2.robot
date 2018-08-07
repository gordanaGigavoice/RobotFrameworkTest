 *** Settings ***
Documentation		Tests to verify that the browser lunches
Library			Selenium2Library     
Library           	OperatingSystem


*** Test Cases ***
             
Lunch Browser
        
	Set Environment Variable	chromedriver		/home/gigavoice/testsRob/chromedriver
		
	Open Browser		https://www.google.com		chrome		None		http://localhost:4445/wd/hub
	Close Browser
