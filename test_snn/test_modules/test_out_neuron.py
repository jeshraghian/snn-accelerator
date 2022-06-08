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
    dut.in1 = 0;
    dut.in2 = 0;
    dut.in3 = 0;
    dut.in4 = 0;
    await ClockCycles(dut.clk, 2)
    dut.reset.value = 0;
    # dut.post_synaptic.value = 7;
    dut.in1.value = 1;
    dut.in2.value = 1;
    dut.in3.value = 1;
    dut.in4.value = 1;
    await ClockCycles(dut.clk, 20)


@cocotb.test()
async def test_out_neuron(dut):
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.fork(clock.start())
    dut.in1 <= 1
    dut.in2 <= 1
    dut.in3 <= 1
    dut.in4 <= 1
    await reset(dut)
    # dut.post_synaptic <= 5