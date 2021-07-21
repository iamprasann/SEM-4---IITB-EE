// Prasann Viswanathan
// 190070047
// h190070047
// Minor 

// I pledge on my honour that I have not given or received any unauthorized assistance on this assignment or any previous task.

// Reference:
// https://stackoverflow.com/questions/793950/algorithm-for-deleting-one-element-in-an-single-linked-list-with-o1-complexity 

#include <bits/stdc++.h> 
using namespace std; 

// Link list node
class Node { 
public: 
    int value; 
    Node* next; 
};
/* You Should NOT Modify Anything Above This */

/* 
headPtr is a reference to the head node(i.e. pointer to pointer) and
deleteNodePtr is the node which is to be deleted. You can see the Node definition above.
It is guaranteed that deleteNodePtr will not point to the last element.
*/ 
void deleteNode(Node** headPtr, Node* deleteNodePtr) {
//     Node* temp = *headPtr;
//     Node* prev = NULL;
    
//     while (temp!= deleteNodePtr){
//         prev = temp;
//         temp = temp->next;
//     }
//     prev->next = temp->next;
//     delete temp;
 
//     Solution abandoned as it was too slow.
    
    // Simply copying contents of node in front and deleting the next node
    Node* ahead = deleteNodePtr->next;
    deleteNodePtr->value = ahead->value;
    deleteNodePtr->next = ahead->next;
    
    delete ahead;
}

/* You Should NOT Modify Anything Below This */
int main() {
    Node* head = NULL;

    int n;
    cin>>n;

    vector <int> values(n);
    vector <Node*> pointers(n);

    for(int i=0;i<n;i++){
        cin>>values[i];
    }

    for(int i=n-1;i>=0;i--){
        
        // creating the node in the linkedList
        Node* newNode = new Node();
        newNode->value = values[i];
        newNode->next = head;
        head = newNode;

        pointers[i] = newNode;
    }

    for(int i=n-2;i>=0;i--){
        deleteNode(&head, pointers[i]);
        if(i>=n-6){
            Node* temp = head;
            while(temp != NULL){
                cout<<temp->value<<" ";
                temp = temp->next;
            }
            cout<<endl;
        }
    }
}