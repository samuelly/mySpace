#include <iostream>
#include <vector>
#include <list>

using namespace std;

//#define EXERCISE_9_9
//#define EXERCISE_9_12
//#define EXERCISE_9_13
//#define EXERCISE_9_14
//#define EXERCISE_9_26
//#define EXERCISE_9_34
#define EXERCISE_9_35

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
** 使用迭代器编写程序：从标准输入设备读入若干string对象，并将它们存入一个vector对象中，然后输入该vector对象中的所有元素。
*/
void exercise_9_14()
{
	cout << "here is exercise 9.14:" << endl;

	vector<string> svec;
	string str;

	cout << "Input some strings(Ctrl+z to end) " << endl;
	while (cin >> str)
		svec.push_back(str); // 把string加入到vector中

	vector<string>::iterator iterFirst = svec.begin();
	vector<string>::iterator iterLast = svec.end();

	while (iterFirst != iterLast)
		cout << *(iterFirst++) << endl;
}


/* Exercise 9.26
** 假设有如下 ia 的定义，将 ia 复制到一个 vector 容器和一个 list 容器中。使用单个迭代器参数版本的
** erase 函数将 list 容器中的奇数值元素删除掉，然后将 vector 容器中的偶数值元素删除掉。
** int ia[] = { 0, 1, 1, 2, 3, 5, 8, 13, 21, 55, 89 };
*/
void exercise_9_26()
{
	cout << "here is exercise 9.26:" << endl;

	int ia[] = { 0, 1, 1, 2, 3, 5, 8, 13, 21, 55, 89 };

	vector<int> ivec(ia,ia + 11); // a+11,指到最后一个元素的下一位。
	list<int> ilist(ia,ia + 11);

	// 删除vector中的偶数值
	vector<int>::iterator iIter = ivec.begin();
	while (iIter != ivec.end())
	{
		if ((*iIter % 2) == 0)
			iIter = ivec.erase(iIter); // 因为erase方法返回指向被删元素的下一个元素，所以再次赋给iIter即可，不用再做iIter++的动作
		else
			iIter++;
	}

	// 重新取得新的迭代器，打印验证
	vector<int>::iterator iIter2 = ivec.begin();
	cout << "我们是奇数!" << endl;
	while (iIter2 != ivec.end())
		cout << *(iIter2++) << endl;

	/////////////////////////////////////////////////////////////////////////////////

	// 删除list中的奇数值
	list<int>::iterator iIter3 = ilist.begin();
	while (iIter3 != ilist.end())
	{
		if ((*iIter3 % 2) != 0)
			iIter3 = ilist.erase(iIter3); // 因为erase方法返回指向被删元素的下一个元素，所以再次赋给iIter即可，不用再做iIter++的动作
		else
			iIter3++;
	}

	// 重新取得新的迭代器，打印验证
	list<int>::iterator iIter4 = ilist.begin();
	cout << "而我们是偶数!" << endl;
	while (iIter4 != ilist.end())
		cout << *(iIter4++) << endl;
}

/* Exercise 9.34
** 使用迭代器将string对象中的字符都改为大写字母
*/
void exercise_9_34()
{
	cout << "here is exercise 9.34:" << endl;
	
	string s("Hello,world!");
	
	cout << "the origin string is :" << s << endl;
	
	string::iterator sIter = s.begin();
	
	while (sIter != s.end())
	{
		if (*sIter >= 'a' && *sIter <= 'z') 
			*sIter -= 'a' - 'A'; // 'a' - 'A'的值用来表示同一个字母的大小写ascII码的数值之差，不能用26!
			// // 土，有个函数叫 toupper() ... 见 ctype.h
		sIter++;
	}

	cout << "after upper translater, the string is :" << s << endl;
}

/* Exercise 9.35
** 使用迭代器寻找和删除string对象中所有的大写字母。
*/
void exercise_9_35()
{
	cout << "here is exercise 9.35:" << endl;
	
	string s("Hello,The Beautiful World In My Heart!");
	
	cout << "the origin string is :" << s << endl;
	
	string::iterator sIter = s.begin();
	
	while (sIter != s.end())
	{
		if (*sIter >= 'A' && *sIter <= 'Z')  // 土，有个函数叫 isupper() ....
			s.erase(sIter); // 疑问：sIter在erase函数之后自动自增，指向下一字符？
		else
			sIter++;
	}

	cout << "after deleting the upper character, the string now is :" << s << endl;
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
		exercise_9_14();

	#elif defined EXERCISE_9_26
		exercise_9_26();
		
	#elif defined EXERCISE_9_34
		exercise_9_34();
		
	#elif defined EXERCISE_9_35
		exercise_9_35();		
	#else
	#endif

	return 1;
}
