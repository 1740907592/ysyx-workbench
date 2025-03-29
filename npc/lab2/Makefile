
# 定义一些常用变量
TOPNAME = top
NXDC_FILES = constr/top.nxdc
INC_PATH ?=

# Verilator 配置
VERILATOR = verilator
VERILATOR_FLAGS = --cc --exe --build --trace --top-module top
VERILATOR_CFLAGS += -MMD --build -cc --top-module top\
                    -O3 --x-assign fast --x-initial fast --noassert

BUILD_DIR = ./build
OBJ_DIR = $(BUILD_DIR)/obj_dir
BIN = $(BUILD_DIR)/$(TOPNAME)
default: $(BIN)
$(shell mkdir -p $(BUILD_DIR))
# constraint file
SRC_AUTO_BIND = $(abspath $(BUILD_DIR)/auto_bind.cpp)
# 自动绑定生成
$(SRC_AUTO_BIND): $(NXDC_FILES)
	python3 $(NVBOARD_HOME)/scripts/auto_pin_bind.py $^ $@

# 源文件
VSRCS = $(shell find $(abspath ./vsrc) -name "*.v")
CSRCS = $(shell find $(abspath ./csrc) -name "*.c" -or -name "*.cc" -or -name "*.cpp")
CSRCS += $(SRC_AUTO_BIND)

# rules for NVBoard
include $(NVBOARD_HOME)/scripts/nvboard.mk

# rules for verilator
INCFLAGS = $(addprefix -I, $(INC_PATH))
CXXFLAGS += $(INCFLAGS) -DTOP_NAME="\"V$(TOPNAME)\""

# Verilator 目标
$(BIN): $(VSRCS) $(CSRCS) $(NVBOARD_ARCHIVE)
	@rm -rf $(OBJ_DIR)
	$(VERILATOR) $(VERILATOR_CFLAGS) \
		--top-module $(TOPNAME) $^ \
		$(addprefix -CFLAGS , $(CXXFLAGS)) $(addprefix -LDFLAGS , $(LDFLAGS)) \
		--Mdir $(OBJ_DIR) --exe -o $(abspath $(BIN))
# 构建仿真目标
sim: $(VSRCS) 
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	verilator $(VERILATOR_FLAGS)  $(VSRCS) sim_main.cpp

# 生成波形文件
wave: 
	obj_dir/Vtop
	gtkwave waveform.vcd
test: sim wave
# 运行仿真
run: $(BIN)
	@$^

# 清理生成的文件
clean:
	rm -rf $(BUILD_DIR)
	rm -rf obj_dir
	rm -rf waveform.vcd

# 声明伪目标
.PHONY: default all clean run sim wave
include ../Makefile


