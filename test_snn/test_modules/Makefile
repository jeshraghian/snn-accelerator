# FPGA variables
PROJECT = fpga/encoder_pwm
SOURCES= src/neuron.v src/out_neuron.v src/snn.v src/snn_2.v src/neuron_slow.v src/out_neuron_2.v src/clk_div.v src/neuron_2x.v src/neuron_4x.v src/neuron_8x.v
ICEBREAKER_DEVICE = up5k
ICEBREAKER_PIN_DEF = fpga/icebreaker.pcf
ICEBREAKER_PACKAGE = sg48
SEED = 1

# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export PYTHONPATH := test:$(PYTHONPATH)
export LIBPYTHON_LOC=$(shell cocotb-config --libpython)

all: test_encoder test_debounce test_pwm test_rgb_mixer test_neuron test_out_neuron test_snn test_clk_div neuron_slow test_snn_2

# if you run rules with NOASSERT=1 it will set PYTHONOPTIMIZE, which turns off assertions in the tests
test_top:
	echo "the top module was renamed to rgb_mixer. Please run make test_rgb_mixer instead"

test_snn:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s snn -s dump -g2012 src/snn.v src/neuron.v src/out_neuron.v src/clk_div.v src/neuron_2x.v src/neuron_4x.v src/neuron_8x.v src/neuron_slow.v test/dump_snn.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_snn vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml


test_snn_2:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s snn_2 -s dump -g2012 src/snn_2.v src/neuron.v src/out_neuron.v src/clk_div.v src/neuron_2x.v src/neuron_4x.v src/neuron_8x.v src/neuron_slow.v test/dump_snn_2.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_snn_2 vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml


test_neuron:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s neuron -s dump -g2012 src/neuron.v test/dump_neuron.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_neuron vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml

test_out_neuron:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s out_neuron -s dump -g2012 src/out_neuron.v test/dump_out_neuron.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_out_neuron vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml


test_neuron_slow:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s neuron_slow -s dump -g2012 src/neuron_slow.v test/dump_neuron_slow.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_neuron_slow vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml

test_clk_div:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s clk_div -s dump -g2012 src/clk_div.v test/dump_clk_div.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_clk_div vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml

test_rgb_mixer:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s rgb_mixer -s dump -g2012 src/rgb_mixer.v test/dump_rgb_mixer.v src/ src/encoder.v src/debounce.v src/pwm.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_rgb_mixer vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml

test_encoder:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s encoder -s dump -g2012 test/dump_encoder.v src/encoder.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_encoder vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml

test_pwm:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s pwm -s dump -g2012 src/pwm.v test/dump_pwm.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_pwm vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml

test_debounce:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s debounce -s dump -g2012 src/debounce.v test/dump_debounce.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_debounce vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml

show_%: %.vcd %.gtkw
	gtkwave $^

# FPGA recipes

show_synth_%: src/%.v
	yosys -p "read_verilog $<; proc; opt; show -colors 2 -width -signed"

%.json: $(SOURCES)
	yosys -l fpga/yosys.log -p 'synth_ice40 -top rgb_mixer -json $(PROJECT).json' $(SOURCES)

%.asc: %.json $(ICEBREAKER_PIN_DEF) 
	nextpnr-ice40 -l fpga/nextpnr.log --seed $(SEED) --freq 20 --package $(ICEBREAKER_PACKAGE) --$(ICEBREAKER_DEVICE) --asc $@ --pcf $(ICEBREAKER_PIN_DEF) --json $<

%.bin: %.asc
	icepack $< $@

prog: $(PROJECT).bin
	iceprog $<

# general recipes

lint:
	verible-verilog-lint src/*v --rules_config verible.rules

clean:
	rm -rf *vcd sim_build fpga/*log fpga/*bin test/__pycache__

.PHONY: clean
