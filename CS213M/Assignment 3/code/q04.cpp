// Prasann Viswanathan
// 190070047
// h190070047
// Minor 

// I pledge on my honour that I have not given or received any unauthorized assistance on this assignment or any previous task.

// Reference: 
// https://www.geeksforgeeks.org/doubly-linked-list/
// https://www.geeksforgeeks.org/implementation-deque-using-doubly-linked-list/
// https://www.geeksforgeeks.org/vector-in-cpp-stl/

// #include <bits/stdc++.h>
// using namespace std;

// class Node{
//     public:
//     int data;
//     Node *prev, *next;
    
//     static Node* getnode(int data){
//         Node* newNode = (Node*)malloc(sizeof(Node));
//         newNode->data = data;
//         newNode->prev = newNode->next = NULL;
//         return newNode;
//     }
// };

// class Deque{
//     public:Node* front;
//     Node* rear;
//     int Size;
 
//     //public:
//     Deque(){
//         front = rear = NULL;
//         Size = 0;
//     }
//     void insertRear(int data);
//     void insertIndex(int data, int idx);
//     void deleteIndex(int idx);
//     int getValue(int idx);
//     void rotate(int direction);
// };

// void Deque::insertRear(int data){
//     Node* newNode = Node::getnode(data);
//     if (rear == NULL)
//         front = rear = newNode;
//     else{
//         newNode->prev = rear;
//         rear->next = newNode;
//         rear = newNode;
//     }
//     Size++;
// }

// void Deque::rotate(int direction){
//     if(direction==1){
//         Node* temp = rear->prev;
//         temp->next = NULL;
//         rear->prev = NULL;
//         rear->next = front;
//         front->prev = rear;
//         front = rear;
//         rear = temp;
//     }
//     else{
//         Node* temp = front->next;
//         temp->prev = NULL;
//         front->next = NULL;
//         front->prev = rear;
//         rear->next = front;
//         rear = front;
//         front = temp;
//     }
// }

// int Deque::getValue(int idx){
//     if(idx<=(Size+1)/2){
//         Node *temp = front;
//         for(int i=2; i<=idx; i++)
//             temp = temp->next;
//         return (temp->data);
//     }
//     else{
//         Node *temp = rear;
//         for(int i=Size-1; i>=idx; i--)
//             temp = temp->prev;
//         return (temp->data);
//     }
// }

// void Deque::insertIndex(int data, int idx){      
//     if(idx<=(Size+1)/2){
//         Node *right = front;
//         for(int i=2; i<=idx; i++)
//             right = right->next;
//         Node *left = right->prev;

//         Node* newNode = Node::getnode(data);
//         if(left==NULL){
//             right->prev = newNode;
//             newNode->next = right;
//             front = newNode;
//         }
//         else{
//             left->next = newNode;
//             newNode->prev = left;
//             right->prev = newNode;
//             newNode->next = right;
//         }
//         Size++;
//         return;
//     }
//     else{
//         Node *right = rear;
//         for(int i=Size-1; i>=idx; i--)
//             right = right->prev;
//         Node *left = right->prev;

//         Node* newNode = Node::getnode(data);
//         if(right==NULL){
//             left->next = newNode;
//             newNode->prev = left;
//             rear = newNode;
//         }
//         else{
//             right->prev = newNode;
//             newNode->next = right;
//             left->next = newNode;
//             newNode->prev = left;
//         }
//         Size++;
//         return;
//     }
// }

// void Deque::deleteIndex(int idx){
//     if(idx<=(Size+1)/2){
//         Node *temp = front;
//         for(int i=2; i<=idx; i++)
//             temp = temp->next;
        
//         Node *left=temp->prev, *right=temp->next;
        
//         if(left==NULL){
//             front = right;
//             delete temp;
//         }
//         else{
//             left->next=right;
//             right->prev=left;
//             delete temp;
//         }
//         Size--;
//         return;
//     }
//     else{
//         Node *temp = rear;
//         for(int i=Size-1; i>=idx; i--)
//             temp = temp->prev;
        
//         Node *left=temp->prev, *right=temp->next;
        
//         if(right==NULL){
//             rear = left;
//             delete temp;
//         }
//         else{
//             left->next=right;
//             right->prev=left;
//             delete temp;
//         }
//         Size--;
//         return;
//     }
// }

// int main(){
//     ios_base::sync_with_stdio(false);
//     cin.tie(NULL);
    
//     Deque dq;
    
//     int N, Q;
//     cin>>N>>Q;
    
//     vector<int> values(N);
    
//     for(int i=0; i<N; i++){
//         cin>>values[i];
//         dq.insertRear(values[i]);
//     }
    
//     for(int i=0; i<Q; i++){
//         char instr;
//         cin>>instr;
//         if(instr=='I'){
//             int x, i;
//             cin>>i>>x;
//             dq.insertIndex(x, i);
//         }
//         else if(instr=='D'){
//             int i;
//             cin>>i;
//             dq.deleteIndex(i);
//         }
//         else if(instr=='R'){
//             int d;
//             cin>>d;
//             dq.rotate(d);
//         }
//         else{
//             int i;
//             cin>>i;
//             cout<<dq.getValue(i)<<'\n';
//         }
//     }   
//     return 0;
// }

// Abandoned because of Time Limit Error

#include <bits/stdc++.h>
using namespace std;

int main() {
    ios_base::sync_with_stdio(false); 
    cin.tie(NULL);
    
    int N, Q, idx, x;
    cin>>N>>Q;
    vector<int> A(N);
    for(int i=0; i<N; i++)
        cin>>A[i];
    
    // Entirely making use of built in functions of vectors standard library
    // Previous implementation of doubly linked list was correct but too slow to pass all testcases.

    char cmd;
    for(int i=0; i<Q; i++){
        cin>>cmd;
        switch(cmd){
            case 'I':
                cin>>idx>>x;
                A.insert(A.begin()+idx-1, x);
                break;
            case 'D':
                cin>>idx;
                A.erase(A.begin()+idx-1);
                break;
            case 'R':
                cin>>idx;
                if(idx==1){
                    A.insert(A.begin(), A.back()); A.pop_back();}
                else{
                    A.push_back(A.front()); A.erase(A.begin());}
                break;
            case 'P':
                cin>>idx;
                cout<<A[idx-1]<<'\n';
                break;
            default:
                continue;
        }
    }
    return 0;
}
