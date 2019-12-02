#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Mon Dec  2 14:19:20 2019                
#                                                     
#######################################################

#@(#)CDS: Innovus v17.11-s080_1 (64bit) 08/04/2017 11:13 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 17.11-s080_1 NR170721-2155/17_11-UB (database version 2.30, 390.7.1) {superthreading v1.44}
#@(#)CDS: AAE 17.11-s034 (64bit) 08/04/2017 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 17.11-s053_1 () Aug  1 2017 23:31:41 ( )
#@(#)CDS: SYNTECH 17.11-s012_1 () Jul 21 2017 02:29:12 ( )
#@(#)CDS: CPE v17.11-s095
#@(#)CDS: IQRC/TQRC 16.1.1-s215 (64bit) Thu Jul  6 20:18:10 PDT 2017 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set init_gnd_net VSS
set init_pwr_net VDD
set init_top_cell core_top_pads
set init_verilog HDL/GATE/Core_mapped.v
create_constraint_mode -name constraint -sdc_files {SDC/Core_mapped.sdc}
set init_lef_file {/research/ece/lnis-teaching/Designkits/tsmc180nm/full_custom_lib/lef/tech.lef /research/ece/lnis-teaching/Designkits/tsmc180nm/full_custom_lib/lef/sclib_tsmc180.lef /research/ece/lnis-teaching/Designkits/tsmc180nm/full_custom_lib/lef/padlib_tsmc180.lef /research/ece/lnis-teaching/Designkits/tsmc180nm/arm_ip/rf8x8/rfsphs8x8m1wm4.vclef}
set init_mmmc_file CONF/core.view
init_design
