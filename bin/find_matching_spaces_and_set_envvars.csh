#!/bin/csh

# Get the path of the current repository and attempt to find matching
# repositories below the parent space
set current_repo="$PWD"
set full_match_code=`echo $current_repo | sed -E -e 's/\.(code|regression|example-testcases)/.code/'`
set full_match_examples=`echo $current_repo | sed -E -e 's/\.(code|regression|example-testcases)/.example-testcases/'`
set full_match_regression=`echo $current_repo | sed -E -e 's/\.(code|regression|example-testcases)/.regression/'`
set partial_match_code=`dirname $full_match_code`
set partial_match_examples=`dirname $full_match_examples`
set partial_match_regression=`dirname $full_match_regression`

if (-e $full_match_code ) then
    echo "Setting UB_CODE_PATH to: $full_match_code"
    setenv UB_CODE_PATH $full_match_code
else if (-e $partial_match_code ) then
    echo "Setting UB_CODE_PATH to: $partial_match_code"
    setenv UB_CODE_PATH "$partial_match_code"
else
    echo "No matching UB_CODE_PATH found; no environment variable set"
endif

if (-e $full_match_examples ) then
    echo "Setting UB_EXAMPLES_PATH to: $full_match_examples"
    setenv UB_EXAMPLES_PATH $full_match_examples
else if (-e $partial_match_examples ) then
    echo "Setting UB_EXAMPLES_PATH to: $partial_match_examples"
    setenv UB_EXAMPLES_PATH "$partial_match_examples"
endif

if (-e $full_match_regression ) then
    echo "Setting UB_REGRESSION_PATH to: $full_match_regression"
    setenv UB_REGRESSION_PATH $full_match_regression
else if (-e $partial_match_regression ) then
    echo "Setting UB_REGRESSION_PATH to: $partial_match_regression"
    setenv UB_REGRESSION_PATH "$partial_match_regression"
else
    echo "No matching UB_REGRESSION_PATH found; no environment variable set"
endif
