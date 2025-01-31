if (UNIX)
    set(THREADS_PREFER_PTHREAD_FLAG ON)

    set(SRCS_COMMON_FUNCTIONS ../commonFunctions/Q2_commonFunctions.c)
    set(HDRS_COMMON_FUNCTIONS ../commonFunctions/Q2_commonFunctions.h)

    set(HDRS_MERGE_SORT "../mergeSortSequential/Q2_mergeSortSequential.h")
    set(SRCS_MERGE_SORT "../mergeSortSequential/Q2_mergeSortSequential.c")

    set(SRCS Q2_mergeSortParallelPThread.c)
    set(HDRS Q2_mergeSortParallelPThread.h)

    add_executable(${PROJECT_NAME} main.c ${HDRS} ${SRCS} ${HDRS_MERGE_SORT} ${SRCS_MERGE_SORT} ${HDRS_COMMON_FUNCTIONS} ${SRCS_COMMON_FUNCTIONS})
    
    find_package(Threads REQUIRED)
    target_link_libraries(${PROJECT_NAME} PRIVATE Threads::Threads)
else ()
    message(WARNING "pthread cannot be compiled for other systems than UNIX (skipping build)")
endif ()
