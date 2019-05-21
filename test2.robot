 *** Settings ***
Documentation		Tests to verify that the browser lunches
Library			Selenium2Library     
Library           	OperatingSystem

***Variables***
@{BROWSERS}	 	chrome 	ff

*** Test Cases ***
             
Lunch Browser
        
	:FOR 	${BROWSER}	 IN 	@{BROWSERS}
		
	\	Open Browser		https://www.google.com		${BROWSER}		None		http://192.168.1.58:4445/wd/hub
	\	Maximize Browser Window
	\	Get Title
	\	Close Browser
