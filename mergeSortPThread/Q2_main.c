#define _POSIX_C_SOURCE 199309L /*for clock_gettime() with CLOCK_MONOTONIC*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <pthread.h>

#include "Q2_mergeSortParallelPThread.h"
#include "../commonFunctions/Q2_commonFunctions.h"

#define INIT_THREADS_NUMBER 4
#define INIT_ARRAY_SIZE 10000

int main(int argc, char* argv[]) {
    /*
     * Error list:
     * 1 - Error reading line from file
     * 2 - Error allocating memory
     * 3 - Error creating thread
     */

    printf("|-----Merge Sort Parallel using PThread-----|\n\n");
    
    /* Read optional parameter */
    int threadsNumber = INIT_THREADS_NUMBER; /* include main thread*/
    int arraySize = INIT_ARRAY_SIZE;
    if (argc != 1) {
        threadsNumber = atoi(argv[1]);
        arraySize = atoi(argv[2]);
    }
    threadsNumber--; /*Main thread is not counted for PThread*/

    /* Create array */
    int* array = allocateMemory(arraySize * sizeof(int));

    randomizeIntArray(array, arraySize, 1, arraySize);

    /* Print the number of threads */
    printf("Number of threads: %d\n", threadsNumber + 1);

    /* Start timer */
    struct timespec timeSpecStart, timeSpecFinish;
    double unixTimelapsed;
    clock_t startClock = clock();
    clock_gettime(CLOCK_MONOTONIC, &timeSpecStart);

    /* Sort array */
    mergeSortParallelPThread(array, arraySize, threadsNumber);

    /* Stop timer */
    clock_t endClock = clock();
    clock_gettime(CLOCK_MONOTONIC, &timeSpecFinish);
    unixTimelapsed = (timeSpecFinish.tv_sec - timeSpecStart.tv_sec);
    unixTimelapsed += (timeSpecFinish.tv_nsec - timeSpecStart.tv_nsec) / 1000000000.0;
    printf("CPU and Wall time:\n");
    printf("- CPU time: %f seconds\n", (double)(endClock - startClock) / CLOCKS_PER_SEC);
    printf("- Wall time: %f seconds\n", unixTimelapsed);

    /* Print array is sorted */
    printf("Is output array correctly sorted? %s\n", isSorted(array, arraySize) ? "No" : "Yes");

    /* Print array */
    printArraySummary(array, arraySize);

    /* Free memory */
    free(array);

    return 0;
}
