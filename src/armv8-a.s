.text

.global fast_add
.global fast_sub
.global fast_mul
.global fast_div

 fast_add:
    sub sp, sp, #16     // Allocate 16 bytes of stack space
    str w0, [sp, #12]   // Store first argument (w0) at sp+12
    str w1, [sp, #8]    // Store second argument (w1) at sp+8
    
    ldr w8, [sp, #12]   // Load the first argument into w8
    ldr w9, [sp, #8]    // Load the second argument into w9
    add w0, w8, w9      // Add w8 and w9, store result in w0
    add sp, sp, #16     // Deallocate 16 bytes of stack space
    ret                 // Return from subroutine

fast_sub:
    sub sp, sp, #16     // Allocate 16 bytes of stack space
    str w0, [sp, #12]   // Store first argument (w0) at sp+12
    str w1, [sp, #8]    // Store second argument (w1) at sp+8

    ldr w8, [sp, #12]   // Load the first argument into w8
    ldr w9, [sp, #8]    // Load the second argument into w9
    subs w0, w8, w9     // Subtract w9 from w8, store result in w0
    add sp, sp, #16     // Deallocate 16 bytes of stack space
    ret                 // Return from subroutine

fast_mul:
    sub sp, sp, #16     // Allocate 16 bytes of stack space
    str w0, [sp, #12]   // Store first argument (w0) at sp+12
    str w1, [sp, #8]    // Store second argument (w1) at sp+8

    ldr w8, [sp, #12]   // Load the first argument into w8
    ldr w9, [sp, #8]    // Load the second argument into w9
    mul w0, w8, w9      // Multiply w8 and w9, store result in w0
    add sp, sp, #16     // Deallocate 16 bytes of stack space
    ret                 // Return from subroutine

fast_div:
    sub sp, sp, #16     // Allocate 16 bytes of stack space
    str w0, [sp, #12]   // Store first argument (w0) at sp+12
    str w1, [sp, #8]    // Store second argument (w1) at sp+8

    ldr w8, [sp, #12]   // Load the first argument into w8
    ldr w9, [sp, #8]    // Load the second argument into w9
    sdiv w0, w8, w9     // Divide w8 by w9, store result in w0
    add sp, sp, #16     // Deallocate 16 bytes of stack space
    ret                 // Return from subroutine   
