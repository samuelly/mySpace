#include <iostream>
#include <vector>
#include <list>

using namespace std;

//#define EXERCISE_9_9
//#define EXERCISE_9_12
//#define EXERCISE_9_13
#define EXERCISE_9_14

int a[10] = {1,2,3,4,5,6,7,8,9,10};


/* Exercise 9.9
** ��дһ��ѭ����List�����ڵ�Ԫ�ذ��������
*/
void exercise_9_9(void)
{
	cout << "here is exercise 9.9:" << endl;

	// ��Ҫ:�����a��a+10�ֱ����ڱ�Ǹ��Ƶĵ�һ��Ԫ�غ�ֹͣ���Ƶ�����(�ڶ���ָ����Ҫ���Ƶ����һ��Ԫ�ص���һλ��)
	list<int> ilist(a,a + 10); // ����������Ԫ�ظ�ֵ��list
	list<int>::iterator iter1 = ilist.begin();
	list<int>::iterator iter2 = ilist.end();

	while (iter1 != iter2)
		cout << *(--iter2) << endl; // �������
}


/* Exercise 9.12
** 
*/
bool exercise_9_12(vector<int>::iterator first,vector<int>::iterator last,int n)
{
	cout << "here is exercise 9.12:" << endl;

	while (first != last)
	{
		if (*(first++) == n)
			return true;
	}
	return false;
}

/* Exercise 9.13
** 
*/
vector<int>::iterator exercise_9_13(vector<int>::iterator first,vector<int>::iterator last,int n)
{
	cout << "here is exercise 9.13:" << endl;

	while (first != last)
	{
		if (*first == n)
			return first;
		else
			first++;
	}
	return last;
}


/* Exercise 9.14
** 
*/
void exercise_9_14()
{

}


int main()
{
	cout << "prepare to exercise." << endl;
	
	#ifdef EXERCISE_9_9
		exercise_9_9();
	
	#elif defined EXERCISE_9_12
		vector<int> ivector(a,a + 10); 
		vector<int>::iterator iter1 = ivector.begin();
		vector<int>::iterator iter2 = ivector.end();
		int temp = exercise_9_12(iter1,iter2,9);
		cout << "temp = " << temp << endl;
		
	#elif defined EXERCISE_9_13
		cout << "Please input the number you want to find" << endl;
		int input;
		cin >> input;
		vector<int> ivector(a,a + 10); 
		vector<int>::iterator iter1 = ivector.begin();
		vector<int>::iterator iter2 = ivector.end();
		vector<int>::iterator rIter = exercise_9_13(iter1,iter2,input);
		if (rIter == ivector.end())
			cout << "sorry ,you can't find the number" << endl;
		else
			cout << "congratulations ,you find the number!" << endl;
	
	#elif defined EXERCISE_9_14
	
	#else
	#endif
	
	return 1;
}
