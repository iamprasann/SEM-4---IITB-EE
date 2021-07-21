// Prasann Viswanathan
// 190070047
// h190070047
// Minor

// By submitting the assignment you abide by following honour code:
// I pledge on my honour that I have not given or received any unauthorized assistance on this assignment or any previous task.

//Reference: https://www.geeksforgeeks.org/graph-and-its-representations/

#include <bits/stdc++.h>
using namespace std;

int closest_leaf(vector<vector<int>> &Tree, vector<int> &leaves, vector<int> &visited, int source){
    visited[source]=1;	//set each state as visited once entered
    if(leaves[source]==1)
        return 0;	//if it is a leaf, the closest leaf is at 0 distance
    else{
        int d, d_min = INT_MAX;
        for(size_t i=0; i<Tree[source].size(); i++){
            if(visited[Tree[source][i]]==0){
                d=closest_leaf(Tree, leaves, visited, Tree[source][i]);	//recursively check for leaves via unvisited states only
                d_min = d<d_min ? d : d_min;
            }
        }
        return d_min+1;
    }
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    
    int N;
    cin>>N;
    
    vector<vector<int>> Tree(N, vector<int>());	//adjacency list of tree
    vector<int> leaves(N);
    vector<int> visited(N, 0);
    
    for(int i=0; i<N-1; i++){
        int start, end;
        cin>>start>>end;
        Tree[start-1].push_back(end-1);	//double sided edges
        Tree[end-1].push_back(start-1);
    }
    for(int i=1; i<N; i++)
        leaves[i] = (Tree[i].size()==1) ? 1 : 0;	//leaves have one connecte component
    leaves[0]=0;
    
    cout<<closest_leaf(Tree, leaves, visited, 0)<<'\n';	//Main call of the recursive fn
    
    return 0;
}