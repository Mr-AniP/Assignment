***********************************************************************************************************************************
Readme for VDF Assignment-2 (By Animesh Pareek (Btech 2021131))

Guide -> Prof. Sneh Saurabh (IIITD)

HOW TO RUN FROM SOURCE ??

[1st Part]

1) cd FSM
2) iverilog -Wall -o test fsm.v fsm_tb.v
3) vvp test
4) gtkwave fsm_sim.vcd
5) ** In the fsm_sim.vcd remove this line `$comment Show the parameter values. $end` ** 
6) covered score -t fsm_tb -v fsm_tb.v -v fsm.v -vcd fsm_sim.vcd -o fsm.cdd
7) covered report -d v fsm.cdd
8) yosys synth_script.ys

[2nd Part] ( cd .. )

1) cd Hot_Encodding_FSM
2) iverilog -Wall -o test fsm_hot.v fsm_tb.v
3) vvp test
4) gtkwave fsm_sim.vcd
5) ** In the fsm_sim.vcd remove this line `$comment Show the parameter values. $end` ** 
6) covered score -t fsm_tb -v fsm_tb.v -v fsm_hot.v -vcd fsm_sim.vcd -o fsm.cdd
7) covered report -d v fsm.cdd
8) yosys synth_script.ys

HOW TO SEE ALREADY RUN RESULTS ??

It is Simple man!! Refer to our report.pdf.


!! HAPPY VLSI !!

***********************************************************************************************************************************