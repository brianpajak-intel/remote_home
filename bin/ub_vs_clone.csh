#!/bin/csh
if ( "$1" == "" ) then      # parentheses not strictly needed in this simple case
    set design="lsm"
else 
    set design="$1"
endif
set RED='\033[0;31m'
set NOCOLOR='\033[0m'
setenv CLONEROOT $PWD
echo "${RED}UltiBuild VSCode clone area: $PWD ${NOCOLOR}"
echo "${RED}Cloning UltiBuild code repository${NOCOLOR}"
/usr/intel/pkgs/git/2.38.1/bin/git clone https://github.com/intel-innersource/applications.design-automation.dft.ultibuild.code.git
echo "${RED}Cloning UltiBuild regression repository${NOCOLOR}"
/usr/intel/pkgs/git/2.38.1/bin/git clone https://github.com/intel-innersource/applications.design-automation.dft.ultibuild.regression.git
#echo "${RED}Cloning UltiBuild examples repository${NOCOLOR}"
#/usr/intel/pkgs/git/2.38.1/bin/git clone https://github.com/intel-innersource/applications.design-automation.dft.ultibuild.example-testcases.git
set ub_code_path="$PWD/applications.design-automation.dft.ultibuild.code"
echo "${RED}Setting UB_CODE_PATH: $ub_code_path ${NOCOLOR}"
setenv UB_CODE_PATH $ub_code_path
echo "${RED}Unsetting TESSENT_PLUGIN_PATH environment variable${NOCOLOR}"
unsetenv TESSENT_PLUGIN_PATH
cd applications.design-automation.dft.ultibuild.regression/$design
setenv WORKAREA $PWD
echo "${RED}Setting WORKAREA: $WORKAREA ${NOCOLOR}"
cd $CLONEROOT
echo "${RED}Creating VSCode setup file: vscode.setup${NOCOLOR}"
touch vscode.setup
chmod +x vscode.setup
echo "setenv CLONEROOT $CLONEROOT" >> vscode.setup
echo "setenv UB_CODE_PATH $ub_code_path" >> vscode.setup
echo "setenv WORKAREA $WORKAREA" >> vscode.setup
echo "setenv UB_REGRESSION_PATH $WORKAREA/applications.design-automation.dft.ultibuild.regression" >> vscode.setup
#echo "setenv UB_EXAMPLES_PATH $WORKAREA/applications.design-automation.dft.ultibuild.example-testcases" >> vscode.setup
echo "cd $WORKAREA" >> vscode.setup
echo "/p/hdk/pu_tu/prd/liteinfra/1.13.p03/commonFlow/bin/cth_psetup -proj dteg/latest -cfg dteg_fe.cth -force -read_only -ward $WORKAREA" >> vscode.setup
cd $WORKAREA
echo "${RED}Setting up Cheetah environment $WORKAREA ${NOCOLOR}"
#/p/hdk/pu_tu/prd/liteinfra/1.11.SP1/commonFlow/bin/cth_psetup  -proj pesg/2020.09SP -force -read_only -cfg_ov $WORKAREA/local_cfg.cth
/p/hdk/pu_tu/prd/liteinfra/1.13.p03/commonFlow/bin/cth_psetup -proj dteg/latest -cfg dteg_fe.cth -force -read_only -ward $WORKAREA
