*** Settings ***
Documentation     A test suite containing tests related to booking a parking spot.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

Resource          resource.robot

*** Test Cases ***
BookingPage
    Input Username    gdonev@ssidecisions.com
    Input Password    pass.1234
    Submit Credentials
    Account Page Should Be Open
    Open Search Page
    Booking Page
    LogOut

