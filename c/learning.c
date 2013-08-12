#include <stdio.h>

int main(){
    // charactor 8 bits
    char c1 = 'C'; // Uppercase
    char c2 = '\n'; // new line
    char c3 = '\0'; // null charactor
    char c4 = '\012'; // 12 in octal == 10 decimal
    unsigned char uc = 'F' // max to 255
    
    // short 16 bits ~-32k..32k
    short sh = 11;

    // int 16/32 bits
    int i1;
    i1 = 5;
    int i2 = i1 + 42L; // long int
    int i3 = 0x10 // 16 in decimal
    int i4 = 012  // 10 in decimal
    int i5 = 5 * 1024L  // 5 Kbytes

    printf ("%c\n", c1);
    // long 32 bits , long long 64 bits
    // float, single precision (6 digits) floating point 32 bits
    // double, Double precision floating (15 digits) point 64 bits
    // long double, bigger floating point
    float f1 = 1.1;
    double d1 = 3.14;

    char ch;
    ch = i1; // truncation of an int value to fit in a char
             // with drop upper bit (- 256)

    int score = 10;
    score = (score / 20) * 100; // got 0
    score = ((double)score / 20) * 100; // ok
    score = (score / 20.0) * 100; // ok
    score = (int)(score / 20.0) * 100; // 0

    int i;
    i = 0;
    // 0 as false, otherwise true
    while(i - 10){
        i++; // post 
        ++i; // pre
        i--;
    }
    
    i = 10;
    int j;
    j = (i++ + 20);
    // i is 11
    // j = 30
    j = (++i + 20);
    // i is 12
    // j is 22

    // Operators
    // == , != , > , < , >= , <=
    
    // Logical Operators
    // ! , && , ||
    
    // Bitwise Operators
    // ~ , & , | ,
    // ^   - xor
    // >>  - Right Shift (divied by power of 2)
    // <<  - Left Shift (multiply by power of 2)

    // Other Assignment Operators
    // += , -=
    // *= , /=
    // %=
    // >>= , <<=
    // &=, |= , ^=
    
    // Control Flow
    switch (i){
        case 1:
            break;
        case 2:
            break;
        case 3:
        case 4:
            break;
        default:
    }

    do {
        i--;
        if(i > 10) break;
        if(i == 5) continue;
    } while(i)

    for(i = 0; i < 10; i++){
    
    }

    // Complex Data Types
    struct fraction{
        int numerator;
        int denominator;
    };

    struct fraction f1, f2;
    f1.numerator = 22;
    f1.denominator = 7;
    f2 = f1; // this copies over the whole struct

    // Array
    int scores[10];
    scores[0] = 12;
    scores[9] = 99;  // set last element

    int board[10][10];
    board[0][0] = 12;
    board[9][9] = 12;

    struct fraction numbers[10];
    numbers[0].numerator = 22;
    numbers[0].denominator = 7;

    // Pointer
    int* intPtr;
    int * intPtr;
    int *intPtr;
    struct fraction* fp;
    struct fraction** fp; // pointer to pointer
    struct fraction* fp[2]; // an array of 3 pointers to struct fractions

    // nested struct
    struct node {
        int data;
        struct node* next;
    }

    void foo {
        int *p; // pointer to int
        int i; 
        p = &i; // set p to point to i
        *p = 12; // change what p points to

        int *a;
        a = NULL;

        int *b;
        *b = 12; // !! set 12 to random address
        b = &(fp.numerator);
    }
    
    // String is array of char with null at the end
    char localString[10];
    strcpy(localString, "hello");
    // [h,e,l,l,o,0,x,x,x,x]
    int len = strlen(localString); // 5
    // doing reverse string
    int i, j;
    char temp;
    for(i = 0, j = len - 1; i < j; i++, j--){
        temp = localString[i];
        localString[i] = localString[j];
        localString[j] = temp;
    }

    // TypeDef
    typedef struct fraction Fraction;
    Fraction fc;

    typedef struct treenode* Tree;
    struct treenode {
        int data;
        Tree small, larger;
    }

    // Functions
    // static function allow for using in the same file
    static int twice(int num){
        int result = num * 3;
        result = result - num;
        return result;
    }

    int num = 3;
    int a = 2;
    int b = 3;
    a = twice(a);
    b = twice(b + num);

    void swap(int* a, int* b) {
        int temp;
        temp = *a;
        *a = *b;
        *b = temp;
    }
    swap(&a, &b);

    void foo(const struct fraction* unchange){
        int x = unchange.numerator; 
    }

    // ---------------------------------------------------
    // Odds and Ends
    // main() is where the programe start running
    // Prototypes
    int twice(int num);
    void swap(int* x, int* y);

    // Preprocessor
#if MAX
#define MIN 20
#else
#define MAX 100
#define WORD just_a_string
#endif

#include "./user.h" // user.h contains the prototypes for the functions in user.c
#include <system.h>

#pragma once // prevent including .h file more than once in anyone file

    // Assert
    assert(i < 10);
    
    // -------------------------------------------------------
    // Advanced Arrays and Pointers
    // Advancd C Arrays
    int intArray[6];
    intArray[3] = 11;
    // (intArray + 3) eqv to (&(intArray[3]))
    int* p;
    p = &(intArray[2]);
    p++ // intArray[3]
    p[0] = 10;

    // Heap Memory
    int a[100];
    int *b;
    b = (int*) malloc( sizeof(int) * 100); // allocate mem for b for 100 bytes
    a[12] = 33;
    b[12] = 44;
    free(b); // free the memory

    // Standard Lib
    // stdio.h      file input and output
    // ctype.h      character tests
    // string.h     string operations
    // math.h       mathematical fn such as sin() and cos()
    // stdlib.h     utility fn as malloc(), rand() 
    // assert.h     debugging macro
    // stdarg.h     support for fn with variable numbers of arguments
    // setjmp.h     support for non-local flow control jumps
    // signal.h     support for exceptional condition signals
    // time.h       date and time
    // limits.h, float.h    constants which define type range values such as INT_MAX
    
    return 0;
}
