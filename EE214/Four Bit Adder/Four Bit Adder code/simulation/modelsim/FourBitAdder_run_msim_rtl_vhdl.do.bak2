transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Lab2/Gates.vhd}
vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Lab2/DUT.vhd}
vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Lab2/FullAdder.vhd}
vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Lab2/FourBitAdder.vhd}

vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Lab2/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
