#include <iostream>
#include <vector>
#include <list>

using namespace std;

//#define EXERCISE_9_9


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



int main()
{
	cout << "prepare to exercise." << endl;

	#ifdef EXERCISE_9_9
		
	#elif defined EXERCISE_9_35
			
	#else
	#endif

	return 1;
}
