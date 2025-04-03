# Function to apply sanitizer flags to a target
function(enable_sanitizers target)
        if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
            target_compile_options(${target} PRIVATE -fsanitize=address,undefined,signed-integer-overflow,null,leak)
            target_link_options(${target} PRIVATE -fsanitize=address,undefined,signed-integer-overflow,null,leak)
        elseif(MSVC)
            # Add MSVC equivalent if necessary
        endif()
endfunction()

function(enable_sanitizer_thread target)
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        target_compile_options(${target} PRIVATE -fsanitize=thread)
        target_link_options(${target} PRIVATE -fsanitize=thread)
    elseif(MSVC)
        # Add MSVC equivalent if necessary
    endif()
endfunction()

# Function to apply common compile Warnings and Errors
function(set_warnings_and_errors target)
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        target_compile_options(${target} PRIVATE
            -g3                # Debugging info
            -Wall              # Enable all warnings
            -Wextra            # Enable extra warnings
            -Wpedantic         # Enable pedantic warnings
            -Werror            # Treat warnings as errors
            # -Wstack-usage=4096 # Warn for large stack usage
            -pedantic # Enable pedantic warnings
            -Wconversion # Warn for implicit conversions
            -Wsign-conversion # Warn for sign conversions
            -Wnull-dereference # Warn for null dereferences
            -Wdouble-promotion # Warn for implicit double promotions
            -Wformat=2 # Warn for format errors
            -Wduplicated-cond # Warn for duplicated conditions
            -Wduplicated-branches # Warn for duplicated branches
            -Wlogical-op # Warn for logical operations
            -Wuseless-cast # Warn for useless casts
            -Wshadow # Warn for shadowed variables
            -Wuninitialized # Warn for uninitialized variables
            -Wunreachable-code # Warn for unreachable code
            -Wunused # Warn for unused variables
        )
    elseif(MSVC)
        target_compile_options(${target} PRIVATE /W4 /WX)
    endif()
endfunction()

# Function to apply common compile and link options
function(set_release_options target)
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        target_compile_options(${target} PRIVATE
            -O3                # Max optimization
        )
        target_compile_definitions(${target} PRIVATE NDEBUG) # Disable asserts
        target_link_options(${target} PRIVATE -flto) # Link-time optimization
    elseif(MSVC)
        target_compile_options(${target} PRIVATE /O2 /GL)
        target_link_options(${target} PRIVATE /LTCG)
    endif()
endfunction()
