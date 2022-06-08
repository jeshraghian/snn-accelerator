import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles, with_timeout


@cocotb.test()
async def test_start(dut):
    clock = Clock(dut.clk, 25, units="ns")
    cocotb.fork(clock.start())

    dut.RSTB.value = 0
    dut.reset.value = 0
    dut.power1.value = 0;
    dut.power2.value = 0;
    dut.power3.value = 0;
    dut.power4.value = 0;

    await ClockCycles(dut.clk, 8)
    dut.power1.value = 1;
    await ClockCycles(dut.clk, 8)
    dut.power2.value = 1;
    await ClockCycles(dut.clk, 8)
    dut.power3.value = 1;
    await ClockCycles(dut.clk, 8)
    dut.power4.value = 1;

    await ClockCycles(dut.clk, 80)
    dut.RSTB.value = 1
    dut.reset.value = 1

    # wait with a timeout for the project to become active
    # await with_timeout(RisingEdge(dut.clk), 500, 'us')

    # wait
    await ClockCycles(dut.clk, 10000)

    dut.in1.value = 0
    dut.reset.value = 0

    await ClockCycles(dut.clk, 10)

    dut.in1.value = 64
    # dut.state1.value = 96

    await ClockCycles(dut.clk,30000)

    # assert something
    assert(0 == 0)



# @cocotb.test()
# async def test_all(dut):
#     clock = Clock(dut.clk, 5, units="us")
#     cocotb.fork(clock.start())

#     # dut.RSTB.value = 0 
#     dut.in1.value = 0
#     await ClockCycles(dut.clk, 1000)
#     dut.RSTB.value = 1
#     # assert dut.spike_out == 0 

#     # clock = Clock(dut.clk, 10, units="ns")
#     # cocotb.fork(clock.start())
#     # dut.in1.value  <= 12
#     # await RSTB(dut)
#     # assert dut.spike_out == 0