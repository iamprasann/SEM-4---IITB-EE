// Prasann Viswanathan
// 190070047
// h190070047
// Minor 

// By submitting the assignment I abide by following honour code:

// I pledge on the Gita that I have not given or received any unauthorized assistance on this assignment or any previous task.

// References: NA 

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

long long int alphabet_order(long long int x){
    return ((long long int)((x+1)/2))%3;
}

void hanoi (long long int n, char a, char b, char c){
    for(long long int i=1; i<=pow(2, n)-1; i++){
        long long int twopow=0;
        while(true){
            long long int power=pow(2, twopow);
            if(i%power==0)
                twopow++;
            else
                break;
        }
        
        long long int idx=alphabet_order((long long int)(i/pow(2, twopow-1))); 
        if(twopow%2==1){
            if(idx==0)
                cout<<c<<" "<<a<<" "<<twopow<<'\n';
            else if(idx==1)
                cout<<a<<" "<<b<<" "<<twopow<<'\n';
            else
                cout<<b<<" "<<c<<" "<<twopow<<'\n';
        }
        else{
            if(idx==0)
                cout<<b<<" "<<a<<" "<<twopow<<'\n';
            else if(idx==1)
                cout<<a<<" "<<c<<" "<<twopow<<'\n';
            else
                cout<<c<<" "<<b<<" "<<twopow<<'\n';
        }
    }
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    
    long long int n;
    cin>>n;
    if(n%2==0)
        hanoi(n, 'A', 'C', 'B');
    else
        hanoi(n, 'A', 'B', 'C');
    
    return 0;
}