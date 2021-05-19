transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {FourBitAdder.vho}

vcom -93 -work work {C:/Users/HOME/Desktop/SEM 4/EE214/Lab2/Testbench.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /dut_instance=FourBitAdder_vhd.sdo -L maxv -L gate_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
