#include <iostream>
#include <vector>
#include <list>

using namespace std;

//#define EXERCISE_9_9


int a[10] = {1,2,3,4,5,6,7,8,9,10};


/* Exercise 9.9
** 编写一个循环将List容器内的元素按逆序输出
*/
void exercise_9_9(void)
{
	cout << "here is exercise 9.9:" << endl;

	// 重要:这里的a和a+10分别用于标记复制的第一个元素和停止复制的条件(第二个指针标记要复制的最后一个元素的下一位置)
	list<int> ilist(a,a + 10); // 从数组中拿元素赋值给list
	list<int>::iterator iter1 = ilist.begin();
	list<int>::iterator iter2 = ilist.end();

	while (iter1 != iter2)
		cout << *(--iter2) << endl; // 逆序输出
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
