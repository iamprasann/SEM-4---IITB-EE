// Prasann Viswanathan
// 190070047
// h190070047
// Minor

// By submitting the assignment you abide by following honour code:
// I pledge on my honour that I have not given or received any unauthorized assistance on this assignment or any previous task.

// Reference: https://www.geeksforgeeks.org/avl-tree-set-1-insertion
// https://www.geeksforgeeks.org/avl-tree-set-2-deletion/

#include<bits/stdc++.h>
using namespace std;

class Node{
    public:
    int key;
    int value;
    Node* left;
    Node* right;
    // int height;
};

// int height(Node* n){
//     return (n==NULL ? 0 : n->height);
// }

Node* addNode(int key, int value){	//create node function
    Node* temp = new Node();
    temp->key = key;
    temp->value = value;
    // temp->height=1;
    temp->left=NULL;
    temp->right=NULL;
    return temp;
}

// Node* rotateRight(Node* base){
//     Node* l = base->left;
//     Node* lr = l->right;
//     base->left=lr;
//     l->right=base;
    
//     base->height = max(height(base->left), height(base->right))+1;
//     l->height = max(height(l->left), height(l->right))+1;
    
//     return l;
// }
// Node* rotateLeft(Node* base){
//     Node* r = base->right;
//     Node* rl = r->left;
//     base->right=rl;
//     r->left=base;
    
//     base->height = max(height(base->left), height(base->right))+1;
//     r->height = max(height(r->left), height(r->right))+1;
    
//     return r;
// }

// int difference(Node *temp){
//     return (temp==NULL) ? 0 : height(temp->left)-height(temp->right);
// }

Node* insert(Node* base, int key, int value){	//insert, same as in class
    if(base==NULL)
        return (addNode(key, value));
    
    if(key<base->key)
        base->left=insert(base->left, key, value);
    else if(key>base->key)
        base->right=insert(base->right, key, value);
    else{
        base->value=value;
        return base;
    }
    return base;
    
//     int d = difference(base);
    
//     if(d>1 && key < (base->left)->key)
//         return rotateLeft(base);
//     else if(d<-1 && key > (base->right)->key)
//         return rotateRight(base);
//     else if(d>1 && key > (base->left)->key){
//         base->left = rotateLeft(base->left);
//         return rotateRight(base);
//     }
//     else if(d<-1 && key < (base->right)->key){
//         base->right = rotateRight(base->right);
//         return rotateLeft(base);
//     }
//     else
//         return base;       
}

Node* least(Node* temp){	//least node in right subtree, for deletion - in class algorithm
    Node* curr=temp;
    while(curr->left!=NULL)
        curr=curr->left;
    return curr;
}

Node* deleteNode(Node* base, int key){	//in class algorithm
    if(base==NULL)
        return base;
    
    if(key<base->key)
        base->left=deleteNode(base->left, key);
    else if(key>base->key)
        base->right=deleteNode(base->right, key);
    else{
        if(base->left==NULL || base->right==NULL){
            Node* temp = base->left? base->left : base->right;
            if(temp==NULL){
                temp=base;
                base=NULL;
            }
            else{  
                *base=*temp;
            }
            free(temp);
        }
        else{
            Node* temp = least(base->right);
            base->key = temp->key;
            base->value = temp->value;
            base->right=deleteNode(base->right, temp->key);
        }
    }
    return base;
    
    // base->height = max(height(base->left), height(base->right))+1;
    
//     int d = difference(base);
    
//     if(d>1 && key < (base->left)->key)
//         return rotateLeft(base);
//     else if(d<-1 && key > (base->right)->key)
//         return rotateRight(base);
//     else if(d>1 && key > (base->left)->key){
//         base->left = rotateLeft(base->left);
//         return rotateRight(base);
//     }
//     else if(d<-1 && key < (base->right)->key){
//         base->right = rotateRight(base->right);
//         return rotateLeft(base);
//     }
//     else
//         return base;
}

void in_order_update(Node* &base, int x1, int x2, int c){	//in order used as ascending order between x1 and x2 is most efficient
    if(base==NULL)
        return;
    
    if(base->key > x1)
        in_order_update(base->left, x1, x2, c);
    
    if(x1<= base->key && base->key<=x2)
        base->value += c;
    
    if(base->key < x2)
        in_order_update(base->right, x1, x2, c);
    
    return;
}

void print_value(Node* &base, int key){	//standard find a key logic
    if(base==NULL)
        return;
    
    if(key < base->key)
        print_value(base->left, key);
    else if(key > base->key)
        print_value(base->right, key);
    else
        cout<<base->value<<'\n';
}

int main(){
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    
    Node* root=NULL;
    
    char instr;
    int x, y, x1, x2, c;
    
    while(true){
        cin>>instr;
        if(instr == 'g'){
            cin>>x;
            print_value(root, x);
        }
        else if(instr == 'i'){
            cin>>x>>y;
            root = insert(root, x, y);
        }
        else if(instr == 'a'){
            cin>>x1>>x2>>c;
            in_order_update(root, x1, x2, c);
        }
        else if(instr == 'd'){
            cin>>x;
            root = deleteNode(root, x);
        }
        else if(instr == 'e')
            break;
        else 
            continue;
    }
    
    return 0;
}
