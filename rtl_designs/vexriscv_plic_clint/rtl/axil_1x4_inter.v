/*

Copyright (c) 2020 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * AXI4 lite 1x4 interconnect (wrapper)
 */
module axil_1x4_inter #
(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32,
    parameter STRB_WIDTH = (DATA_WIDTH/8),
    parameter M_REGIONS = 1,
    parameter M00_BASE_ADDR = 0,
    parameter M00_ADDR_WIDTH = {M_REGIONS{32'd24}},
    parameter M00_CONNECT_READ = 1'b1,
    parameter M00_CONNECT_WRITE = 1'b1,
    parameter M00_SECURE = 1'b0,
    parameter M01_BASE_ADDR = 0,
    parameter M01_ADDR_WIDTH = {M_REGIONS{32'd24}},
    parameter M01_CONNECT_READ = 1'b1,
    parameter M01_CONNECT_WRITE = 1'b1,
    parameter M01_SECURE = 1'b0,
    parameter M02_BASE_ADDR = 0,
    parameter M02_ADDR_WIDTH = {M_REGIONS{32'd24}},
    parameter M02_CONNECT_READ = 1'b1,
    parameter M02_CONNECT_WRITE = 1'b1,
    parameter M02_SECURE = 1'b0,
    parameter M03_BASE_ADDR = 0,
    parameter M03_ADDR_WIDTH = {M_REGIONS{32'd24}},
    parameter M03_CONNECT_READ = 1'b1,
    parameter M03_CONNECT_WRITE = 1'b1,
    parameter M03_SECURE = 1'b0
)
(
    input  wire                     clk,
    input  wire                     rst,

    /*
     * AXI lite slave interfaces
     */
    input  wire [ADDR_WIDTH-1:0]    s00_axil_awaddr,
    input  wire [2:0]               s00_axil_awprot,
    input  wire                     s00_axil_awvalid,
    output wire                     s00_axil_awready,
    input  wire [DATA_WIDTH-1:0]    s00_axil_wdata,
    input  wire [STRB_WIDTH-1:0]    s00_axil_wstrb,
    input  wire                     s00_axil_wvalid,
    output wire                     s00_axil_wready,
    output wire [1:0]               s00_axil_bresp,
    output wire                     s00_axil_bvalid,
    input  wire                     s00_axil_bready,
    input  wire [ADDR_WIDTH-1:0]    s00_axil_araddr,
    input  wire [2:0]               s00_axil_arprot,
    input  wire                     s00_axil_arvalid,
    output wire                     s00_axil_arready,
    output wire [DATA_WIDTH-1:0]    s00_axil_rdata,
    output wire [1:0]               s00_axil_rresp,
    output wire                     s00_axil_rvalid,
    input  wire                     s00_axil_rready,

    /*
     * AXI lite master interfaces
     */
    output wire [ADDR_WIDTH-1:0]    m00_axil_awaddr,
    output wire [2:0]               m00_axil_awprot,
    output wire                     m00_axil_awvalid,
    input  wire                     m00_axil_awready,
    output wire [DATA_WIDTH-1:0]    m00_axil_wdata,
    output wire [STRB_WIDTH-1:0]    m00_axil_wstrb,
    output wire                     m00_axil_wvalid,
    input  wire                     m00_axil_wready,
    input  wire [1:0]               m00_axil_bresp,
    input  wire                     m00_axil_bvalid,
    output wire                     m00_axil_bready,
    output wire [ADDR_WIDTH-1:0]    m00_axil_araddr,
    output wire [2:0]               m00_axil_arprot,
    output wire                     m00_axil_arvalid,
    input  wire                     m00_axil_arready,
    input  wire [DATA_WIDTH-1:0]    m00_axil_rdata,
    input  wire [1:0]               m00_axil_rresp,
    input  wire                     m00_axil_rvalid,
    output wire                     m00_axil_rready,

    output wire [ADDR_WIDTH-1:0]    m01_axil_awaddr,
    output wire [2:0]               m01_axil_awprot,
    output wire                     m01_axil_awvalid,
    input  wire                     m01_axil_awready,
    output wire [DATA_WIDTH-1:0]    m01_axil_wdata,
    output wire [STRB_WIDTH-1:0]    m01_axil_wstrb,
    output wire                     m01_axil_wvalid,
    input  wire                     m01_axil_wready,
    input  wire [1:0]               m01_axil_bresp,
    input  wire                     m01_axil_bvalid,
    output wire                     m01_axil_bready,
    output wire [ADDR_WIDTH-1:0]    m01_axil_araddr,
    output wire [2:0]               m01_axil_arprot,
    output wire                     m01_axil_arvalid,
    input  wire                     m01_axil_arready,
    input  wire [DATA_WIDTH-1:0]    m01_axil_rdata,
    input  wire [1:0]               m01_axil_rresp,
    input  wire                     m01_axil_rvalid,
    output wire                     m01_axil_rready,

    output wire [ADDR_WIDTH-1:0]    m02_axil_awaddr,
    output wire [2:0]               m02_axil_awprot,
    output wire                     m02_axil_awvalid,
    input  wire                     m02_axil_awready,
    output wire [DATA_WIDTH-1:0]    m02_axil_wdata,
    output wire [STRB_WIDTH-1:0]    m02_axil_wstrb,
    output wire                     m02_axil_wvalid,
    input  wire                     m02_axil_wready,
    input  wire [1:0]               m02_axil_bresp,
    input  wire                     m02_axil_bvalid,
    output wire                     m02_axil_bready,
    output wire [ADDR_WIDTH-1:0]    m02_axil_araddr,
    output wire [2:0]               m02_axil_arprot,
    output wire                     m02_axil_arvalid,
    input  wire                     m02_axil_arready,
    input  wire [DATA_WIDTH-1:0]    m02_axil_rdata,
    input  wire [1:0]               m02_axil_rresp,
    input  wire                     m02_axil_rvalid,
    output wire                     m02_axil_rready,

    output wire [ADDR_WIDTH-1:0]    m03_axil_awaddr,
    output wire [2:0]               m03_axil_awprot,
    output wire                     m03_axil_awvalid,
    input  wire                     m03_axil_awready,
    output wire [DATA_WIDTH-1:0]    m03_axil_wdata,
    output wire [STRB_WIDTH-1:0]    m03_axil_wstrb,
    output wire                     m03_axil_wvalid,
    input  wire                     m03_axil_wready,
    input  wire [1:0]               m03_axil_bresp,
    input  wire                     m03_axil_bvalid,
    output wire                     m03_axil_bready,
    output wire [ADDR_WIDTH-1:0]    m03_axil_araddr,
    output wire [2:0]               m03_axil_arprot,
    output wire                     m03_axil_arvalid,
    input  wire                     m03_axil_arready,
    input  wire [DATA_WIDTH-1:0]    m03_axil_rdata,
    input  wire [1:0]               m03_axil_rresp,
    input  wire                     m03_axil_rvalid,
    output wire                     m03_axil_rready
);

localparam S_COUNT = 1;
localparam M_COUNT = 4;

// parameter sizing helpers
function [ADDR_WIDTH*M_REGIONS-1:0] w_a_r(input [ADDR_WIDTH*M_REGIONS-1:0] val);
    w_a_r = val;
endfunction

function [32*M_REGIONS-1:0] w_32_r(input [32*M_REGIONS-1:0] val);
    w_32_r = val;
endfunction

function [S_COUNT-1:0] w_s(input [S_COUNT-1:0] val);
    w_s = val;
endfunction

function w_1(input val);
    w_1 = val;
endfunction

axil_interconnect #(
    .S_COUNT(S_COUNT),
    .M_COUNT(M_COUNT),
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .STRB_WIDTH(STRB_WIDTH),
    .M_REGIONS(M_REGIONS),
    .M_BASE_ADDR({ w_a_r(M03_BASE_ADDR), w_a_r(M02_BASE_ADDR), w_a_r(M01_BASE_ADDR), w_a_r(M00_BASE_ADDR) }),
    .M_ADDR_WIDTH({ w_32_r(M03_ADDR_WIDTH), w_32_r(M02_ADDR_WIDTH), w_32_r(M01_ADDR_WIDTH), w_32_r(M00_ADDR_WIDTH) }),
    .M_CONNECT_READ({ w_s(M03_CONNECT_READ), w_s(M02_CONNECT_READ), w_s(M01_CONNECT_READ), w_s(M00_CONNECT_READ) }),
    .M_CONNECT_WRITE({ w_s(M03_CONNECT_WRITE), w_s(M02_CONNECT_WRITE), w_s(M01_CONNECT_WRITE), w_s(M00_CONNECT_WRITE) }),
    .M_SECURE({ w_1(M03_SECURE), w_1(M02_SECURE), w_1(M01_SECURE), w_1(M00_SECURE) })
)
axil_interconnect_inst (
    .clk(clk),
    .rst(rst),
    .s_axil_awaddr({ s00_axil_awaddr }),
    .s_axil_awprot({ s00_axil_awprot }),
    .s_axil_awvalid({ s00_axil_awvalid }),
    .s_axil_awready({ s00_axil_awready }),
    .s_axil_wdata({ s00_axil_wdata }),
    .s_axil_wstrb({ s00_axil_wstrb }),
    .s_axil_wvalid({ s00_axil_wvalid }),
    .s_axil_wready({ s00_axil_wready }),
    .s_axil_bresp({ s00_axil_bresp }),
    .s_axil_bvalid({ s00_axil_bvalid }),
    .s_axil_bready({ s00_axil_bready }),
    .s_axil_araddr({ s00_axil_araddr }),
    .s_axil_arprot({ s00_axil_arprot }),
    .s_axil_arvalid({ s00_axil_arvalid }),
    .s_axil_arready({ s00_axil_arready }),
    .s_axil_rdata({ s00_axil_rdata }),
    .s_axil_rresp({ s00_axil_rresp }),
    .s_axil_rvalid({ s00_axil_rvalid }),
    .s_axil_rready({ s00_axil_rready }),
    .m_axil_awaddr({ m03_axil_awaddr, m02_axil_awaddr, m01_axil_awaddr, m00_axil_awaddr }),
    .m_axil_awprot({ m03_axil_awprot, m02_axil_awprot, m01_axil_awprot, m00_axil_awprot }),
    .m_axil_awvalid({ m03_axil_awvalid, m02_axil_awvalid, m01_axil_awvalid, m00_axil_awvalid }),
    .m_axil_awready({ m03_axil_awready, m02_axil_awready, m01_axil_awready, m00_axil_awready }),
    .m_axil_wdata({ m03_axil_wdata, m02_axil_wdata, m01_axil_wdata, m00_axil_wdata }),
    .m_axil_wstrb({ m03_axil_wstrb, m02_axil_wstrb, m01_axil_wstrb, m00_axil_wstrb }),
    .m_axil_wvalid({ m03_axil_wvalid, m02_axil_wvalid, m01_axil_wvalid, m00_axil_wvalid }),
    .m_axil_wready({ m03_axil_wready, m02_axil_wready, m01_axil_wready, m00_axil_wready }),
    .m_axil_bresp({ m03_axil_bresp, m02_axil_bresp, m01_axil_bresp, m00_axil_bresp }),
    .m_axil_bvalid({ m03_axil_bvalid, m02_axil_bvalid, m01_axil_bvalid, m00_axil_bvalid }),
    .m_axil_bready({ m03_axil_bready, m02_axil_bready, m01_axil_bready, m00_axil_bready }),
    .m_axil_araddr({ m03_axil_araddr, m02_axil_araddr, m01_axil_araddr, m00_axil_araddr }),
    .m_axil_arprot({ m03_axil_arprot, m02_axil_arprot, m01_axil_arprot, m00_axil_arprot }),
    .m_axil_arvalid({ m03_axil_arvalid, m02_axil_arvalid, m01_axil_arvalid, m00_axil_arvalid }),
    .m_axil_arready({ m03_axil_arready, m02_axil_arready, m01_axil_arready, m00_axil_arready }),
    .m_axil_rdata({ m03_axil_rdata, m02_axil_rdata, m01_axil_rdata, m00_axil_rdata }),
    .m_axil_rresp({ m03_axil_rresp, m02_axil_rresp, m01_axil_rresp, m00_axil_rresp }),
    .m_axil_rvalid({ m03_axil_rvalid, m02_axil_rvalid, m01_axil_rvalid, m00_axil_rvalid }),
    .m_axil_rready({ m03_axil_rready, m02_axil_rready, m01_axil_rready, m00_axil_rready })
);

endmodule

`resetall
