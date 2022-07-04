
//MODULE DECLARATION
module system_processing_system7_0_0(
      maxihpm0_fpd_aclk,
      maxigp0_awid,
      maxigp0_awaddr,
      maxigp0_awlen,
      maxigp0_awsize,
      maxigp0_awburst,
      maxigp0_awlock,
      maxigp0_awcache,
      maxigp0_awprot,
      maxigp0_awvalid,
      maxigp0_awuser,
      maxigp0_awready,
      maxigp0_wdata,
      maxigp0_wstrb,
      maxigp0_wlast,
      maxigp0_wvalid,
      maxigp0_wready,
      maxigp0_bid,
      maxigp0_bresp,
      maxigp0_bvalid,
      maxigp0_bready,
      maxigp0_arid,
      maxigp0_araddr,
      maxigp0_arlen,
      maxigp0_arsize,
      maxigp0_arburst,
      maxigp0_arlock,
      maxigp0_arcache,
      maxigp0_arprot,
      maxigp0_arvalid,
      maxigp0_aruser,
      maxigp0_arready,
      maxigp0_rid,
      maxigp0_rdata,
      maxigp0_rresp,
      maxigp0_rlast,
      maxigp0_rvalid,
      maxigp0_rready,
      maxigp0_awqos,
      maxigp0_arqos,
      saxihp1_fpd_aclk,
      saxigp3_aruser,
      saxigp3_awuser,
      saxigp3_awid,
      saxigp3_awaddr,
      saxigp3_awlen,
      saxigp3_awsize,
      saxigp3_awburst,
      saxigp3_awlock,
      saxigp3_awcache,
      saxigp3_awprot,
      saxigp3_awvalid,
      saxigp3_awready,
      saxigp3_wdata,
      saxigp3_wstrb,
      saxigp3_wlast,
      saxigp3_wvalid,
      saxigp3_wready,
      saxigp3_bid,
      saxigp3_bresp,
      saxigp3_bvalid,
      saxigp3_bready,
      saxigp3_arid,
      saxigp3_araddr,
      saxigp3_arlen,
      saxigp3_arsize,
      saxigp3_arburst,
      saxigp3_arlock,
      saxigp3_arcache,
      saxigp3_arprot,
      saxigp3_arvalid,
      saxigp3_arready,
      saxigp3_rid,
      saxigp3_rdata,
      saxigp3_rresp,
      saxigp3_rlast,
      saxigp3_rvalid,
      saxigp3_rready,
      saxigp3_awqos,
      saxigp3_arqos,
      pl_resetn0,
      pl_clk0
);

//INPUT AND OUTPUT PORTS

    input maxihpm0_fpd_aclk;
    output [15:0] maxigp0_awid;
    output [39:0] maxigp0_awaddr;
    output [7:0] maxigp0_awlen;
    output [2:0] maxigp0_awsize;
    output [1:0] maxigp0_awburst;
    output maxigp0_awlock;
    output [3:0] maxigp0_awcache;
    output [2:0] maxigp0_awprot;
    output maxigp0_awvalid;
    output [15:0] maxigp0_awuser;
    input maxigp0_awready;
    output [31:0] maxigp0_wdata;
    output [3:0] maxigp0_wstrb;
    output maxigp0_wlast;
    output maxigp0_wvalid;
    input maxigp0_wready;
    input [15:0] maxigp0_bid;
    input [1:0] maxigp0_bresp;
    input maxigp0_bvalid;
    output maxigp0_bready;
    output [15:0] maxigp0_arid;
    output [39:0] maxigp0_araddr;
    output [7:0] maxigp0_arlen;
    output [2:0] maxigp0_arsize;
    output [1:0] maxigp0_arburst;
    output maxigp0_arlock;
    output [3:0] maxigp0_arcache;
    output [2:0] maxigp0_arprot;
    output maxigp0_arvalid;
    output [15:0] maxigp0_aruser;
    input maxigp0_arready;
    input [15:0] maxigp0_rid;
    input [31:0] maxigp0_rdata;
    input [1:0] maxigp0_rresp;
    input maxigp0_rlast;
    input maxigp0_rvalid;
    output maxigp0_rready;
    output [3:0] maxigp0_awqos;
    output [3:0] maxigp0_arqos;
    input saxihp1_fpd_aclk;
    input saxigp3_aruser;
    input saxigp3_awuser;
    input [5:0] saxigp3_awid;
    input [48:0] saxigp3_awaddr;
    input [7:0] saxigp3_awlen;
    input [2:0] saxigp3_awsize;
    input [1:0] saxigp3_awburst;
    input saxigp3_awlock;
    input [3:0] saxigp3_awcache;
    input [2:0] saxigp3_awprot;
    input saxigp3_awvalid;
    output saxigp3_awready;
    input [63:0] saxigp3_wdata;
    input [7:0] saxigp3_wstrb;
    input saxigp3_wlast;
    input saxigp3_wvalid;
    output saxigp3_wready;
    output [5:0] saxigp3_bid;
    output [1:0] saxigp3_bresp;
    output saxigp3_bvalid;
    input saxigp3_bready;
    input [5:0] saxigp3_arid;
    input [48:0] saxigp3_araddr;
    input [7:0] saxigp3_arlen;
    input [2:0] saxigp3_arsize;
    input [1:0] saxigp3_arburst;
    input saxigp3_arlock;
    input [3:0] saxigp3_arcache;
    input [2:0] saxigp3_arprot;
    input saxigp3_arvalid;
    output saxigp3_arready;
    output [5:0] saxigp3_rid;
    output [63:0] saxigp3_rdata;
    output [1:0] saxigp3_rresp;
    output saxigp3_rlast;
    output saxigp3_rvalid;
    input saxigp3_rready;
    input [3:0] saxigp3_awqos;
    input [3:0] saxigp3_arqos;
    output pl_resetn0;
    output pl_clk0;

//REG DECLARATIONS

    reg  [15:0] maxigp0_awid;
    reg  [39:0] maxigp0_awaddr;
    reg  [7:0] maxigp0_awlen;
    reg  [2:0] maxigp0_awsize;
    reg  [1:0] maxigp0_awburst;
    reg  maxigp0_awlock;
    reg  [3:0] maxigp0_awcache;
    reg  [2:0] maxigp0_awprot;
    reg  maxigp0_awvalid;
    reg  [15:0] maxigp0_awuser;
    reg  [31:0] maxigp0_wdata;
    reg  [3:0] maxigp0_wstrb;
    reg  maxigp0_wlast;
    reg  maxigp0_wvalid;
    reg  maxigp0_bready;
    reg  [15:0] maxigp0_arid;
    reg  [39:0] maxigp0_araddr;
    reg  [7:0] maxigp0_arlen;
    reg  [2:0] maxigp0_arsize;
    reg  [1:0] maxigp0_arburst;
    reg  maxigp0_arlock;
    reg  [3:0] maxigp0_arcache;
    reg  [2:0] maxigp0_arprot;
    reg  maxigp0_arvalid;
    reg  [15:0] maxigp0_aruser;
    reg  maxigp0_rready;
    reg  [3:0] maxigp0_awqos;
    reg  [3:0] maxigp0_arqos;
    reg  saxigp3_awready;
    reg  saxigp3_wready;
    reg  [5:0] saxigp3_bid;
    reg  [1:0] saxigp3_bresp;
    reg  saxigp3_bvalid;
    reg  saxigp3_arready;
    reg  [5:0] saxigp3_rid;
    reg  [63:0] saxigp3_rdata;
    reg  [1:0] saxigp3_rresp;
    reg  saxigp3_rlast;
    reg  saxigp3_rvalid;
    reg  pl_resetn0;
    reg  pl_clk0;

initial
 begin


   $display("WARNING: Zynq UltraScale IP doesn't support simulation");
     end
endmodule
