             *** Settings ***
             
             Documentation	Tests to verify that the browser lunches
                  
             *** Test Cases ***
             
             Lunch Browser
             
                 Open Browser	https://www.google.com	ff

                 [Teardown]    Close Browser
