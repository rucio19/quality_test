Feature: Transaction limits

Background:
    Given USD currency
    And Money amount
    And Destination identifier

    Scenario: Less than 10k USD as maximum
        Given 10_000 as amount
        And 'C' identifier

        When Execute transfer

        Then Amount transfer successful
        And Send payment slip

    Scenario: Make a transaction equal or bigger than 10k USD
        Given 50_000 as amount
        And 'B' identifier

        When Execute transfer

        Then Amount transfer successful
        And Send payment slip

    Scenario: Transaction with amount exceed
        Given 100_001 as amount
        And 'B' identifier

        When Execute transfer

        Then Amount transfer rejected
        And Send a deny log

    Scenario: Transfer amount bigger than 100k USD
        Given 150_000 as amount
        And 'A' identifier

        When Execute transfer

        Then Amount transfer successful
        And Send payment slip