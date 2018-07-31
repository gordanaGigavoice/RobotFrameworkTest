*** Settings ***
Documentation     A test suite with a single test for valid search.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Search
    
    Open Browser To Login Page
    Input Username    gdonev@ssidecisions.com
    Input Password    pass.1234
    Submit Credentials
    Account Page Should Be Open
    Open Search Page
    [Teardown]    Close Browser
