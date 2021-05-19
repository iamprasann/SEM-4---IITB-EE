#Python code for TRACEFILE.txt generation for FULL-ADDER
#
#open/create TRACEFILE.txt in write mode
f = open("TRACEFILE.txt","w")
#number of inputs
input_len = 8
#number of outputs
output_len = 4
#number of test vectors
test_len = 2**input_len
#loop from 0 to (test_len-1)
for input_vec in range(test_len):
#convert input to binary(8bit) format
	input_str = "{:08b}".format(int(input_vec))
#extracting the input bits
	x0 = input_vec % 2 
	x1 = (input_vec % 4) // 2
	x2 = (input_vec % 8) // 4
	x3 = (input_vec % 16) // 8
	x4 = (input_vec % 32) // 16
	x5 = (input_vec % 64) // 32
	x6 = (input_vec % 128) // 64
	x7 = input_vec // 128

#generating the output
	output = x0+x1+x2+x3+x4+x5+x6+x7
#convert output to binary(5bit) format
	output_str = "{:04b}".format(int(output))
#write input and output test vector with 2bit mask in TRACEFILE.txt
	f.write(input_str + " " + output_str + " 1111\n")
#close file
f.close() 
