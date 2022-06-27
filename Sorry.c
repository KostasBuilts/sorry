#include <stdio.h>
#include <string.h>

int main() {
    char UsrIn[3];
    printf("Did I eat your souvlaki (y/n):");
    scanf("%c", UsrIn);
    if( strcmp (UsrIn, "y") == 0 || strcmp (UsrIn, "yes") == 0)
    {
        printf("I am terribly sorry");
    }
    if(strcmp (UsrIn, "n") == 0|| strcmp (UsrIn, "no") == 0)
    {
        printf("ok");
    }
    return 0;
}
