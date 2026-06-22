# ABAP VIP Passenger Transformer

## Overview
This project demonstrates modern ABAP programming techniques by transforming passenger data from one internal table to another without using `LOOP AT ... ENDLOOP`.

The solution uses:

- Internal Tables
- VALUE Expressions
- FOR Table Comprehensions
- WHERE Filtering
- COND Expressions

## Scenario

Given a passenger table containing:

- Name
- Miles Flown
- Membership Level

Create a new table containing an additional field:

- Reward Status

### Reward Status Rules

| Miles Flown | Reward Status |
|-------------|--------------|
| > 50000 | PLATINUM |
| > 10000 | GOLD |
| Otherwise | SILVER |

### Filter Condition

Only passengers with more than 1000 miles are included in the result table.

## Technologies Used

- ABAP
- Eclipse ADT
- Modern ABAP Syntax

## Learning Objectives

This project demonstrates:

- Data transformation using `VALUE #( FOR ... )`
- Conditional expressions using `COND`
- Inline filtering using `WHERE`
- Functional-style programming in ABAP
- Avoiding explicit loops with table comprehensions

## Example Input

| Name | Miles Flown | Membership |
|--------|------------|------------|
| Arshad | 60000 | VIP |
| John | 25000 | REG |
| David | 5000 | REG |
| Sam | 500 | NEW |

## Example Output

| Name | Miles Flown | Membership | Reward Status |
|--------|------------|------------|---------------|
| Arshad | 60000 | VIP | PLATINUM |
| John | 25000 | REG | GOLD |
| David | 5000 | REG | SILVER |
