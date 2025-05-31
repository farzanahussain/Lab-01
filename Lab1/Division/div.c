#include <stdio.h>

int main() {
    float a, b, quotient;

    printf("Enter two numbers: ");
    scanf("%f %f", &a, &b);

    if (b != 0) {
        quotient = a / b;
        printf("Quotient = %.2f\n", quotient);
    } else {
        printf("Error: Division by zero is not allowed.\n");
    }

    return 0;
}
