#include <assert.h>
#include <stdio.h>

#include "solve.h"

int main(void) {
    assert(fizz_buzz(10) == 23);
    assert(fizz_buzz(1000) == 233168);
    printf("all tests passed\n");
    return 0;
}
