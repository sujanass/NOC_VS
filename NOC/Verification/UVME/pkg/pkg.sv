//`timescale 1ns/1ps

package pkg;

	import uvm_pkg::*;
	`include "uvm_macros.svh"

	`include"./../UVME/agent/M0_agent/M0_seq_item.sv"
	`include"./../UVME/agent/M0_agent/M0_sequencer.sv"
	`include"./../UVME/sequence/M0_seq.sv"

	`include"./../UVME/agent/M1_agent/M1_seq_item.sv"
	`include"./../UVME/agent/M1_agent/M1_sequencer.sv"
	`include"./../UVME/sequence/M1_seq.sv"

	`include"./../UVME/agent/S0_agent/S0_seq_item.sv"
	`include"./../UVME/agent/S0_agent/S0_sequencer.sv"
	`include"./../UVME/sequence/S0_seq.sv"

	`include"./../UVME/agent/S1_agent/S1_seq_item.sv"
	`include"./../UVME/agent/S1_agent/S1_sequencer.sv"
	`include"./../UVME/sequence/S1_seq.sv"

	`include"./../UVME/agent/S2_agent/S2_seq_item.sv"
	`include"./../UVME/agent/S2_agent/S2_sequencer.sv"
	`include"./../UVME/sequence/S2_seq.sv"

	`include"./../UVME/agent/S3_agent/S3_seq_item.sv"
	`include"./../UVME/agent/S3_agent/S3_sequencer.sv"
	`include"./../UVME/sequence/S3_seq.sv"

	`include"./../UVME/agent/S4_agent/S4_seq_item.sv"
	`include"./../UVME/agent/S4_agent/S4_sequencer.sv"
	`include"./../UVME/sequence/S4_seq.sv"

	`include"./../UVME/agent/S5_agent/S5_seq_item.sv"
	`include"./../UVME/agent/S5_agent/S5_sequencer.sv"
	`include"./../UVME/sequence/S5_seq.sv"


	`include"./../UVME/agent/Virtual_sequencer.sv"
	`include"./../UVME/sequence/Virtual_sequence.sv"


	`include"./../UVME/agent/M0_agent/M0_driver.sv"
	`include"./../UVME/agent/M0_agent/M0_monitor.sv"
	`include"./../UVME/agent/M0_agent/M0_agent.sv"

	`include"./../UVME/agent/M1_agent/M1_driver.sv"
	`include"./../UVME/agent/M1_agent/M1_monitor.sv"
	`include"./../UVME/agent/M1_agent/M1_agent.sv"

	`include"./../UVME/agent/S0_agent/S0_driver.sv"
	`include"./../UVME/agent/S0_agent/S0_monitor.sv"
	`include"./../UVME/agent/S0_agent/S0_agent.sv"

	`include"./../UVME/agent/S1_agent/S1_driver.sv"
	`include"./../UVME/agent/S1_agent/S1_monitor.sv"
	`include"./../UVME/agent/S1_agent/S1_agent.sv"

	`include"./../UVME/agent/S2_agent/S2_driver.sv"
	`include"./../UVME/agent/S2_agent/S2_monitor.sv"
	`include"./../UVME/agent/S2_agent/S2_agent.sv"
	
	`include"./../UVME/agent/S3_agent/S3_driver.sv"
	`include"./../UVME/agent/S3_agent/S3_monitor.sv"
	`include"./../UVME/agent/S3_agent/S3_agent.sv"

	`include"./../UVME/agent/S4_agent/S4_driver.sv"
	`include"./../UVME/agent/S4_agent/S4_monitor.sv"
	`include"./../UVME/agent/S4_agent/S4_agent.sv"
	
	`include"./../UVME/agent/S5_agent/S5_driver.sv"
	`include"./../UVME/agent/S5_agent/S5_monitor.sv"
	`include"./../UVME/agent/S5_agent/S5_agent.sv"

	`include"./../UVME/env/scoreboard.sv"
	`include"./../UVME/env/env.sv"

	`include"./../UVME/test/test.sv"
	`include"./../UVME/test/M0_S1_wtest.sv"

endpackage
