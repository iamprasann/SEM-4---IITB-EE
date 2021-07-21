// Prasann Viswanathan
// 190070047
// h190070047
// Minor

// By submitting the assignment you abide by following honour code:
// I pledge on my honour that I have not given or received any unauthorized assistance on this assignment or any previous task.

// Reference: https://www.techiedelight.com/change-elements-row-column-j-matrix-0-cell-j-value-0/

#include <bits/stdc++.h>
using namespace std;

int main(){
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    
    int M, N;
    cin>>M>>N;
    
    vector<vector<int>> grid(M, vector<int>(N, 0));     //Fill in the chess board grid, 0s and 1s
    
    for(int i=0; i<M; i++){         //Take input of grid
        for(int j=0; j<N; j++)
            cin>>grid[i][j];
    }
    
    int first_row=0, first_col=0;   //Same algorithm implemented as reference, O(mn)
    for(int i=0; i<M; i++){
        if(grid[i][0]){
            first_col=1;
            break;
        }
    }
    for(int i=0; i<N; i++){         //Checking if first row and column should be switched to 1s
        if(grid[0][i]){
            first_row=1;
            break;
        }
    }
    
    for(int i=1; i<M; i++){                 //Using first row and column as a bank account so to speak (mn operations)
        for(int j=1; j<N; j++){
            if(grid[i][j])
                grid[i][0]=grid[0][j]=1;
        }
    }
    
    for(int i=1; i<M; i++){                 //Changing entries based on bank account (mn operations)
        for(int j=1; j<N; j++){
            if(grid[i][0] || grid[0][j])
                grid[i][j]=1;
        }
    }
    
    if(first_row){                          //Changing row and column 1 iff flags were set
        for(int i=0; i<N; i++)
            grid[0][i]=1;
    }
    if(first_col){
        for(int i=0; i<M; i++)
            grid[i][0]=1;
    }
    
    for(int i=0; i<M; i++){                 //Printing final rook space grid
        for(int j=0; j<N; j++){
            cout<<grid[i][j]<<" ";
        }
        cout<<"\n";
    }
    return 0;
}
