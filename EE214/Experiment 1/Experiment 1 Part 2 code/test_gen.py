#Python code for TRACEFILE.txt generation for FULL-ADDER
#
#open/create TRACEFILE.txt in write mode
f = open("TRACEFILE.txt","w")
#number of inputs
input_len = 4
#number of outputs
output_len = 1
#number of test vectors
test_len = 2**input_len
#loop from 0 to (test_len-1)
for input_vec in range(test_len):
#convert input to binary(8bit) format
	input_str = "{:04b}".format(int(input_vec))
#extracting the input bits
	x1 = input_vec % 2 
	x2 = (input_vec % 4) // 2
	x3 = (input_vec % 8) // 4
	x4 = input_vec // 8

#generating the output
	if(input_vec<2):
		output = 0
	else:
		output = 1

	for i in range(2, input_vec):
		if(input_vec%i==0):
			output=0
#convert output to binary(5bit) format
	output_str = "{:01b}".format(int(output))
#write input and output test vector with 2bit mask in TRACEFILE.txt
	f.write(input_str + " " + output_str + " 1\n")
#close file
f.close() 