transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Midsem/DUT.vhd}
vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Midsem/Gates.vhd}
vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Midsem/AND_4.vhd}
vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Midsem/Midsem.vhd}
vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Midsem/Full_Adder.vhd}
vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Midsem/Four_Bit_Adder.vhd}
vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Midsem/FourIPMUX.vhd}
vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Midsem/OR_4.vhd}

vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Midsem/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
