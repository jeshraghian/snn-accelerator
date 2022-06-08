always @(*) begin
    if(active) begin
    `ifdef USE_WB
        _wbs_ack_buf_ : assert(wbs_ack_o    == buf_wbs_ack_o);
        _wbs_dat_buf_ : assert(wbs_dat_o    == buf_wbs_dat_o);
    `endif
    `ifdef USE_SHARED_OPENRAM
        _rambus_wb_clk_o_buf_ : assert(rambus_wb_clk_o == buf_rambus_wb_clk_o);
        _rambus_wb_rst_o_buf_ : assert(rambus_wb_rst_o == buf_rambus_wb_rst_o);
        _rambus_wb_stb_o_buf_ : assert(rambus_wb_stb_o == buf_rambus_wb_stb_o);
        _rambus_wb_cyc_o_buf_ : assert(rambus_wb_cyc_o == buf_rambus_wb_cyc_o);
        _rambus_wb_we_o_buf_  : assert(rambus_wb_we_o  == buf_rambus_wb_we_o );
        _rambus_wb_sel_o_buf_ : assert(rambus_wb_sel_o == buf_rambus_wb_sel_o);
        _rambus_wb_dat_o_buf_ : assert(rambus_wb_dat_o == buf_rambus_wb_dat_o);
        _rambus_wb_adr_o_buf_ : assert(rambus_wb_adr_o == buf_rambus_wb_adr_o);
    `endif
    `ifdef USE_LA
        _la1_data_buf_: assert(la1_data_out == buf_la1_data_out);
    `endif
    `ifdef USE_IO
        _io_out_buf_  : assert(io_out       == buf_io_out);
        _io_oeb_buf_  : assert(io_oeb       == buf_io_oeb);
    `endif
    `ifdef USE_IRQ
        _user_irq_buf_     : assert(user_irq          == buf_user_irq);
    `endif
    end
    if(!active) begin
    `ifdef USE_WB
        _wbs_ack_z_   : assert(wbs_ack_o    == 1'b0);
        _wbs_dat_z_   : assert(wbs_dat_o    == 32'b0);
    `endif
    `ifdef USE_SHARED_OPENRAM
        _rambus_wb_clk_o_z : assert(rambus_wb_clk_o == 1'b0);
        _rambus_wb_rst_o_z : assert(rambus_wb_rst_o == 1'b0);
        _rambus_wb_stb_o_z : assert(rambus_wb_stb_o == 1'b0);
        _rambus_wb_cyc_o_z : assert(rambus_wb_cyc_o == 1'b0);
        _rambus_wb_we_o_z  : assert(rambus_wb_we_o  == 1'b0);
        _rambus_wb_sel_o_z : assert(rambus_wb_sel_o == 4'b0);
        _rambus_wb_dat_o_z : assert(rambus_wb_dat_o == 32'b0);
        _rambus_wb_adr_o_z : assert(rambus_wb_adr_o == 8'b0);
    `endif
    `ifdef USE_LA
        _la1_data_z_  : assert(la1_data_out == 32'b0);
    `endif
    `ifdef USE_IO
        _io_out_z_    : assert(io_out       == `MPRJ_IO_PADS'b0);
        _io_oeb_z_    : assert(io_oeb       == `MPRJ_IO_PADS'b0);
    `endif
    `ifdef USE_IRQ
        _user_irq_z_       : assert(user_irq          == 3'b0);
    `endif
    end
end
