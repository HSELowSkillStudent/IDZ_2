#include <stdio.h>
#define SIZE 10001

struct SIGN {
    size_t point;          // .
    size_t comma;          // ,
    size_t semicolon;      // ;
    size_t colon;          // :
    size_t exclamation;    // !
    size_t question;       // ?
    size_t dash;           // -
    size_t left_bracket;   // (
    size_t right_bracket;  // )
    size_t single_quote;   // '
    size_t double_quote;   // "
} result;

void countSignes(const char *input) {
    char a;
    for (size_t i = 0; i < SIZE; i++) {
        a = input[i];
        if (a == '\0') {
            break;
        }
        switch (a) {
            case '.':
                result.point++;
                break;
            case ',':
                result.comma++;
                break;
            case ';':
                result.semicolon++;
                break;
            case ':':
                result.colon++;
                break;
            case '!':
                result.exclamation++;
                break;
            case '?':
                result.question++;
                break;
            case '-':
                result.dash++;
                break;
            case '(':
                result.left_bracket++;
                break;
            case ')':
                result.right_bracket++;
                break;
            case '\'':
                result.single_quote++;
                break;
            case '\"':
                result.double_quote++;
                break;
            default:
                break;
        }
    }
}

void outputStruct(FILE *output) {
    if (result.point != 0) {
        fprintf(output, "<.>: %zu\n", result.point);
    }
    if (result.comma != 0) {
        fprintf(output, "<,>: %zu\n", result.comma);
    }
    if (result.semicolon != 0) {
        fprintf(output, "<;>: %zu\n", result.semicolon);
    }
    if (result.colon != 0) {
        fprintf(output, "<:>: %zu\n", result.colon);
    }
    if (result.exclamation != 0) {
        fprintf(output, "<!>: %zu\n", result.exclamation);
    }
    if (result.question != 0) {
        fprintf(output, "<?>: %zu\n", result.question);
    }
    if (result.dash != 0) {
        fprintf(output, "<->: %zu\n", result.dash);
    }
    if (result.left_bracket != 0) {
        fprintf(output, "<(>: %zu\n", result.left_bracket);
    }
    if (result.right_bracket != 0) {
        fprintf(output, "<)>: %zu\n", result.right_bracket);
    }
    if (result.single_quote != 0) {
        fprintf(output, "<\'>: %zu\n", result.single_quote);
    }
    if (result.double_quote != 0) {
        fprintf(output, "<\">: %zu\n", result.double_quote);
    }
}
