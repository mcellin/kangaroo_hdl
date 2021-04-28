# Verilog HDL of Atari Inc.'s Kangaroo
As part of my Final Year project in Electronics and Computer Engineering, I chose to implement a Logic Accurate Verilog HDL representation of the arcade game, Kangaroo by Atari Inc.




## Getting Started
These instructions will guide you on how to get this project up and running on your machine.



### Prerequisites
* **ModelSim - Intel FPGA Starter Edition 10.5b**, to run the simulation.

* **A copy of Atari Inc.'s Kangaroo game ROMs** OR from my research, this hardware may also support Sun Electronics' "Funky Fish", but I haven't tested it.

* **Python 3**, for converting the ROM dumped machine code to a text file of binary values that are interpretable by Verilog's `$readmemb` function, and if you desire, to generate images from the simulation's outputted *video_output.log*.

* __FFmpeg__, if you would like to create a video from the Python generated images.

  

### Run the Simulation

#### To Start

Having acquired the appropriate game ROMs, open the command line and call *rom2mem.py* in the *scripts* folder to convert each of the ROM dumps for use in the simulator. Then, store the resulting .mem files in the *rom* folder.

Example: `<project directory>\scripts\python rom2mem.py tvg_75.0`. This will return a *tvg_75.0.mem* file that is to be placed in the *rom* folder. Do this for each ROM dump.

The CRC for each ROM are listed below;

* tvg_75.0, CRC(0d18c581)

* tvg_76.1, CRC(5978d37a)

* tvg_77.2, CRC(522d1097) 

* tvg_78.3, CRC(063da970)

* tvg_79.4, CRC(9e5cf8ca) 

* tvg_80.5, CRC(2fc18049)

* tvg_81.8, CRC(fb449bfd)

* tvg_82.12, CRC(57766f69)

* tvg_83.v0, CRC(c0446ca6)

* tvg_85.v2, CRC(72c52695)

* tvg_84.v1, CRC(e4cb26c2)

* tvg_86.v3, CRC(9e6a599f)

* mb8841.ic29,  No dump for this ROM currently exists. See rtl\cpu_board\cpu_custom_microcomputer_dummy.sv for more information.

  

#### To Simulate

1. Open ModelSim and open the project file *Kangaroo.mpf*. 

2. When the project has loaded, open the *Project tab* and from the right click menu, highlight *Compile* and choose *Compile All*. 

3. Upon successful compilation, open the *Simulate* tab and click *Start Simulation*. When the pop up dialog box appears, click the *Libraries* tab and add the *altera* library. Then, return to the *Design* tab and open the *work* dropdown. Select *kangaroo_tb* and click *OK*.

4. When the simulation windows have finished loading, open the *Simulate* tab, highlight Run and click *Run -All*. This will run a 60 second game time simulation. 

   **Note:** On my machine, Intel Core i7 6700HQ @ 2.60GHz with 16GB RAM, using the free version of ModelSim, the simulation took circa. 24 hours to run. I ran a 60 second game time simulation as I was targeting to obtain enough video signal data to recreate Kangaroo's attract mode for demonstration purposes.

5. As can be seen in the *kangaroo_tb* testbench, this simulation will, on the positive edge of each KOS1 (pixel clock) signal, append the Red, Green, Blue, H-Sync and V-Sync signals to a *video_output.log*. 



#### To Generate Frame by Frame Images

The resulting *video_output.log* data can then be converted to a series of frame by frame images by calling *csv2img.py* in the *scripts* folder from the command line.

Example: `<project directory>\scripts\python csv2img.py .\video_output.log`.



#### To Create a Video from the Frame by Frame Images

From the command line, you can then use FFmpeg to concatenate each of the frames to return a video of the simulation output.

Example: `ffmpeg -framerate 60.10 -i '<project directory>\scripts\%d.png' -c:v libx264 -pix_fmt yuv420p -crf 0 Kangaroo.mp4`



## Acknowledgments

I would to thank Gordon Devic and lvd2 for their work on their hardware accurate cores, which supported this project.

Gordon Devic - *Z80 CPU Core* (GPL 2.0) - https://github.com/gdevic/A-Z80

lvd2 - *AY-3-8910 Core* (GPL 3.0) - https://github.com/lvd2/ay-3-8910_reverse_engineered



## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

