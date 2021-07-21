// Prasann Viswanathan
// 190070047
// h190070047
// Minor 

// By submitting the assignment I abide by following honour code:

// I pledge on the Gita that I have not given or received any unauthorized assistance on this assignment or any previous task.

// References: 
// https://www.geeksforgeeks.org/program-nth-catalan-number/

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;
#define mod (long long int)1000000007

long long int sequences(int n) 
{  
    
    /* Original Approach
        Tried to use recursion with 
        sequences(E, H)
            if(H==0)
                return 0;
            else if(E==0)
                return 1;
            else if(E==H)
                return sequences(E-1, H)%mod;
            else
                return (sequences(E-1, H)+sequences(E, H-1))%mod
                
        However this was resulting in error (Maybe stack limit exceeded)
        Hence implemented a non-recursive solution instead.
    */
    
    vector<long long int> sequences(n+1); 
    sequences[0]=1;
    sequences[1]=1; 
  
    for (int i=2; i<n+1; i++){ 
        sequences[i]=0; 
        for (int j = 0; j < i; j++){ 
            sequences[i] += (sequences[j]*sequences[i - j - 1]); 
            sequences[i] %= mod;
        }
    } 
    return sequences[n]; 
} 

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL); 
    
    int n;
    cin>>n;
    cout<<sequences(n);
    return 0;
}
