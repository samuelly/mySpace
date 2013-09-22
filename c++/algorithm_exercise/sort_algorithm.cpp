#include <iostream>
#include <string.h>

using namespace std;

#define MAXSIZE 20

int a[MAXSIZE] = {9,1,5,8,3,7,4,6,2};

typedef struct {
	int r[MAXSIZE];
	int length;
}sqList;

sqList mSqList; //definition

typedef enum {
	bubble_sort = 0,
	merge_sort
}sortType;

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
		for (int j = msq.length - 1; j > 0; j-- )
		{
			if (msq.r[j-1] > msq.r[j])
				swap(msq,j-1,j); //mention:not use '&msq',it's wrong
		}
	}
}

/*initial the  data of mSqList*/
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

/*initial the  length of data */
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

int main()
{
	// initialize
	getData(a,mSqList);	
	getLength(mSqList);
	
	for (int i = 0; i < mSqList.length; i++)
		cout << "mSqList.r[" << i << "] = " << mSqList.r[i] << endl;

	bubbleSort(mSqList);
	
	cout << "after sort ,the result is :" << endl;
	for (int i = 0; i < mSqList.length; i++)
		cout << "mSqList.r[" << i << "] = " << mSqList.r[i] << endl;
		
	return 0;
}

// to be continued..
