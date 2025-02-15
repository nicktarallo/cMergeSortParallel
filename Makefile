CC=gcc
CFLAGS= -std=c90 -W -Wall -ansi -pedantic  -O2
#LDFLAGS=
PTHREAD_FLAGS= -pthread
OUTPUT_DIR=./buildMakeFile

all:
#	$(MAKE) mergeSortSeq
	$(MAKE) mergeSortParPThread
	$(MAKE) clean

#mergeSortSeq:
# 	$(MAKE) commonFuncs
#	$(CC) $(CFLAGS) -o $(OUTPUT_DIR)/mergeSortSequential.o -c mergeSortSequential/mergeSortSequential.c
#	$(CC) $(CFLAGS) -o $(OUTPUT_DIR)/main.o -c mergeSortSequential/main.c
#	$(CC) $(CFLAGS) -o $(OUTPUT_DIR)/mergeSortSequential $(OUTPUT_DIR)/mergeSortSequential.o $(OUTPUT_DIR)/main.o $(OUTPUT_DIR)/commonFunctions.o

mergeSortParPThread:
	$(MAKE) commonFuncs
	$(CC) $(CFLAGS) -o $(OUTPUT_DIR)/mergeSortSequential.o -c mergeSortSequential/Q2_mergeSortSequential.c
	$(CC) $(CFLAGS) $(PTHREAD_FLAGS) -o $(OUTPUT_DIR)/mergeSortPThread.o -c mergeSortPThread/Q2_mergeSortParallelPThread.c
	$(CC) $(CFLAGS) $(PTHREAD_FLAGS) -o $(OUTPUT_DIR)/main.o -c mergeSortPThread/Q2_main.c
	$(CC) $(CFLAGS) $(PTHREAD_FLAGS) -o $(OUTPUT_DIR)/mergeSortPThread $(OUTPUT_DIR)/mergeSortPThread.o $(OUTPUT_DIR)/main.o $(OUTPUT_DIR)/commonFunctions.o $(OUTPUT_DIR)/mergeSortSequential.o

commonFuncs:
	$(CC) $(CFLAGS) -o $(OUTPUT_DIR)/commonFunctions.o -c commonFunctions/Q2_commonFunctions.c

.PHONY: clean mrproper all

clean:
	rm -rf $(OUTPUT_DIR)/*.o

mrproper: clean
	rm -rf $(OUTPUT_DIR)/fileGen
	rm -rf $(OUTPUT_DIR)/mergeSortSeq
	rm -rf $(OUTPUT_DIR)/mergeSortOpenMp
	rm -rf $(OUTPUT_DIR)/mergeSortPthread


## OTHER
#WindowsVer:
#	$(MAKE) MrProperWin
#	$(MAKE) fileGenWin
#	$(MAKE) sequentialVerWin
#	$(MAKE) OpenMpVerWin
#	$(MAKE) clean
#
#fileGenWin:
#	x86_64-w64-mingw32-gcc ./fileGenerator/fileGenerator.c -o buildMakeFile/fileGenerator.exe -std=c90 -Wall -O2
#
#sequentialVerWin:
#	x86_64-w64-mingw32-gcc ./mergeSortSequential/d2s.c -o buildMakeFile/mergeSortSequential.exe -std=c90 -Wall -O2
#
#OpenMpVerWin:
#	x86_64-w64-mingw32-gcc ./mergeSortOpenMp/d2omp.c -o buildMakeFile/mergeSortOpenMp.exe -fopenmp=libomp5 -std=c90 -Wall -O2
#
#MrProperWin : clean
#	rm -f buildMakeFile/fileGenerator.exe
#	rm -f buildMakeFile/mergeSortOpenMp.exe
#	rm -f buildMakeFile/mergeSortPThread.exe
#	rm -f buildMakeFile/mergeSortSequential.exe
