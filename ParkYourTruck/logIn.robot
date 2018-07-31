*** Settings ***
Documentation		This is park-your-truck login test
Library			Selenium2Library

*** Variables ***
${browser}	chrome
${url}		https://www.park-your-truck.com

*** Test Case ***
LogIn Test
	Open Home Page
	Valid LogIn
	LogOut

*** Keywords ***
Open Home Page
	Open Browser			${url}			${browser}
	Maximize Browser Window
	Wait until Element Is Visible	css=#gdprok
   	Click Element			css=#gdprok
	Wait Until Element Is Visible	css = a[href*="https://park-your-truck.com/falogin/account/login/"]
	Click Element			css = a[href*="https://park-your-truck.com/falogin/account/login/"]
Valid LogIn
	Input Text	 	css = #email		gdonev@ssidecisions.com
	Input Password		css = #pass		pass.1234
	Click Button		css = #send2
LogOut
	Click Element	css = span.signin-logout>a
	Close Browser
