##########################################################################
#File Name:     rom2mem.py
#Description:   A script to convert "Kangaroo" ROM files to Verilog .mem
#               files. 
#                                        
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################

import sys
import numpy as np
from bitstring import BitArray

with open(sys.argv[1], "r") as fileIn:
    bitArray = BitArray(fileIn)
    fileOut = sys.argv[1] + ".mem"

    with open(fileOut, "x") as output:
        for x in range(0, len(bitArray.bin), 8):
            split = bitArray.bin[x:x+8]
            output.write(split)
            output.write("\n")

    print(fileOut + " Completed")

