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
    dut.reset.value = 1; 
    dut.post_synaptic.value = 0; 
    dut.clk_decay.value = 1; 
    await ClockCycles(dut.clk, 2)
    dut.reset.value = 0; 
    # dut.post_synaptic.value = 13;  
    # await ClockCycles(dut.clk, 20) 



@cocotb.test()
async def test_neuron_slow(dut):
    clock = Clock(dut.clk, 10, units="ns")
    clk_decay = Clock(dut.clk_decay, 20, units="ns")
    cocotb.fork(clock.start())
    cocotb.fork(clk_decay.start())
    await reset(dut)
    dut.post_synaptic = 10
    await ClockCycles(dut.clk, 2) 
    dut.post_synaptic = 0
    await ClockCycles(dut.clk, 20) 