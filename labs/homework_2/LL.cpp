// LL.cpp : Defines the entry point for the console application.
//

#include <string.h>
#include <cstdlib>
#include <iostream>

using namespace std;


class node
{
  public:
  char data;
  node *next;
  node *prior;
  node();
};

node::node()
{

}

int main(int argc, char* argv[])
{
  char s[]="abcdefghijklmnopqrstuvwxyz";

  node *head;
  node *tail;
  node *temp;
  node *current;

  head = new node;          // create the head of the linked list
  head->data = s[0];
  head->next = NULL;
  head->prior = NULL;
  temp = head;   // get ready for the loop - save the head in temp - you are going to change temp in the loop
  cout << "Temp is set to Head: " << s[0] << endl;

  // create the rest of the linked list
  for(size_t i=1; i < strlen(s); i++) {
    current = new node;    // make a new node
    current->data = s[i];  // set it's data member
    cout << "Current data is set to " << s[i] << endl;
    current->next = NULL;
    current->prior = temp;

    temp->next = current;  // point to the new node
    cout << "Temp next is set to current" << endl;

    temp = current;        // make temp point to current node (for next time through)
    cout << "Temp is set to current" << endl;
    cout << "Temp prior is set to current" << endl << endl;
    tail = current;
  }


  node *ptr = head;    // set a ptr to head, then you are going to "increment" the pointer

  while (ptr != NULL)
  {
   cout << ptr->data; // print out the linked list
   ptr = ptr->next;   // increment the linked list
  }

  cout << endl;

  node *fooptr = tail;    // set a ptr to head, then you are going to "increment" the pointer

  while (fooptr != NULL)
  {
   cout << fooptr->data; // print out the linked list
   fooptr = fooptr->prior;   // increment the linked list
  }

  cout << endl;
  system("pause");
  return 0;
}

