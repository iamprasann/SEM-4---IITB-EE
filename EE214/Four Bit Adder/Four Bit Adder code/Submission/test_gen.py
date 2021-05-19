#Python code for TRACEFILE.txt generation for FULL-ADDER
#
#open/create TRACEFILE.txt in write mode
f = open("TRACEFILE.txt","w")
#number of inputs
input_len = 8
#number of outputs
output_len = 5
#number of test vectors
test_len = 2**input_len
#loop from 0 to (test_len-1)
for input_vec in range(test_len):
#convert input to binary(8bit) format
	input_str = "{:08b}".format(int(input_vec))
#extracting the input bits
	a0 = input_vec % 2 
	a1 = (input_vec % 4) // 2
	a2 = (input_vec % 8) // 4
	a3 = (input_vec % 16) // 8
	b0 = (input_vec % 32) // 16
	b1 = (input_vec % 64) // 32
	b2 = (input_vec % 128) // 64
	b3 = input_vec // 128

#generating the output
	output = a0 + b0 + 2*(a1 + b1) + 4*(a2 + b2) + 8*(a3 + b3)
#convert output to binary(5bit) format
	output_str = "{:05b}".format(int(output))
#write input and output test vector with 2bit mask in TRACEFILE.txt
	f.write(input_str + " " + output_str + " 11111\n")
#close file
f.close() 
