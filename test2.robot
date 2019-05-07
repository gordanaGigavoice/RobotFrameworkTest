 *** Settings ***
Documentation		Tests to verify that the browser lunches
Library			Selenium2Library     
Library           	OperatingSystem

***Variables***
${BROWSER}	chrome

*** Test Cases ***
             
Lunch Browser
        
	
		
	Open Browser		https://www.google.com		${BROWSER}		None		http://192.168.3.211:4445/wd/hub
	Maximize Browser Window
	Get Title
	Close Browser
