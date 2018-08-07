*** Settings ***
Documentation    Tests to verify that the browser lunches


Library    Selenium2Library

*** Variables ***

${URL}            https://www.park-your-truck.com
${BROWSER}        chrome
${USERNAME}	gdonev@ssidecisions.com
${PASS}		pass.1234
${Email}	xpath=//*[@id="email"]
*** Test Cases ***
Launching the browser 
        
	

	Open Browser	${URL}	${BROWSER}	None	http://localhost:4445/wd/hub
	Maximize Browser Window

LogIn page
	Wait until element is visible   css=html body.cms-home.cms-index-index.page-layout-1column div.page-wrapper div#ssieugdpr-banner.ssieugdpr-banner.ssieugdpr--center center button#gdprok 	
	Click Element	css=html body.cms-home.cms-index-index.page-layout-1column div.page-wrapper div#ssieugdpr-banner.ssieugdpr-banner.ssieugdpr--center center button#gdprok
	Wait until element is visible	css=body > div.page-wrapper > div > div > div.frontpage-reg-request-btns > a	2
	Click Element	css=body > div.page-wrapper > div > div > div.frontpage-reg-request-btns > a
	Input Text	${Email}	${USERNAME}
	Input Text	xpath=//*[@id="pass"]	${PASS}
	Click Button	css=#send2
LogOut page
	Click Element	css=body > div.page-wrapper > header > div.header.content > span.signin-logout > a
	Close Browser


*** Keywords ***





