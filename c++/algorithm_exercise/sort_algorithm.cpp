#include <iostream>
#include <string.h>

using namespace std;

#define MAXSIZE 20

int a[MAXSIZE] = {9,12,5,8,3,7,11,6,13,15,1,10,4,14,2};

typedef struct {
	int r[MAXSIZE];
	int length;
}sqList;

sqList mSqList; //definition data list

typedef enum {
	bubble_sort = 0,
	bubble_sort_advanced,
	simple_selection_Sort,
	insert_ort,
	shell_sort,
	merge_sort
}sortType;

sortType msortType = shell_sort; // choose a kind of sort

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
	cout << "***************** I'm bubule sort !! *************************" << endl;
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
	cout << "***************** I'm bubule advanced sort !! *************************" << endl;
	bool status = true; // definition of the 'guard' 
	for (int i = 1; i < msq.length && status; i++) // judge if the list need another sort steps
	{
		status = false; // initialize it as false
		for (int j = msq.length - 1; j >= i; j--) 
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
	cout << "***************** I'm siimple selection sort !! *************************" << endl;
	for (int i = 0; i < msq.length - 1; i++) // begin with the first of the array
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

/* straight insertion sort -- image you are playing poker */
void insertSort(sqList &msq)
{
	cout << "***************** I'm straight insert sort !! *************************" << endl;
	int guard = 0;  // 'guard' to store the temp smaller value
	int i,j;
	for (i = 1; i < msq.length; i++)  // begin with the second array element
	{	
		if (msq.r[i] < msq.r[i-1]) // compare with the near front array element
		{
			guard = msq.r[i]; // store the smaller element into 'guard'
			for (j = i - 1; msq.r[j] > guard && (j >= 0); j--)  
			{
				msq.r[j+1] = msq.r[j];  // move to the back potion one by one 
			} 
			msq.r[j+1] = guard;  // insert the smaller value into it's current posion in this list
		}
	}
}


/* Shell sort  */
void shellSort(sqList &msq)
{
	cout << "***************** I'm shell sort !! *************************" << endl;
	int gap ; //gap is the key point,it means in every time of sort,don't compare two nearby data,instead of comparing two data with a gap. 
	int i = 0;

	for (gap = msq.length / 2; gap >= 1; gap /= 2) // after a circle of sort ,the gap is /2 ,at last ,it will become 1 and actually it's the straight insertion sort.
	{
		for (i = gap; i < msq.length; i++)
		{
			int j = 0;
			int key = msq.r[i];
			for (j = i - gap; j >= 0 && msq.r[j] > key; j -= gap) // all of this like the straight insertion except this: j -= gap
				msq.r[j + gap] = msq.r[j];
			msq.r[j + gap] = key;
		}
	}
}

int main()
{
	// initialize
	getData(a,mSqList);	
	getLength(mSqList);
	
	for (int i = 0; i < mSqList.length; i++)
		cout << "mSqList.r[" << i << "] = " << mSqList.r[i] << endl;

	switch (msortType)
	{
		case bubble_sort:
			bubbleSort(mSqList);
			break;
		case bubble_sort_advanced:
			bubbleSortAdvanced(mSqList);
			break;
		case simple_selection_Sort:
			simpleSelectionSort(mSqList);
			break;
		case insert_ort:
			insertSort(mSqList);
			break;
		case shell_sort:
			shellSort(mSqList);
			break;
		default:
			break;
	}

	cout << "after sort ,the result is :" << endl;
	for (int i = 0; i < mSqList.length; i++)
		cout << "mSqList.r[" << i << "] = " << mSqList.r[i] << endl;
		
	return 0;
}

// to be continued..
