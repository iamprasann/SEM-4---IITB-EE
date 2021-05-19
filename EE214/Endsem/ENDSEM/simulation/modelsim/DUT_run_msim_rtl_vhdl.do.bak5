transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/iamprasann/Desktop/ENDSEM/DUT.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/ENDSEM/Gates.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/ENDSEM/D_FF.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/ENDSEM/AND_3.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/ENDSEM/AND_4.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/ENDSEM/OR_5.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/ENDSEM/AND_5.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/ENDSEM/Sequence.vhd}

vcom -93 -work work {/home/iamprasann/Desktop/ENDSEM/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
