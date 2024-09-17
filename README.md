# Lean Mathematical Functions and Type Implementations

This Lean project contains solutions for various programming exercises, including:

- Implementation of the Collatz Conjecture
- Boolean operations (negation and NAND)
- Date and time-related functions:
  - Months of the year
  - Days in a month (including leap year calculations)
  - Seasons
- Custom types for representing days and seasons

## Author

Rodolfo Lopez

## Date

Fall 2022

## Installation

To run this project, you need to install Lean. The recommended way is to use elan, the Lean version manager:

1. Install elan:

   - On Unix-like systems (Linux, macOS):
     ```
     curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh
     ```
   - On Windows:
     ```
     curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.ps1 -sSf | powershell -c -
     ```

2. Restart your terminal or run `source ~/.profile` (or equivalent for your shell).

3. Install Lean:

   ```
   elan install leanprover/lean4:stable
   ```

4. Verify the installation:
   ```
   lean --version
   ```

For more detailed instructions, visit the [Lean website](https://leanprover.github.io/lean4/doc/setup.html).

## Usage

Open the `hw1.lean` file in a Lean-compatible editor to view and evaluate the code.

## File Structure

- `hw1.lean`: Contains all the implementations and test cases

To test functions, use the `#eval` command in Lean, as demonstrated in the `hw1.lean` file.

## Key Functions

- `collatz`: Implements one step of the Collatz Conjecture
- `neg`: Boolean negation
- `nand`: Boolean NAND operation
- `days_in_month`: Calculates days in a given month
- `improved_days_in_month`: Calculates days in a month, accounting for leap years
- `get_season`: Determines the season for a given day of the year

## Custom Types

- `month`: Enumerated type for months of the year
- `day`: Represents individual days of the year
- `season`: Represents the four seasons
