if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name wc\
   -timing\
    [list ${::IMEX::libVar}/mmmc/sclib_tsmc180_ss_nldm.lib\
    ${::IMEX::libVar}/mmmc/padlib_tsmc180_ss_nldm.lib\
    ${::IMEX::libVar}/mmmc/rfsphs8x8m1wm4_slow_syn.lib]
create_library_set -name bc\
   -timing\
    [list ${::IMEX::libVar}/mmmc/sclib_tsmc180_ff_nldm.lib\
    ${::IMEX::libVar}/mmmc/padlib_tsmc180_ff_nldm.lib\
    ${::IMEX::libVar}/mmmc/rfsphs8x8m1wm4_fast@-40C_syn.lib]
create_rc_corner -name wc\
   -cap_table ${::IMEX::libVar}/mmmc/t018lo_1p6m_typical.captable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0
create_rc_corner -name bc\
   -cap_table ${::IMEX::libVar}/mmmc/t018lo_1p6m_typical.captable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0
create_delay_corner -name wc\
   -library_set wc\
   -rc_corner wc
create_delay_corner -name bc\
   -library_set bc\
   -rc_corner bc
create_constraint_mode -name constraint\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/constraint/constraint.sdc]
create_analysis_view -name wc -constraint_mode constraint -delay_corner wc -latency_file ${::IMEX::dataVar}/mmmc/views/wc/latency.sdc
create_analysis_view -name bc -constraint_mode constraint -delay_corner bc -latency_file ${::IMEX::dataVar}/mmmc/views/bc/latency.sdc
set_analysis_view -setup [list wc] -hold [list bc]
