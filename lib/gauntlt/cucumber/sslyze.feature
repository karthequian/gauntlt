Feature: Run sslyze against a target and pass teh value of the hostname from the profile.xml.

Background:
  Given sslyze is installed

Scenario: Make sure that the server does not have any anonymous certificates
  Given the target hostname is "google.com"
  When I run sslyze against the hostname
  Then the output should not contain:
    """
    Anon
    """

Scenario: Make sure that the certificate key size is at least 2048
  Given the target hostname is "google.com"
  When I run sslyze against the hostname
  Then the key size should be at least 2048
