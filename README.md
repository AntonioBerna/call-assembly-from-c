# How to call Assembly functions from C

## Introduction

This is a simple project that combine the power of `Assembly` language with the power of `C` language. In this project I have create a basic calculator with the four fundamental operations, namely sum, subtract, multiplication and division. Obviously this is not a large-scale production project, but it represents a tool for educational purposes. In fact, in this project two versions of `Assembly` language were implemented and used: `AT&T` and `Intel`.

> [!WARNING]
> The `Assembly` used in this repository is not compatible with `ARM` processors, so you won't be able to use it on ARM-based computers like the `Raspberry Pi`. If you are interested in the development of the `Assembly` language on `ARM` platforms you can open a dedicated `issue` in the appropriate section.

> [!WARNING]
> This code has only been tested on `Manjaro Linux`. If you experience problems using other operating systems, such as `Windows` or `macOS`, make sure you have the appropriate skills or risk damaging your equipment.

## Mini docs

Download the repository to your computer using the following command:

```shell
git clone https://github.com/AntonioBerna/call-x86-from-c.git
```

once we are inside the project folder we can use one of the following programs:

```shell
./build.sh ATT
# or
./build.sh intel
# or
./build.sh clean
```

in fact, leaving aside the last command which is used to eliminate the final executables, the first two commands represent the type of `Assembly` that is used and therefore combined with the `C` language. Obviously we are not talking about architecture, but only and exclusively about syntax preferences. In fact, the dear `AT&T Assembly` has for each instruction it uses a syntax of the type:

```assembly
istrX %source, %destination
```

where `X` represents the number of bytes of registers that will be used as source and destination. In particular we can choose between `b` (1 byte = 8 bits), `l` (2 bytes = 16 bits), `w` (4 bytes = 32 bits) and `q` (8 bytes = 64 bits). This type of `Assembly` is a classic but can sometimes be cumbersome. In fact, for this very reason many people prefer to use or read the `Intel Assembly`:

```assembly
istr source, destination
```

As we can see, by not having to specify the number of bytes/bits, by not having to specify the `%` symbol and by not having to specify the `$` symbol for immediate values, this syntax is simpler and more pleasant.

Once the command has been chosen, the executable file will be created inside the `build` directory. Therefore we can run our code using the following command:

```shell
./build/ATT-calculator
# or
./build/intel-calculator
```

getting the following message:

```shell
Usage: ./build/ATT-calculator [add|sub|mul|div|test] [x] [y]
# or
Usage: ./build/intel-calculator [add|sub|mul|div|test] [x] [y]
```

Then simply follow the instructions in the message obtained to use the program correctly.

> [!NOTE]
> I would like to point out that there is also the `test` option which allows us to execute a function to test some very simple operations.

## How to read Assembly code

The `System V Application Binary Interface (ABI)` is a set of conventions used on Unix-like operating systems, such as `Linux` and `Solaris`, to define how functions should be called and how data should be passed between functions in a compiled program. `System V ABI` calling conventions for 64 bit systems include:

- Return Register: The return value of a function is stored in the `RAX` register.

- Parameter passing: The first six integers or pointers are passed into registers `RDI`, `RSI`, `RDX`, `RCX`, `R8` and `R9`. The other parameters are passed onto the `stack`, in order from left to right.

- Saving registers: The called function must save the `RBX`, `RSP`, `RBP`, `R12`, `R13`, `R14`, and `R15` registers if it uses them and restore them before returning control to the caller.

- Stack alignment: The `stack` must always be aligned to a multiple of 16 bytes at the start of a function.

- Data Structure Conventions: Data structures smaller than 16 bytes and unions are passed into registers if possible. Data structures larger than 16 bytes are passed by reference.

- Management of local variables: Local variables are usually allocated on the `stack`, moving the stack pointer (`RSP`).

- Handling function calls: The calling function is responsible for cleaning up the `stack` after the call, removing passed parameters.

These conventions are designed to maximize the efficiency and interoperability of programs on operating systems that adopt the `System V ABI` for 64 bit architectures. They ensure that functions can communicate consistently and that code can be effectively optimized by the compiler.
