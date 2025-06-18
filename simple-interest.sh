
```bash
#!/bin/bash

# Simple Interest Calculator
# Formula: Simple Interest = (Principal * Rate * Time) / 100

echo "================================="
echo "   Simple Interest Calculator"
echo "================================="
echo

# Function to validate numeric input
validate_number() {
    local input=$1
    if [[ $input =~ ^[0-9]+\.?[0-9]*$ ]]; then
        return 0
    else
        return 1
    fi
}

# Get principal amount
while true; do
    echo -n "Enter the principal amount: $"
    read principal
    if validate_number "$principal" && (( $(echo "$principal > 0" | bc -l) )); then
        break
    else
        echo "Error: Please enter a valid positive number for principal amount."
    fi
done

# Get rate of interest
while true; do
    echo -n "Enter the annual rate of interest (%): "
    read rate
    if validate_number "$rate" && (( $(echo "$rate >= 0" | bc -l) )); then
        break
    else
        echo "Error: Please enter a valid non-negative number for interest rate."
    fi
done

# Get time period
while true; do
    echo -n "Enter the time period (years): "
    read time
    if validate_number "$time" && (( $(echo "$time > 0" | bc -l) )); then
        break
    else
        echo "Error: Please enter a valid positive number for time period."
    fi
done

# Calculate simple interest
simple_interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

echo
echo "================================="
echo "           RESULTS"
echo "================================="
echo "Principal Amount: \$$principal"
echo "Rate of Interest: $rate% per annum"
echo "Time Period: $time years"
echo "Simple Interest: \$$simple_interest"
echo "Total Amount: \$$total_amount"
echo "================================="
echo
echo "Thank you for using our Simple Interest Calculator!"
echo "This tool helps support micro-finance initiatives."
