// Prasann Viswanathan
// 190070047
// h190070047
// Minor 

// By submitting the assignment I abide by following honour code:

// I pledge on the Gita that I have not given or received any unauthorized assistance on this assignment or any previous task.

// References: 
// https://www.geeksforgeeks.org/binary-search/

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

int local_maxima(vector<int> &A, int x, int low, int high, int n){
    int mid = (low+high)/2;
    
    if((mid==0) && ((A[mid]^x) >= (A[mid+1]^x)))
       return mid+1;
    else if((mid==n-1) && ((A[mid]^x) >= (A[mid-1]^x)))
       return mid+1;
       
    else if(((x^A[mid-1]) <= (x^A[mid])) && ((x^A[mid+1]) <= (x^A[mid])))
        return mid+1;
    else if((x^A[mid+1]) < (x^A[mid]))
        return local_maxima(A, x, low, mid-1, n);
    else
        return local_maxima(A, x, mid+1, high, n);
}

int main() {
    ios_base::sync_with_stdio(false); 
    cin.tie(NULL);
    
    int n, q;
    cin>>n>>q;
    
    vector<int> A(n);
    int x_instance;
    int x=0;
    
    for(int i=0; i<n; i++)
        cin>>A[i];
    
    for(int i=0; i<q; i++){
        cin>>x_instance;
        x ^= x_instance;
        cout<<local_maxima(A, x, 0, n-1, n)<<"\n";
    }
        
    return 0;
}
