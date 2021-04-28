##########################################################################
#File Name:     csv2img.py
#Description:   A script to convert ModelSim's "Kangaroo" Video Signal 
#               output csv file to a series of images.
#                                        
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################

from PIL import Image
import sys
import csv

pixel_colour = [(255,0,0,255),(0,255,0,255),(0,0,255,255),(0,0,0,255)]
c = 0;
last_vsync = 1;
frame_counter = 0;


#------------------------------------------------------------------------#
#---------------- Count the number of frames in the file ----------------#
#------------------------------------------------------------------------#
with open(sys.argv[1], "r") as video_output:
	video_reader = csv.reader(video_output)
	for row in video_reader:
		try:
			#Check for a rising edge on vsync
			current_vsync = int(row[4])
			if last_vsync == 0 and current_vsync == 1:
				#New frame, increment frame counter
				frame_counter = frame_counter + 1
		
			#Set current vsync to last vsync for next check
			last_vsync = current_vsync
		except:
			print("Error reading a line in the file!")

#As the last frame will be incomplete it is removed
frame_counter = frame_counter - 1

#Print the number of frames found
print("Frames found: ",frame_counter)


#------------------------------------------------------------------------#
#------------- Construct each frame and save it as an image -------------#
#------------------------------------------------------------------------#
#Initialise
row_position = 0;
column_position = 0;
last_vsync = 1;
last_hsync = 1;
current_frame = 0;

#Create a frame to store the image
#  320 Pixel Clocks per Horizontal Sync
#  260 Horizontal Syncs per Vertical Sync
frame = Image.new("RGB", (320, 260), color = "black")

with open(sys.argv[1], 'r') as video_output:
	video_reader = csv.reader(video_output)
	for row in video_reader:

		red = 255 if int(row[0]) else 0 
		green = 255 if int(row[1]) else 0 
		blue = 255 if int(row[2]) else 0 
		current_hsync = int(row[3])
		current_vsync = int(row[4])

		#Check for a rising edge on vsync
		if last_vsync == 0 and current_vsync == 1:
			#New frame, increment frame counter
			current_frame = current_frame + 1
		
		#If the first vsync edge is found, draw all of the complete frames
		if current_frame > 0:
			#Check for a rising edge on vsync
			if last_vsync == 0 and current_vsync == 1:
				#Start of a new frame, reset Y axis counter
				row_position = 0

				#Manipulate and save the frame
				#Resize Frame 
				scaled_frame = frame.resize((640, 520),Image.NEAREST)
				#Rotate Frame
				output_frame = scaled_frame.rotate(90, expand=True)
				#Save Frame
				output_frame.save("%d.png" % current_frame)

				#Reset frame for next iteration
				frame = Image.new("RGB", (320, 260), color = "black")
			
			#Check for a rising edge on hsync
			if last_hsync == 0 and current_hsync == 1:
				#Start of a new line, reset X axis counter
				column_position = 0
				
				#Increment Y axis counter
				row_position = row_position + 1

			#Draw pixel in position
			frame.putpixel((column_position - 1, row_position - 1), (red, green, blue, 255))
			
			#Increment X axis counter
			column_position = column_position + 1
		
		#Set current hsync/vsync to last hsync/vsync for next check
		last_hsync = current_hsync
		last_vsync = current_vsync
