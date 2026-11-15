*** Settings ***
Resource  resource.robot
Test Setup  Input New Command And Create User

*** Test Cases ***
Register With Valid Username And Password
    Input Credentials  uusi  salasana123
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Input Credentials  kalle  salasana123
    Output Should Contain  User with username kalle already exists

Register With Too Short Username And Valid Password
    Input Credentials  ab  salasana123
    Output Should Contain  Username must be at least 3 characters long

Register With Enough Long But Invalid Username And Valid Password
    Input Credentials  Kalle  salasana123
    Output Should Contain  Username can only contain lowercase letters

Register With Valid Username And Too Short Password
    Input Credentials  uusi  lyhyt1
    Output Should Contain  Password must be at least 8 characters long

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  uusi  salasanapitka
    Output Should Contain  Password must contain at least one number or special character

*** Keywords ***
Input New Command And Create User
    Create User  kalle  kalle123
    Input New Command

