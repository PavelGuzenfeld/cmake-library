# Function to apply sanitizer flags to a target
function(enable_sanitizers target)
        if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
            target_compile_options(${target} PRIVATE -fsanitize=address,undefined)
            target_link_options(${target} PRIVATE -fsanitize=address,undefined)
        elseif(MSVC)
            # Add MSVC equivalent if necessary
        endif()
endfunction()

# Function to apply common compile and link options
function(set_release_options target)
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        target_compile_options(${target} PRIVATE
            -O3                # Max optimization
            -g3                # Debugging info
            -march=native      # Enable CPU-specific optimizations
            -funroll-loops     # Unroll loops
            -fopenmp           # OpenMP for multithreading
            -ffast-math        # Fast math optimizations
            -Wstack-usage=4096 # Warn for large stack usage
            -Wall              # Enable all warnings
            -Wextra            # Enable extra warnings
            -Wpedantic         # Enable pedantic warnings
            -Werror            # Treat warnings as errors
        )
        target_link_options(${target} PRIVATE -flto) # Link-time optimization
    elseif(MSVC)
        target_compile_options(${target} PRIVATE /O2 /GL)
        target_link_options(${target} PRIVATE /LTCG)
    endif()
endfunction()

function(set_debug_options target)
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        target_compile_options(${target} PRIVATE
            -g3                # Debugging info
            -Wstack-usage=4096 # Warn for large stack usage
            -Wall              # Enable all warnings
            -Wextra            # Enable extra warnings
            -Wpedantic         # Enable pedantic warnings
            -Werror            # Treat warnings as errors
        )
        target_link_options(${target} PRIVATE -flto) # Link-time optimization
    elseif(MSVC)
        target_compile_options(${target} PRIVATE /O2 /GL)
        target_link_options(${target} PRIVATE /LTCG)
    endif()
endfunction()
