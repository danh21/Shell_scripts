#!/bin/bash
# Test script

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPT="$SCRIPT_DIR/../basic/numOfDigits.sh"
PASS=0
FAIL=0

run_test() {
    input="$1"
    expected="$2"

    # Chạy script và truyền input (2 số cách nhau newline)
    output=$(echo -e "$input" | bash "$SCRIPT" 2>&1)

    if [ "$output" = "$expected" ]; then
        echo "✅ Test with input '$input' => PASS"
        ((PASS++))
    else
        echo "❌ Test with input '$input' => FAIL"
        echo "   Expected: '$expected'"
        echo "   Actual: '$output'"
        ((FAIL++))
    fi
}

# --- Test cases ---
run_test "234" "Enter the value of n
The number of digits is 3"
run_test "002" "Enter the value of n
The number of digits is 1"
run_test "-234567" "Enter the value of n
The number of digits is 6"

# --- Summary ---
echo
echo "✅ Passed: $PASS"
echo "❌ Failed: $FAIL"

if [ $FAIL -eq 0 ]; then
    echo "🎉 All tests passed!"
else
    echo "⚠️ Some tests failed."
fi
