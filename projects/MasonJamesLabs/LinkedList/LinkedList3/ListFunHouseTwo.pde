import static java.lang.System.*;

public class ListFunHouseTwo
{
  private ListNode theList = null;
  
  public void add(String data)
  {
    if(theList == null){
     theList = new ListNode(data, null); 
     theList.setNext(theList);
    }else{
     ListNode first = theList;
     ListNode last = theList;
     theList = theList.getNext();
     while(theList != first){
       last= theList;
       theList = theList.getNext();
     }
     last.setNext(new ListNode(data, first));
    } 
  }
  
  //this method will return the number of nodes present in list
  public int nodeCount()
  {
     int count=0;
     ListNode temp = theList;
     while(temp!=null){
       count++;
       temp = temp.getNext();
     }
     return count;
  }
    
  //this method will create a new node with the same value as the first node and add this
  //new node at the front of the list.  Once finished, the first node will occur twice.
  public void doubleFirst()
  {
    theList.setNext(new ListNode(theList.getValue(), theList.getNext()));      
  }

  //this method will create a new node with the same value as the last node and add this
  //new node at the end.  Once finished, the last node will occur twice.
  public void doubleLast()
  {
    ListNode first = theList;
    ListNode last = theList;
    first = first.getNext();
    while(first != theList){
      last = first;
      first = first.getNext();
    }
    last.setNext(new ListNode(last.getValue(),theList));  
  }
  
  //method skipEveryOther will remove every other node
  public void skipEveryOther()
  {
    removeXthNode(2);
  }

  //this method will set the value of every xth node in the list
  public void setXthNode(int x, Comparable value)
  {
    ListNode first = theList;
    ListNode last = theList;
    int count=1;
    ListNode temp = theList;
    first = first.getNext();
    while(first != theList){
      if(count%x == 0)
        temp.setValue(value);
      temp = temp.getNext();
      count++;
    }
  }  

  //this method will remove every xth node in the list
  public void removeXthNode(int x)
  {
    int count = 1;
    ListNode prev = null;
    ListNode temp = theList;
    
    ListNode first = theList;
    ListNode last = theList;
    theList = theList.getNext();
    while(theList != first){
      if(count % x == 0)
      {
        prev.setNext(temp.getNext());
      }
      prev = temp;
      temp = temp.getNext();
      count++;
      
      last = theList;
      theList = theList.getNext();
    }
  }
  
  //this method will return a String containing the entire list
   public String toString()
   {
      String output = "";
    ListNode first = theList;
    while(first.getNext() != theList){
      output+=(String) first.getValue() + ", ";
      first = first.getNext();
    }
    output+=first.getValue();
     return output;
   }      
}
