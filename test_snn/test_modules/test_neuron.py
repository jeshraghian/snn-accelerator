import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles

# async def reset(dut):
#     dut.post_synaptic <= 0
#     dut.reset <= 1
#     await ClockCycles(dut.clk, 5)
#     dut.reset <= 0;
#     await ClockCycles(dut.clk, 5)

async def reset(dut):
    dut.reset.value = 1
    dut.post_synaptic.value = 0; 
    await ClockCycles(dut.clk, 2)
    dut.reset.value = 0;
    dut.post_synaptic.value = 7; 
    await ClockCycles(dut.clk, 20)


@cocotb.test()
async def test_neuron(dut):
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.fork(clock.start())
    dut.post_synaptic <= 8
    await reset(dut)
    dut.post_synaptic <= 5