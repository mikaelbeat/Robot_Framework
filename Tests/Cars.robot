*** Settings ***
Documentation  Demonstrate a need for data-driven testing
Resource  ../Resources/Cars/Data/InputData.robot
Resource  ../Resources/Cars/Common.robot
Resource  ../Resources/Cars/CarsApp.robot
Resource  ../Resources/Cars/DataManager.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d results tests/Cars.robot

*** Variables ***

*** Test Cases ***
Should see correct error messages with invalid logins
    ${InvalidLoginScenarios} =  DataManager.Get CSV Data  ${INVALID_CREDENTIALS_PATH_CSV}
    CarsApp.Login with Many Invalid Credentials  ${InvalidLoginScenarios}
