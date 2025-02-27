# Take initial snapshot of the operational state of the device
# and save the output to a file

*** Settings ***
# Importing test libraries, resource files and variable files.
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot


*** Variables ***
# Define the pyATS testbed file to use for this run

${testbed}     ../../../testbed/testbed.yaml

*** Test Cases ***
# Creating test cases from available keywords.

Connect
    # Initializes the pyATS/Genie Testbed
    use genie testbed "${testbed}"

    # Connect to both device
    connect to device "internet-rtr01"

Profile the devices
    Profile the system for "config;interface;platform;ospf;arp;routing;vrf;vlan" on devices "internet-rtr01" as "./new_snapshot"

Compare snapshots
    Compare profile "./good_snapshot" with "./new_snapshot" on devices "internet-rtr01"
