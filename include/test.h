#pragma once

#include <stdio.h>
#include <assert.h>

int fast_add(int x, int y);
int fast_sub(int x, int y);
int fast_mul(int x, int y);
int fast_div(int x, int y);

void run_tests(void) {
    assert(fast_add(2, 3) == 5);
    assert(fast_add(-1, -1) == -2);
    assert(fast_add(0, 0) == 0);
    printf("Add tests passed!\n");

    assert(fast_sub(5, 3) == 2);
    assert(fast_sub(-1, -1) == 0);
    assert(fast_sub(0, 0) == 0);
    printf("Sub tests passed!\n");

    assert(fast_mul(2, 3) == 6);
    assert(fast_mul(-1, -1) == 1);
    assert(fast_mul(0, 5) == 0);
    printf("Mul tests passed!\n");

    assert(fast_div(6, 3) == 2);
    assert(fast_div(-4, -2) == 2);
    assert(fast_div(5, 2) == 2);
    printf("Div tests passed!\n");
}
