import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles


async def reset(dut):
    dut.reset.value = 1
    dut.clk2.value = 0; 
    dut.clk3.value = 0; 
    await ClockCycles(dut.clk, 2)
    dut.reset.value = 0;
    await ClockCycles(dut.clk, 20)


@cocotb.test()
async def test_clk_div(dut):
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.fork(clock.start())
    # await ClockCycles(dut.clk, 20) 
    # dut.in1 <= 7
    # dut.in2 <= 7
    await reset(dut)
    # # dut.in1 <= 5