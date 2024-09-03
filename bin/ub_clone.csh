#!/bin/csh
if ( "$1" == "" ) then      # parentheses not strictly needed in this simple case
    set design="lsm"
else 
    set design=$1
endif
/usr/intel/pkgs/git/2.38.1/bin/git clone https://github.com/intel-innersource/applications.design-automation.dft.ultibuild.code.git
/usr/intel/pkgs/git/2.38.1/bin/git clone https://github.com/intel-innersource/applications.design-automation.dft.ultibuild.regression.git
setenv DEMO_CLONE_ROOT $PWD
source $DEMO_CLONE_ROOT/applications.design-automation.dft.ultibuild.code/dev/env/ultibuild_setup
unsetenv TESSENT_PLUGIN_PATH
dvt_ulti &
cd applications.design-automation.dft.ultibuild.regression/$design
setenv WORKAREA $PWD
/p/hdk/pu_tu/prd/liteinfra/1.11.SP1/commonFlow/bin/cth_psetup  -proj pesg/2020.09SP -force -read_only -cfg_ov $WORKAREA/local_cfg.cth
