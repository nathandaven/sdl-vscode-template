CXX ?= g++
MKDIR := mkdir -p
CXXFLAGS += `pkg-config --cflags sdl2 SDL2_image`
LDFLAGS += `pkg-config --libs sdl2 SDL2_image`
PROG := build/prog
OBJS := $(patsubst src/%.cpp,obj/%.o, $(wildcard src/*.cpp))
DEPS := $(OBJS:.o=.d)

PCH_SRC = src/PCH.hpp
PCH_HEADERS = src/Utility/Types.hpp
PCH_OUT = PCH.hpp.gch

.PHONY: all clean

all: build

build: $(PROG)

-include $(DEPS)

clean:
	rm -rf $(PROG) $(OBJS)


# Compiles your PCH
$(PCH_OUT): $(PCH_SRC) $(PCH_HEADERS)
	$(CXX) $(CXXFLAGS) -o $@

$(PROG): $(OBJS)
	@$(MKDIR) $(dir $@)
	$(CXX) $^ $(CXXFLAGS) -include $(PCH_SRC)  $(LDFLAGS) -o $@

obj/%.o: src/%.cpp
	@$(MKDIR) $(dir $@)
	$(CXX) $< $(CXXFLAGS) -include $(PCH_SRC)  -c -MD -o $@



