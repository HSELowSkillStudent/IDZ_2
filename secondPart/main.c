#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "func.c"

void random_array(char *input, size_t size) {
    if (size > SIZE - 1) {
        printf("Длина строки не должна первышать 10000 символов\n");
        exit(-1);
    }
    // генерация строки
    for (size_t i = 0; i < size; i++) {
        input[i] = rand() % 176 + 32;
    }
    input[size] = '\0';

}

int main(int argc, char *argv[]) {
    srand(time(NULL));
    long long start, end;
    char input[SIZE];
    for (int i = 0; i < 10; i++) {
        printf("test %d\n", i);
        int size = rand() % (SIZE - 1);
        random_array(input, size);
        start = time(NULL);
        for (int j = 0; j < 10000000; j++) {
            countSignesNO(input);
        }
        end = time(NULL);
        
        printf("\tunoptimized function time:\t%lld\n", (end - start) % 1000);
        start = time(NULL);
        for (int j = 0; j < 10000000; j++) {
            countSignesNO(input);
        }
        end = time(NULL);
        printf("\toptimized function time:  \t%lld\n\n", (end - start) % 1000);
        
    }
    
    return 0;
}

