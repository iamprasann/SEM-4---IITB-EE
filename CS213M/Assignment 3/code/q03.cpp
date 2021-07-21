// Prasann Viswanathan
// 190070047
// h190070047
// Minor 

// I pledge on my honour that I have not given or received any unauthorized assistance on this assignment or any previous task.

// Reference:  https://www.geeksforgeeks.org/the-stock-span-problem/ 

#include <bits/stdc++.h>
using namespace std;

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    
    // Adding the necessary variables
    long int n=0;
    cin>>n;
    vector<long int> X(n), S(n);
    stack<long int> prev_idx;
    
    // Filling input array
    for(int i=0; i<n; i++)
        cin>>X[i];
    
    // First element always has a span of 1, start by pushing index of the first element in previous indices stack
    S[0]=1; prev_idx.push(0);
    
    for(int i=1; i<n; i++){
    	// Keep popping stack elements if value pointed by the index is lesser than current X
        while (!prev_idx.empty() && X[prev_idx.top()] <= X[i]) 
            prev_idx.pop(); 
        
        // If entire stack popped, current X is the largest value encountered yet. It has span of i+1
        if(prev_idx.empty())
            S[i]=i+1;
        // Otherwise we find the index of first element preceding X[i] and larger than it
        else
            S[i]=i-prev_idx.top();

        // Updating previous indices with latest indice for next pass
        prev_idx.push(i); 
    } 
    
    for(int i=0; i<n; i++){
        cout<<S[i]<<'\n';
    }
    return 0;
}
