//---------------------------------------------------------------------------

#pragma hdrstop

//---------------------------------------------------------------------------

#include <stdlib.h>
#include <string.h>
#include <iostream.h>

class node
{
  public:
  char data;
  node *next;
  node();
};

node::node()
{

}


#pragma argsused
int run()
{
   char s[]="abcdefghijklmnopqrstuvwxyz";

   node *head;
   node *temp;
   node *current;

   head = new node;          // create the head of the linked list
   head->data = s[0];
   head->next = NULL;
   temp = head;   // get ready for the loop - save the head in temp - you are going to change temp in the loop

   for(size_t i=1; i < strlen(s); i++)      // create the rest of the linked list
   {
    current = new node;    // make a new node
    current->data = s[i];  // set it's data member
    current->next = NULL;
    temp->next = current;  // point to the new node
    temp = current;        // make temp point to current node (for next time through)
   }

   node *ptr = head;    // set a ptr to head, then you are going to "increment" the pointer

   while (ptr != NULL)
   {
     cout << ptr->data; // print out the linked list
     ptr = ptr->next;   // increment the linked list
   }

   cout << endl;
   system("pause");
   return 0;
}
//---------------------------------------------------------------------------
