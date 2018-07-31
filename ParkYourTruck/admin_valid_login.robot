*** Settings ****
Documentation		This is a test case for magento admin login
Library		Selenium2Library
*** Variables ***
${BROWSER}		Chrome
${SERVER}		www.park-your-truck.com
${ADMIN_URL}		https://${SERVER}/pyt_admin16
${ADMIN_USER}		ssi.qa
${ADMIN_PASS}		pass.1234
${DELAY}		0
*** Test Cases ***
Admin logIN
	Open Browser to Admin Page
	Input Username
	Input Password
	Submit Credentials
	Account Page Should Be Open
	Close Message Window
	Admin LogOUT
	Close Browser

*** Keywords ***
Open Browser to Admin Page
	Open Browser		${ADMIN_URL}		${BROWSER}
	Maximize Browser Window
	Set Selenium Speed    ${DELAY}
	Wait Until Element Is Visible	//*[@id="username"]
Input Username
    
    Input Text    //*[@id="username"]    ${ADMIN_USER}

Input Password
    
    Input Text    //*[@id="login"]    ${ADMIN_PASS}
Submit Credentials
    Click Button    //*[@id="login-form"]/fieldset/div[3]/div[1]/button

Account Page Should Be Open 
    Title Should Be	Booking / Magento Admin ParkYourTruck
Close Message Window
	Wait Until Element Is Visible	//*[@id="html-body"]/div[4]/aside/div[2]/header/button
	Click Element			//*[@id="html-body"]/div[4]/aside/div[2]/header/button
Admin LogOUT
	Wait Until Element Is Visible	//*[@id="html-body"]/div[2]/header/div[2]/div[1]/a
	Click Element			//*[@id="html-body"]/div[2]/header/div[2]/div[1]/a
	Wait Until Element Is Visible	//*[@id="html-body"]/div[2]/header/div[2]/div[1]/ul/li[3]/a
	Click Element			//*[@id="html-body"]/div[2]/header/div[2]/div[1]/ul/li[3]/a
	Wait Until Element Is Visible	//*[@id="html-body"]/section/div/div/div/div	
	Title Should Be			Magento Admin ParkYourTruck




