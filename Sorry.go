package main
  
import "fmt"
  
func main() {
  
    fmt.Print("Did I eat your souvlaki (y/n):")
    var UsrIn string
    fmt.Scanln(&UsrIn)
    if (UsrIn == "y" || UsrIn == "yes"){
    fmt.Println("I am terribly sorry")
    }
    if (UsrIn == "n" || UsrIn == "no"){
        fmt.Println("ok")
    }
}