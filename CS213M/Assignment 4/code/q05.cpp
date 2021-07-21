// Prasann Viswanathan
// 190070047
// h190070047
// Minor

// By submitting the assignment you abide by following honour code:
// I pledge on my honour that I have not given or received any unauthorized assistance on this assignment or any previous task.

//Reference: https://math.stackexchange.com/questions/1388564/number-of-binary-search-trees-on-n-nodes-of-height-up-to-h

#include<bits/stdc++.h>
using namespace std;
#define mod 1000000007

long int no_of_trees(long int h, long int n, vector<vector<long int>> &records){
    if(h<0)
        return 0;
    else if(records[h][n]!=-1)
        return (records[h][n] % mod);
    else{
        records[h][n]=0;
        for(int i=1; i<=n; i++){
            records[h][n] += (no_of_trees(h-1, i-1, records)*no_of_trees(h-1, n-i, records)) % mod; //Must take remainders regularly or cases fail
        }
        return (records[h][n] % mod); // (a+b)%x = (a%x+b%x)%x
    }
}

int main(){
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    
    vector<vector<long int>> records(51, vector<long int>(51, -1));
    for(int i=0; i<51; i++){
        records[0][i]=0;
        records[i][0]=1;
    }
    records[0][1]=1;    //Array for memoization
    
    long int n, l, r;
    cin>>n>>l>>r;
    
    long int upper = no_of_trees(r-1, n, records);  // Formula maps 1 node to height of 0, we map one node to height of 1
    long int lower = no_of_trees(l-2, n, records);  // Hence an adjusting factor of -1 is necessary
    
    cout<<upper-lower;
    
    return 0;
}
