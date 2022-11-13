#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "func.c"
#define SIZE 10001

char input[SIZE];
void outputResult(FILE *output) {
    fprintf(output, "В строку вошли такие знаки препинания:\n");
    outputStruct(output);
    if (output != stdout) {
    	printf("Ответ записан в файл\n");
    }
}

void random_input(size_t size) {
    if (size > SIZE - 1) {
        printf("Длина строки не должна первышать 10000 символов\n");
        exit(-1);
    }
    // генерация строки
    printf("Сгенерированная строка:\n");
    for (size_t i = 0; i < size; i++) {
        input[i] = rand() % 176 + 32;
        printf("%c", input[i]);
    }
    input[size] = '\0';
    printf("\n");
    countSignes(input);
    outputResult(stdout);
}

void file_input(char input_name[], char output_name[]) {
    char input[SIZE];
    FILE *input_file, *output_file;
    input_file = fopen(input_name, "r");

    // fgets(input, SIZE, input_file);
    int i;
    for (i = 0; i < SIZE - 1; i++) {
    	input[i] = fgetc(input_file);
    }
    i++;
    input[i] = '\0';
    
    fclose(input_file);

    countSignes(input);

    output_file = fopen(output_name, "w");
    outputResult(output_file);
}

void arg_input(int argc, char *argv[]) {
    if (strlen(argv[1]) > SIZE) {
        printf("Длина строки не должна первышать 10000 символов\n");
        exit(-1);
    }
    countSignes(argv[1]);
    outputResult(stdout);
}

void def_input(char *input1) {
    printf("Введите строку, длинной не более 10000 символов:\n");
    fgets(input1, SIZE - 1, stdin);
    countSignes(input1);
    outputResult(stdout);
}


int main(int argc, char *argv[]) {
    srand(time(NULL));
    if (argc == 1) {
        // вызов функции, взаимодействей с консолью
        def_input(input);
    } else if (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help")) {
        printf("keys:\n-h (--help)  - displays a list of keys\n-r [int] (--random [int])  - sets a random data set. \n-f [string] [string] (--file [string] [string])  - the program works with files entered by the following two arguments\n");
    } else if (!strcmp(argv[1], "-r") || !strcmp(argv[1], "--random")) {
        // вызов функции, задающей массив, а через генератор случайных чисел. Рзамер задается после флага
        if (argc == 3) {
            random_input(atof(argv[2]));
        } else {
            printf("Нет числа - размера строки. Чтобы получить информацию о ключах, используйте флаг -h (--help)\n");
        }
    } else if (!strcmp(argv[1], "-f") || !strcmp(argv[1], "--file")) {
        // работа с файлами
        file_input(argv[2], argv[3]);
    } else {
        // работа с аргументами
        arg_input(argc, argv);
    }
    return 0;
}

