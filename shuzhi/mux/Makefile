VERILATOR_FLAGS=--cc --exe --build --trace
CPP_FILES := $(wildcard *.cpp)
V_FILES := $(wildcard *.v)
all: sim wave
sim: $(V_FILES) $(CPP_FILES)
	verilator ${VERILATOR_FLAGS} $(V_FILES) $(CPP_FILES)
wave:
	obj_dir/Vtop
	gtkwave waveform.vcd
clean:
	rm -r obj_dir
