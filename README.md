# cmake-library

## Installation

```bash
cmake -DCMAKE_BUILD_TYPE=Debug -S . -B build
cmake --build build
./build/my_target
cmake --install build
```
## Usage

```cmake
enable_sanitizers(my_target)

```
