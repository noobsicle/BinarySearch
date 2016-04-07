
private Item[] store = {
  new Item(184, 14), 
  new Item(196, 60), 
  new Item(206, 31), 
  new Item(2370, 65), 
  new Item(7282, 73), 
  new Item(8303, 90), 
  new Item(12328, 63), 
  new Item(12705, 14), 
  new Item(13066, 8), 
  new Item(14088, 92), 
  new Item(15320, 82), 
  new Item(15814, 60), 
  new Item(15917, 51), 
  new Item(17911, 96), 
  new Item(18061, 3), 
  new Item(18410, 56), 
  new Item(18465, 27), 
  new Item(18618, 64), 
  new Item(18871, 69), 
  new Item(19967, 45)
  };                             
  public int linearSearch(int catNumToFind)
  {
    int myN = 0;
    //complete this method
    for (int i = 0; i<store.length; i++) {
      if (store[i].getCatNum()==catNumToFind) {
        myN+=store[i].getInventory();
      }
    }
    if (myN>0) {
      return myN;
    } else
      return -1;
  }
public int binarySearch(int catNumToFind)
{

  int low = 0;
  int high = store.length-1;
  //complete this method  

  while (low<=high) {
    int guess = (high+low)/2;
    int myN = 0;
    if (store[guess].getCatNum()==catNumToFind) {
      myN+=store[guess].getInventory();
      return myN;
    } else if (store[guess].getCatNum()>catNumToFind) {
      high=guess-1;
      guess=(high+low)/2;
    } else if (store[guess].getCatNum()<catNumToFind) {
      low=guess+1;
      guess=(high+low)/2;
    }
  }
  return -1;
}
public int binarySearch(int catNumToFind, int nLow, int nHigh)
{
  //complete this method    
   int guess = (nHigh+nLow)/2;
    if(nLow>nHigh){
       return -1;
     }
    else if(store[guess].getCatNum()>catNumToFind){
      return binarySearch(catNumToFind,nLow,guess-1);
     }
    else if(store[guess].getCatNum()<catNumToFind){
      return binarySearch(catNumToFind,guess+1,nHigh);
     }
    else{
      return store[guess].getInventory();
     }
  
}
public void setup()
{
  int[] tests = {
    0, 183, 184, 2370, 15320, 19967, 19968
  };
  System.out.println();
  System.out.println("Testing Linear Search");
  System.out.println("=====================");
  for (int i = 0; i < tests.length; i++)
  {

    if (linearSearch(tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+linearSearch(tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Non Recursive Binary Search");
  System.out.println("===================================");
  for (int i = 0; i < tests.length; i++)
  {

    if (binarySearch(tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+binarySearch(tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Recursive Binary Search");
  System.out.println("===============================");
  for (int i = 0; i < tests.length; i++)
  {

    if (binarySearch(tests[i], 0, store.length - 1) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+binarySearch(tests[i], 0, store.length - 1) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
}

public void draw()
{
  //empty!
}




