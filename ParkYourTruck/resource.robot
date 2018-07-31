*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         www.park-your-truck.com
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     gdonev@ssidecisions.com
${VALID PASSWORD}    pass.1234
${HOME URL}      https://${SERVER}/
${LOGIN URL}    https://${SERVER}/falogin/account/login/
${ACCOUNT URL}	https://park-your-truck.com/ssi_forwarding_agency/account/
${CITY}		Munich
*** Keywords ***

Open Browser To Login Page
    Open Browser    ${HOME URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Wait until Element Is Visible	css=#gdprok
    Click Element			css=#gdprok
    Wait Until Element Is Visible	//a[@href="https://park-your-truck.com/falogin/account/login/"]
    Click Element	//a[@href="https://park-your-truck.com/falogin/account/login/"]
    Login Page Should Be Open

Login Page Should Be Open
	Title Should Be    Spedition ParkYourTruck

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    //*[@id="email"]    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    //*[@id="pass"]    ${password}

Submit Credentials
    Click Button    //*[@id="send2"]

Account Page Should Be Open
    Location Should Be	${ACCOUNT URL}
    Title Should Be	Mein Konto ParkYourTruck

Open Search Page
    Click Element	css=#ui-id-4
    Wait until Element Is Visible	css=input#city_or_parkarea
    Input Text				css=input#city_or_parkarea		${CITY}
    Click Element			css=#ssi-search-form-from
    Wait Until Element Is Visible	css=body > div:nth-child(5) > div.xdsoft_datepicker.active > div.xdsoft_calendar > table > tbody > tr:nth-child(5) > td.xdsoft_date.xdsoft_day_of_week6.xdsoft_date.xdsoft_weekend
    Click Element			css=body > div:nth-child(5) > div.xdsoft_datepicker.active > div.xdsoft_calendar > table > tbody > tr:nth-child(5) > td.xdsoft_date.xdsoft_day_of_week6.xdsoft_date.xdsoft_weekend
    Click Element			css=body > div:nth-child(5) > div.xdsoft_timepicker.active > div > div.xdsoft_time_variant > div:nth-child(15)
    
    Select From List By Index		css=#ssi-search-form > div:nth-child(4) > div > select		1
    Click Element			css=#ssi-search-form > div:nth-child(5) > div > button
    Title Should Be			Parkplatz buchen ParkYourTruck

Booking Page
    Wait Until Element Is Visible	css=.drivers-list
    Click Element			css=#maincontent > div.columns > div > div.ssi-search.col-xs-12 > div.ssi-searchpost.row > div.ssi-search-driverslist-wrap.col-m-2 > div > ul > li:nth-child(2)
    Click Element			css=#maincontent > div.columns > div > div.ssi-search.col-xs-12 > div.ssi-searchpost.row > div.ssi-search-vehicleslist-wrap.col-m-2 > div > ul > li:nth-child(2)
    Click Element		css=#maincontent > div.columns > div > div.ssi-search.col-xs-12 > div.ssi-searchpost.row > div.ssi-search-parkarea.col-m-8 > div.ssi-search-parkarealist-wrap.col-m-6 > div > ul > li:nth-child(1)
    Focus		css=#ssi-searchpost-form
    Click Element	css=#ssi-searchpost-form > ul > li:nth-child(7) > button
    Wait until Element Is Visible		css=#maincontent > div.page.messages > div:nth-child(2) > div > div > div		
    
LogOut
	Click Element	css = span.signin-logout>a
	Close Browser








