#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "test.h"

int main(int argc, char **argv) {
	if (argc != 4 && argc != 2) {
		fprintf(stderr, "Usage: %s [add|sub|mul|div|test] [x] [y]\n", *argv);
		exit(EXIT_FAILURE);
	}

	char *operation = argv[1];
	
	if (strcmp(operation, "test") == 0) {
        run_tests();
        return 0;
    }

	if (argc != 4) {
        fprintf(stderr, "Usage: %s [add|sub|mul|div|test] [x] [y]\n", *argv);
        exit(EXIT_FAILURE);
    }

	int x = atoi(argv[2]);
	int y = atoi(argv[3]);
	int result = 0;

	char *symbols[] = {"+", "-", "*", "/"};
    char *symbol = NULL;

	if (strcmp(operation, "add") == 0) {
		result = fast_add(x, y);
	} else if (strcmp(operation, "sub") == 0) {
		result = fast_sub(x, y);
	} else if (strcmp(operation, "mul") == 0) {
		result = fast_mul(x, y);
	} else if (strcmp(operation, "div") == 0) {
		if (y == 0) {
			fprintf(stderr, "Division by zero\n");
			exit(EXIT_FAILURE);
		}
		result = fast_div(x, y);
	} else {
		fprintf(stderr, "Invalid operation: %s\n", operation);
		exit(EXIT_FAILURE);
	}

	symbol = symbols[strcmp(operation, "add") == 0 ? 0 : strcmp(operation, "sub") == 0 ? 1 : strcmp(operation, "mul") == 0 ? 2 : 3];
	printf("%d %s %d = %d\n", x, symbol, y, result);

	return 0;
}
