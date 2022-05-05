using System;

namespace HelloWorld
{
  class Program
  {
    static void Main(string[] args)
    {
      bool SvlkEaten = false;
      Console.WriteLine("Did I eat your souvlaki (y/n):");
      string UsrIn = Console.ReadLine();
      switch(UsrIn)
      {
      	case "y":
        case "yes":
          Console.WriteLine("I am terribly sorry");
          break;
          
        case "n":
        case "no":
          Console.WriteLine("Ok");
          break;
      }
    }
  }
}