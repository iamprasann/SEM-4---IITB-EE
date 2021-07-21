// Prasann Viswanathan
// 190070047
// h190070047
// Minor

// By submitting the assignment you abide by following honour code:
// I pledge on my honour that I have not given or received any unauthorized assistance on this assignment or any previous task.

// Reference: NA

#include <bits/stdc++.h>
using namespace std;

void DFS_shops(int src, vector<int> &visited1, vector<int> &is_candy, vector<int> &subtree_candy, vector<vector<int>> &tree){
    visited1[src]=1;
    for(int v=0; v<(int)tree[src].size(); v++){
        if(visited1[tree[src][v]]==0){
            DFS_shops(tree[src][v], visited1, is_candy, subtree_candy, tree);   //Marks number of candy shops in subtree
            subtree_candy[src]+=subtree_candy[tree[src][v]];        //Makes use of DFS
        }
    }
    if(is_candy[src])
        subtree_candy[src]+=1;
}

int DFS_distance(int src, int depth, vector<int> &is_candy, vector<int> &visited2, vector<vector<int>> &tree){
    int sum=0;                                          //At the start, from this node as source, consider cost as 0
    visited2[src]=1;                                     //Mark as visited
    for(int v=0; v<(int)tree[src].size(); v++){         //For every node connected to source
        if(visited2[tree[src][v]]==0)                    //If not visited
            sum += DFS_distance(tree[src][v], depth+1, is_candy, visited2, tree); //DFS whilst adding cost recursively
    }
    sum += (is_candy[src])?depth:0;         //Finally, consier self node, add it's cost if itself is a candy shop
    return sum;                             //return the cost, completing the recursion
}

void DFS(int src, vector<int> &visited3, vector<int> &subtree_candy, vector<int> &candy_distances, vector<vector<int>> &tree, int parent_distance, int k){
    visited3[src]=1;
    for(int v=0; v<(int)tree[src].size(); v++){
        if(visited3[tree[src][v]]==0){
            candy_distances[tree[src][v]] = parent_distance + k - (2*subtree_candy[tree[src][v]]);  //Formula
            DFS(tree[src][v], visited3, subtree_candy, candy_distances, tree, candy_distances[tree[src][v]], k);
        }        
    }
}

int main(){
    int n, k;
    cin>>n>>k;             // Taking n and k input
    
    vector<vector<int>> tree(n, vector<int>());  // Graph represented as a tree, root considered as 1
    vector<int> is_candy(n, 0);                  // Stores if node(i) is a candy shop
    vector<int> subtree_candy(n, 0);             // Stores number of candy shops in subtree of a node including itself
    
    for(int i=0; i<n-1; i++){           //Taking input of the graph
        int u, v;
        cin>>u>>v;
        tree[u-1].push_back(v-1);
        tree[v-1].push_back(u-1);
    }
    for(int i=0; i<k; i++){             //Marking candy shops
        int a;
        cin>>a;
        is_candy[a-1]=1;
    }
    
    vector<int> visited1(n, 0);
    DFS_shops(0, visited1, is_candy, subtree_candy, tree);      //Filling subtree shops array
    
    vector<int> visited2(n, 0);
    int root_distance = DFS_distance(0, 0, is_candy, visited2, tree);      //Finding root distance from shops
    
    vector<int> candy_distances(n, 0);
    candy_distances[0]=root_distance;
    
    vector<int> visited3(n, 0);
    DFS(0, visited3, subtree_candy, candy_distances, tree, root_distance, k);   //Finding distance for all nodes
    
    int min=INT_MAX, key=INT_MAX;
    for(int i=0; i<n; i++){
        if(candy_distances[i]<min){     //Finding shortest aggregate distance node
            min = candy_distances[i];
            key = i;
        }
    }
    cout<<(key+1);          //Printing lexicographically least result
    return 0;    
}
    
    