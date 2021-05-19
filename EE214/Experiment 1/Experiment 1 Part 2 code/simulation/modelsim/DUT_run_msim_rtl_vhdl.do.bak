transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/iamprasann/Desktop/EE214/Lab4/Q2/Gates.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/EE214/Lab4/Q2/DUT.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/EE214/Lab4/Q2/OR_4.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/EE214/Lab4/Q2/Check_Prime.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/EE214/Lab4/Q2/AND_3.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/EE214/Lab4/Q2/Four_Bit_Adder.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/EE214/Lab4/Q2/FullAdder.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/EE214/Lab4/Q2/Add_Subtract_Primes.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/EE214/Lab4/Q2/FourMUX.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/EE214/Lab4/Q2/AND_4.vhd}
vcom -93 -work work {/home/iamprasann/Desktop/EE214/Lab4/Q2/TwosComp.vhd}

vcom -93 -work work {/home/iamprasann/Desktop/EE214/Lab4/Q2/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
