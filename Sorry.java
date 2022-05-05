import java.util.Scanner;
class Main 
{
  public static void main(String[] args) 
  {
    Scanner scner = new Scanner(System.in);
    System.out.println("Did I eat your souvlaki (y/n):");
    String UsrIn = scner.nextLine();
    switch(UsrIn)
      {
      	case "y":
        case "yes":
          System.out.println("I am terribly sorry");
          break;
          
        case "n":
        case "no":
          System.out.println("Ok");
          break;
        }
    }
}