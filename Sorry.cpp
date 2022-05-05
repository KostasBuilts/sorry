#include <iostream>
#include <string>

int main() {
    std::string UsrIn;
    std::cout << "Did I eat your souvlaki (y/n):";
    std::cin >> UsrIn;
    if(UsrIn == "y" || UsrIn == "yes")
    {
        std::cout << "I am terribly sorry";
    }
    if(UsrIn == "n" || UsrIn == "no")
    {
        std::cout << "ok";
    }
    return 0;
}