#makefile cooked up to compile the .cpp files for Moderngpu

OBJECTS = src/mgpucontext.o src/mgpuutil.o

NVCC_OPTS = -O3 -gencode arch=compute_20,code=sm_20 -gencode arch=compute_30,code=sm_30 -gencode arch=compute_35,code=sm_35 -gencode arch=compute_52,code=sm_52

%.o: %.cpp
	nvcc -c $(NVCC_OPTS) -o $@ -Iinclude $<

%.o: %.cu
	nvcc -c $(NVCC_OPTS) -o $@ -Iinclude $<

libmgpu.a: $(OBJECTS)
	ar cruv $@ $(OBJECTS)

clean:
	rm -f libmgpu.a $(OBJECTS)
