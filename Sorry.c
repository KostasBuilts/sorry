#include <stdio.h>

int main() {
    char UsrIn[3];
    printf("Did I eat your souvlaki (y/n):");
    scanf("%s", UsrIn);
    if(UsrIn == "y")
    {
        printf("I am terribly sorry");
    }
    if(UsrIn == "n" || UsrIn == "no")
    {
        printf("ok");
    }
    return 0;
}