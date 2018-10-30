/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    output reg spi_miso,
    output reg [3:0] spi_channel,
    output reg avr_rx,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel
  );
  
  
  
  reg rst;
  
  wire [16-1:0] M_alu_out;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_1 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  localparam IDLE_state = 6'd0;
  localparam INPUTA_state = 6'd1;
  localparam INPUTB_state = 6'd2;
  localparam CALCULATE_state = 6'd3;
  localparam AUTO_state = 6'd4;
  localparam TESTADDER1_state = 6'd5;
  localparam TESTADDER2_state = 6'd6;
  localparam TESTADDER3_state = 6'd7;
  localparam TESTADDER4_state = 6'd8;
  localparam TESTADDER5_state = 6'd9;
  localparam TESTADDER6_state = 6'd10;
  localparam TESTADDER7_state = 6'd11;
  localparam TESTADDER8_state = 6'd12;
  localparam TESTADDER9_state = 6'd13;
  localparam TESTBOOL1_state = 6'd14;
  localparam TESTBOOL2_state = 6'd15;
  localparam TESTBOOL3_state = 6'd16;
  localparam TESTBOOL4_state = 6'd17;
  localparam TESTBOOL5_state = 6'd18;
  localparam TESTBOOL6_state = 6'd19;
  localparam TESTBOOL7_state = 6'd20;
  localparam TESTBOOL8_state = 6'd21;
  localparam TESTBOOL9_state = 6'd22;
  localparam TESTSHIFT1_state = 6'd23;
  localparam TESTSHIFT2_state = 6'd24;
  localparam TESTSHIFT3_state = 6'd25;
  localparam TESTSHIFT4_state = 6'd26;
  localparam TESTSHIFT5_state = 6'd27;
  localparam TESTSHIFT6_state = 6'd28;
  localparam TESTSHIFT7_state = 6'd29;
  localparam TESTSHIFT8_state = 6'd30;
  localparam TESTSHIFT9_state = 6'd31;
  localparam TESTCMP1_state = 6'd32;
  localparam TESTCMP2_state = 6'd33;
  localparam TESTCMP3_state = 6'd34;
  localparam TESTCMP4_state = 6'd35;
  localparam TESTCMP5_state = 6'd36;
  localparam TESTCMP6_state = 6'd37;
  localparam TESTCMP7_state = 6'd38;
  localparam TESTCMP8_state = 6'd39;
  localparam TESTCMP9_state = 6'd40;
  localparam PASS_state = 6'd41;
  localparam FAIL_state = 6'd42;
  
  reg [5:0] M_state_d, M_state_q = IDLE_state;
  reg [15:0] M_inp_a_d, M_inp_a_q = 1'h0;
  reg [15:0] M_inp_b_d, M_inp_b_q = 1'h0;
  wire [3-1:0] M_ctr_value;
  counter_3 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [32-1:0] M_seg_values;
  multi_seven_seg_4 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  reg [26:0] M_counter_d, M_counter_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    M_inp_a_d = M_inp_a_q;
    M_inp_b_d = M_inp_b_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    io_led[16+0+5-:6] = io_dip[16+0+5-:6];
    M_alu_a = 1'h0;
    M_alu_b = 1'h0;
    M_alu_alufn = 1'h0;
    M_seg_values = 32'h00000000;
    
    case (M_state_q)
      IDLE_state: begin
        M_seg_values = 32'h08040905;
        if (io_button[0+0-:1] == 1'h1) begin
          M_state_d = INPUTA_state;
        end
      end
      INPUTA_state: begin
        M_seg_values = 32'h080a0c01;
        io_led[8+0+7-:8] = io_dip[8+7-:8];
        io_led[0+0+7-:8] = io_dip[0+7-:8];
        M_inp_a_d = {io_dip[8+0+7-:8], io_dip[0+0+7-:8]};
        if (io_button[2+0-:1] == 1'h1) begin
          M_state_d = INPUTB_state;
        end else begin
          if (io_button[3+0-:1] == 1'h1) begin
            M_state_d = IDLE_state;
          end
        end
      end
      INPUTB_state: begin
        M_seg_values = 32'h080a0c02;
        io_led[8+0+7-:8] = io_dip[8+7-:8];
        io_led[0+0+7-:8] = io_dip[0+7-:8];
        M_inp_b_d = {io_dip[8+0+7-:8], io_dip[0+0+7-:8]};
        if (io_button[1+0-:1] == 1'h1) begin
          M_state_d = CALCULATE_state;
        end else begin
          if (io_button[3+0-:1] == 1'h1) begin
            M_state_d = IDLE_state;
          end
        end
      end
      CALCULATE_state: begin
        M_seg_values = 32'h03010903;
        M_alu_a = M_inp_a_q;
        M_alu_b = M_inp_b_q;
        M_alu_alufn = io_dip[16+0+5-:6];
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        if (io_button[3+0-:1] == 1'h1) begin
          M_state_d = IDLE_state;
        end
      end
      AUTO_state: begin
        M_seg_values = 32'h010f0e10;
      end
      TESTADDER1_state: begin
        M_seg_values = 32'h01040411;
        M_alu_a = 16'h1555;
        M_alu_b = 16'h2aab;
        M_alu_alufn = 6'h00;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTADDER2_state: begin
        M_seg_values = 32'h01040412;
        M_alu_a = 16'h9545;
        M_alu_b = 16'h1eaf;
        M_alu_alufn = 6'h00;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTADDER3_state: begin
        M_seg_values = 32'h01040413;
        M_alu_a = 16'hf0e0;
        M_alu_b = 16'h0f20;
        M_alu_alufn = 6'h00;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTADDER4_state: begin
        M_seg_values = 32'h150f0211;
        M_alu_a = 16'hf0e0;
        M_alu_b = 16'h0020;
        M_alu_alufn = 6'h01;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTADDER5_state: begin
        M_seg_values = 32'h150f0212;
        M_alu_a = 16'h1e7f;
        M_alu_b = 16'h0555;
        M_alu_alufn = 6'h01;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTADDER6_state: begin
        M_seg_values = 32'h150f0213;
        M_alu_a = 16'h8000;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h01;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTADDER7_state: begin
        M_seg_values = 32'h0a0f0911;
        M_alu_a = 16'h0000;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h02;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTADDER8_state: begin
        M_seg_values = 32'h0a0f0912;
        M_alu_a = 16'h0002;
        M_alu_b = 16'h0009;
        M_alu_alufn = 6'h02;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTADDER9_state: begin
        M_seg_values = 32'h0a0f0913;
        M_alu_a = 16'h01c0;
        M_alu_b = 16'h0007;
        M_alu_alufn = 6'h02;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTBOOL1_state: begin
        M_seg_values = 32'h010a0411;
        M_alu_a = 16'h1555;
        M_alu_b = 16'h2aab;
        M_alu_alufn = 6'h10;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTBOOL2_state: begin
        M_seg_values = 32'h010a0412;
        M_alu_a = 16'h9545;
        M_alu_b = 16'ha557;
        M_alu_alufn = 6'h10;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTBOOL3_state: begin
        M_seg_values = 32'h010a0413;
        M_alu_a = 16'hf0e0;
        M_alu_b = 16'h0fe5;
        M_alu_alufn = 6'h10;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTBOOL4_state: begin
        M_seg_values = 32'h00160d11;
        M_alu_a = 16'h1555;
        M_alu_b = 16'h2aab;
        M_alu_alufn = 6'h1e;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTBOOL5_state: begin
        M_seg_values = 32'h00160d12;
        M_alu_a = 16'h9545;
        M_alu_b = 16'ha557;
        M_alu_alufn = 6'h1e;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTBOOL6_state: begin
        M_seg_values = 32'h00160d13;
        M_alu_a = 16'hf0e0;
        M_alu_b = 16'h0fe5;
        M_alu_alufn = 6'h1e;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTBOOL7_state: begin
        M_seg_values = 32'h07160d11;
        M_alu_a = 16'h1555;
        M_alu_b = 16'h2aab;
        M_alu_alufn = 6'h16;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTBOOL8_state: begin
        M_seg_values = 32'h07160d12;
        M_alu_a = 16'h9545;
        M_alu_b = 16'ha557;
        M_alu_alufn = 6'h16;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTBOOL9_state: begin
        M_seg_values = 32'h07160d13;
        M_alu_a = 16'hf0e0;
        M_alu_b = 16'h0fe5;
        M_alu_alufn = 6'h16;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT1_state: begin
        M_seg_values = 32'h15070911;
        M_alu_a = 16'h1555;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h20;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT2_state: begin
        M_seg_values = 32'h15070912;
        M_alu_a = 16'h9545;
        M_alu_b = 16'h000f;
        M_alu_alufn = 6'h20;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT3_state: begin
        M_seg_values = 32'h15070913;
        M_alu_a = 16'hf0e0;
        M_alu_b = 16'h0f25;
        M_alu_alufn = 6'h20;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT4_state: begin
        M_seg_values = 32'h15070d11;
        M_alu_a = 16'h1555;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h21;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT5_state: begin
        M_seg_values = 32'h15070d12;
        M_alu_a = 16'h9545;
        M_alu_b = 16'h000f;
        M_alu_alufn = 6'h21;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT6_state: begin
        M_seg_values = 32'h15070d13;
        M_alu_a = 16'hf0e0;
        M_alu_b = 16'h0f25;
        M_alu_alufn = 6'h21;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT7_state: begin
        M_seg_values = 32'h150d0111;
        M_alu_a = 16'h1555;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h23;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT8_state: begin
        M_seg_values = 32'h150d0112;
        M_alu_a = 16'h9545;
        M_alu_b = 16'h000f;
        M_alu_alufn = 6'h23;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT9_state: begin
        M_seg_values = 32'h150d0113;
        M_alu_a = 16'hf0e0;
        M_alu_b = 16'h0f25;
        M_alu_alufn = 6'h23;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTCMP1_state: begin
        M_seg_values = 32'h03050b11;
        M_alu_a = 16'h1555;
        M_alu_b = 16'h2aab;
        M_alu_alufn = 6'h33;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTCMP2_state: begin
        M_seg_values = 32'h03050b12;
        M_alu_a = 16'h9545;
        M_alu_b = 16'h1eaf;
        M_alu_alufn = 6'h33;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTCMP3_state: begin
        M_seg_values = 32'h03050b13;
        M_alu_a = 16'hf0e0;
        M_alu_b = 16'hf0e0;
        M_alu_alufn = 6'h33;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTCMP4_state: begin
        M_seg_values = 32'h03090e11;
        M_alu_a = 16'h1555;
        M_alu_b = 16'h2aab;
        M_alu_alufn = 6'h35;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTCMP5_state: begin
        M_seg_values = 32'h03090e12;
        M_alu_a = 16'h9545;
        M_alu_b = 16'h1eaf;
        M_alu_alufn = 6'h35;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTCMP6_state: begin
        M_seg_values = 32'h03090e13;
        M_alu_a = 16'hf0e0;
        M_alu_b = 16'hf0e0;
        M_alu_alufn = 6'h35;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTCMP7_state: begin
        M_seg_values = 32'h03090511;
        M_alu_a = 16'h1555;
        M_alu_b = 16'h2aab;
        M_alu_alufn = 6'h37;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTCMP8_state: begin
        M_seg_values = 32'h03090512;
        M_alu_a = 16'h9545;
        M_alu_b = 16'h1eaf;
        M_alu_alufn = 6'h37;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTCMP9_state: begin
        M_seg_values = 32'h03090513;
        M_alu_a = 16'hf0e0;
        M_alu_b = 16'hf0e0;
        M_alu_alufn = 6'h37;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      PASS_state: begin
        M_seg_values = 32'h0c011515;
      end
      FAIL_state: begin
        M_seg_values = 32'h06010809;
      end
    endcase
    if (M_counter_q[0+26-:27] == 1'h0) begin
      
      case (M_state_q)
        IDLE_state: begin
          if (io_button[4+0-:1] == 1'h1) begin
            M_state_d = AUTO_state;
          end
        end
        AUTO_state: begin
          M_state_d = TESTADDER1_state;
        end
        TESTADDER1_state: begin
          if (M_alu_out == 16'h4000) begin
            M_state_d = TESTADDER2_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTADDER2_state: begin
          if (M_alu_out == 16'hb3f4) begin
            M_state_d = TESTADDER3_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTADDER3_state: begin
          if (M_alu_out == 16'h8000) begin
            M_state_d = TESTADDER4_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTADDER4_state: begin
          if (M_alu_out == 16'hf0c0) begin
            M_state_d = TESTADDER5_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTADDER5_state: begin
          if (M_alu_out == 16'h192a) begin
            M_state_d = TESTADDER6_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTADDER6_state: begin
          if (M_alu_out == 16'hffff) begin
            M_state_d = TESTADDER7_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTADDER7_state: begin
          if (M_alu_out == 16'h0000) begin
            M_state_d = TESTADDER8_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTADDER8_state: begin
          if (M_alu_out == 16'h0012) begin
            M_state_d = TESTADDER9_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTADDER9_state: begin
          if (M_alu_out == 16'h0c40) begin
            M_state_d = TESTBOOL1_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTBOOL1_state: begin
          if (M_alu_out == 16'h0001) begin
            M_state_d = TESTBOOL2_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTBOOL2_state: begin
          if (M_alu_out == 16'h8545) begin
            M_state_d = TESTBOOL3_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTBOOL3_state: begin
          if (M_alu_out == 16'h00e0) begin
            M_state_d = TESTBOOL4_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTBOOL4_state: begin
          if (M_alu_out == 16'h3fff) begin
            M_state_d = TESTBOOL5_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTBOOL5_state: begin
          if (M_alu_out == 16'hb557) begin
            M_state_d = TESTBOOL6_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTBOOL6_state: begin
          if (M_alu_out == 16'hffe5) begin
            M_state_d = TESTBOOL7_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTBOOL7_state: begin
          if (M_alu_out == 16'h1ffe) begin
            M_state_d = TESTBOOL8_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTBOOL8_state: begin
          if (M_alu_out == 16'h3012) begin
            M_state_d = TESTBOOL9_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTBOOL9_state: begin
          if (M_alu_out == 16'hff05) begin
            M_state_d = TESTSHIFT1_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTSHIFT1_state: begin
          if (M_alu_out == 16'h2aaa) begin
            M_state_d = TESTSHIFT2_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTSHIFT2_state: begin
          if (M_alu_out == 16'h8000) begin
            M_state_d = TESTSHIFT3_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTSHIFT3_state: begin
          if (M_alu_out == 16'h1c00) begin
            M_state_d = TESTSHIFT4_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTSHIFT4_state: begin
          if (M_alu_out == 16'h0aaa) begin
            M_state_d = TESTSHIFT5_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTSHIFT5_state: begin
          if (M_alu_out == 16'h0001) begin
            M_state_d = TESTSHIFT6_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTSHIFT6_state: begin
          if (M_alu_out == 16'h0787) begin
            M_state_d = TESTSHIFT7_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTSHIFT7_state: begin
          if (M_alu_out == 16'h0aaa) begin
            M_state_d = TESTSHIFT8_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTSHIFT8_state: begin
          if (M_alu_out == 16'hffff) begin
            M_state_d = TESTSHIFT9_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTSHIFT9_state: begin
          if (M_alu_out == 16'hff87) begin
            M_state_d = TESTCMP1_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTCMP1_state: begin
          if (M_alu_out == 16'h0000) begin
            M_state_d = TESTCMP2_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTCMP2_state: begin
          if (M_alu_out == 16'h0000) begin
            M_state_d = TESTCMP3_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTCMP3_state: begin
          if (M_alu_out == 16'h0001) begin
            M_state_d = TESTCMP4_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTCMP4_state: begin
          if (M_alu_out == 16'h0000) begin
            M_state_d = TESTCMP5_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTCMP5_state: begin
          if (M_alu_out == 16'h0001) begin
            M_state_d = TESTCMP6_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTCMP6_state: begin
          if (M_alu_out == 16'h0000) begin
            M_state_d = TESTCMP7_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTCMP7_state: begin
          if (M_alu_out == 16'h0000) begin
            M_state_d = TESTCMP8_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTCMP8_state: begin
          if (M_alu_out == 16'h0001) begin
            M_state_d = TESTCMP9_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        TESTCMP9_state: begin
          if (M_alu_out == 16'h0001) begin
            M_state_d = PASS_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        PASS_state: begin
          if (M_counter_q == 1'h0) begin
            M_state_d = IDLE_state;
          end
        end
        FAIL_state: begin
          if (M_counter_q == 1'h0) begin
            M_state_d = IDLE_state;
          end
        end
      endcase
    end
    M_counter_d = M_counter_q + 1'h1;
  end
  
  always @(posedge clk) begin
    M_inp_a_q <= M_inp_a_d;
    M_inp_b_q <= M_inp_b_d;
    M_counter_q <= M_counter_d;
    M_state_q <= M_state_d;
  end
  
endmodule
