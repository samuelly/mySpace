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
** ʹ�õ�������д���򣺴ӱ�׼�����豸��������string���󣬲������Ǵ���һ��vector�����У�Ȼ�������vector�����е�����Ԫ�ء�
*/
void exercise_9_14()
{
	cout << "here is exercise 9.14:" << endl;

	vector<string> svec;
	string str;

	cout << "Input some strings(Ctrl+z to end) " << endl;
	while (cin >> str)
		svec.push_back(str); // ��string���뵽vector��

	vector<string>::iterator iterFirst = svec.begin();
	vector<string>::iterator iterLast = svec.end();

	while (iterFirst != iterLast)
		cout << *(iterFirst++) << endl;
}


/* Exercise 9.26
** ���������� ia �Ķ��壬�� ia ���Ƶ�һ�� vector ������һ�� list �����С�ʹ�õ��������������汾��
** erase ������ list �����е�����ֵԪ��ɾ������Ȼ�� vector �����е�ż��ֵԪ��ɾ������
** int ia[] = { 0, 1, 1, 2, 3, 5, 8, 13, 21, 55, 89 };
*/
void exercise_9_26()
{
	cout << "here is exercise 9.26:" << endl;

	int ia[] = { 0, 1, 1, 2, 3, 5, 8, 13, 21, 55, 89 };

	vector<int> ivec(ia,ia + 11); // a+11,ָ�����һ��Ԫ�ص���һλ��
	list<int> ilist(ia,ia + 11);

	// ɾ��vector�е�ż��ֵ
	vector<int>::iterator iIter = ivec.begin();
	while (iIter != ivec.end())
	{
		if ((*iIter % 2) == 0)
			iIter = ivec.erase(iIter); // ��Ϊerase��������ָ��ɾԪ�ص���һ��Ԫ�أ������ٴθ���iIter���ɣ���������iIter++�Ķ���
		else
			iIter++;
	}

	// ����ȡ���µĵ���������ӡ��֤
	vector<int>::iterator iIter2 = ivec.begin();
	cout << "����������!" << endl;
	while (iIter2 != ivec.end())
		cout << *(iIter2++) << endl;

	/////////////////////////////////////////////////////////////////////////////////

	// ɾ��list�е�����ֵ
	list<int>::iterator iIter3 = ilist.begin();
	while (iIter3 != ilist.end())
	{
		if ((*iIter3 % 2) != 0)
			iIter3 = ilist.erase(iIter3); // ��Ϊerase��������ָ��ɾԪ�ص���һ��Ԫ�أ������ٴθ���iIter���ɣ���������iIter++�Ķ���
		else
			iIter3++;
	}

	// ����ȡ���µĵ���������ӡ��֤
	list<int>::iterator iIter4 = ilist.begin();
	cout << "��������ż��!" << endl;
	while (iIter4 != ilist.end())
		cout << *(iIter4++) << endl;
}

/* Exercise 9.34
** ʹ�õ�������string�����е��ַ�����Ϊ��д��ĸ
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
			*sIter -= 'a' - 'A'; // 'a' - 'A'��ֵ������ʾͬһ����ĸ�Ĵ�СдascII�����ֵ֮�������26!
			// // �����и������� toupper() ... �� ctype.h
		sIter++;
	}

	cout << "after upper translater, the string is :" << s << endl;
}

/* Exercise 9.35
** ʹ�õ�����Ѱ�Һ�ɾ��string���������еĴ�д��ĸ��
*/
void exercise_9_35()
{
	cout << "here is exercise 9.35:" << endl;
	
	string s("Hello,The Beautiful World In My Heart!");
	
	cout << "the origin string is :" << s << endl;
	
	string::iterator sIter = s.begin();
	
	while (sIter != s.end())
	{
		if (*sIter >= 'A' && *sIter <= 'Z')  // �����и������� isupper() ....
			s.erase(sIter); // ���ʣ�sIter��erase����֮���Զ�������ָ����һ�ַ���
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
