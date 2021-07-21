// Prasann Viswanathan
// 190070047
// h190070047
// Minor 

// By submitting the assignment I abide by following honour code:

// I pledge on the Gita that I have not given or received any unauthorized assistance on this assignment or any previous task.

// References: 
// https://www.geeksforgeeks.org/quick-sort/
// https://www.geeksforgeeks.org/quicksort-tail-call-optimization-reducing-worst-case-space-log-n/

#include <map>
#include <set>
#include <list>
#include <cmath>
#include <ctime>
#include <deque>
#include <queue>
#include <stack>
#include <string>
#include <bitset>
#include <cstdio>
#include <limits>
#include <vector>
#include <climits>
#include <cstring>
#include <cstdlib>
#include <fstream>
#include <numeric>
#include <sstream>
#include <iostream>
#include <algorithm>
#include <unordered_map>
using namespace std;

int partition(vector<int> &A, int low, int high){  
    int r=A[high];  
    int i=(low - 1);   
    for (int j=low; j<=high-1; j++){  
        if (A[j] < r){  
            i++;   
            swap(A[i], A[j]);  
        }  
    }  
    swap(A[i+1], A[high]);  
    return (i+1);  
}  

void quick_sort(vector<int> &A, int low, int high){
    while(low<high){
        int r=partition(A, low, high);
        
        if(r-low < high-r){
            quick_sort(A, low, r-1);
            low=r+1;
        }
        else{
            quick_sort(A, r+1, high);
            high=r-1;
        }
    }
}

using namespace std;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    
    vector<int> A;
    int ip;
    
    while(cin>>ip)
        A.push_back(ip);
    
    quick_sort(A, 0, int(A.size()));
    auto p=A.begin();
    while(p!=A.end()){
        p++;
        cout<<*p<<" ";
    }
    return 0;
}

