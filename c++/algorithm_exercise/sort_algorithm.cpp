#include <iostream>
#include <string.h>

using namespace std;

#define MAXSIZE 20

int a[MAXSIZE] = {9,12,5,8,3,7,11,6,13,15,1,10,4,14,2};

typedef struct {
	int r[MAXSIZE];
	int length;
}sqList;

sqList mSqList; //definition

typedef enum {
	bubble_sort = 0,
	merge_sort
}sortType;

/*initialize the  data of mSqList*/
void getData(int *a, sqList &msq)
{
	//cout << "sizeof(a) is " << sizeof(a) << endl;  // sizeof(a) means the size of a pointer ,it's 4.
	memcpy(&msq.r, a, sizeof(int)*MAXSIZE); // mention:the 'a' in this scope is a point to array a ,so just use 'a' as the address instead of '&a', it's wrong.
	
	/* for test
	int i = 0;
	for (; i < MAXSIZE ; i++)
		cout << "r[" << i << "] = " << msq.r[i] << endl;
	*/
}

/*initialize the  length of data */
void getLength(sqList &msq)
{
	int i = 0;
	while (msq.r[i] != 0 && i < MAXSIZE) 
	{
		msq.length++;
		i++;
		cout << "msq.length is " << msq.length << endl;
	}
}

/*to change the two array value which subscripted i and j */
void swap(sqList &msq,int i,int j)
{
	int temp = msq.r[i];
	msq.r[i] = msq.r[j];
	msq.r[j] = temp;
}

/* bubble sort */
void bubbleSort(sqList &msq)
{
	for (int i = 1; i < msq.length; i++)
	{
		for (int j = msq.length - 1; j >= i; j-- ) // mention:it begins from the bottom of the list,from bottom to the top.
		{
			if (msq.r[j-1] > msq.r[j])
				swap(msq,j-1,j); //mention:not use '&msq',it's wrong
		}
	}
}

/* bubble sort advanced */
/* this is a optimized bubble sort, through add a 'guard' to avoid useless steps if the list has already been sorted */
void bubbleSortAdvanced(sqList &msq)
{
	bool status = true; // definition the 'guard' 
	for (int i = 1; i < msq.length && status; i++) // judge if the list need another sort steps
	{
		status = false; // initialize it as false
		for (int j = msq.length - 1; j >= i; j-- ) 
		{
			if (msq.r[j-1] > msq.r[j])
				swap(msq,j-1,j); 
				status = true; // if it need to change two array values ,it means that the list hasn't been sorted completely,so it need more steps  
		}
	}
}

/* simple selection sort */
void simpleSelectionSort(sqList &msq)
{
	for (int i = 0; i < msq.length - 1; i++)
	{
		int min = i;  // set the first array as min 
		for (int j = i + 1; j < msq.length; j++)  // loop the rest array value
		{
			if (msq.r[min] > msq.r[j])  // compare : if there is one array value is less than the first array value
				min = j;  // set the array location as min .
		}
		
		if (i != min)  // when after one loop ,if the min is not equal the first array location (this means find the smallest value)
			swap(msq,i,min); // swap. put the smallest value into the current first array
	}
}

int main()
{
	// initialize
	getData(a,mSqList);	
	getLength(mSqList);
	
	for (int i = 0; i < mSqList.length; i++)
		cout << "mSqList.r[" << i << "] = " << mSqList.r[i] << endl;

	//bubbleSort(mSqList);
	//bubbleSortAdvanced(mSqList);
	simpleSelectionSort(mSqList);
	
	cout << "after sort ,the result is :" << endl;
	for (int i = 0; i < mSqList.length; i++)
		cout << "mSqList.r[" << i << "] = " << mSqList.r[i] << endl;
		
	return 0;
}

// to be continued..
