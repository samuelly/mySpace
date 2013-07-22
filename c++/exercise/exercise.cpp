#include <iostream>
#include <cstring>

using namespace std;

//#define HP_QUESTION_1
//#define HP_QUESTION_2
//#define HP_QUESTION_3
//#define HAMAN_QUESTION_1
#define HAMAN_QUESTION_2

#if defined HP_QUESTION_1
char a[] = "123456";

void HP_question_1(void)
{
	cout << "length is " << strlen(a) << endl;
	cout << "a[6] is " << a[6] << endl;   // should be zero? bug under codeblock compiler it shows 'None'
}
#endif

#if defined HP_QUESTION_2
class Base {
	public:
		virtual void g() {cout << "Base:: g()" << endl ;}
		void f() {cout << "Base:: f()" << endl;}
};

class Derived : public Base {
	public:
		virtual void g() {cout << "Derived:: g()" << endl ;}
		void f() {cout << "Derived:: f()" << endl;}
};

void HP_question_2(void)
{
	Base *ptr1 = new Base();
	Base *ptr2 = new Derived();
	//Derived *ptr3 = new Base(); // error

	ptr1->g();
	ptr1->f();

	ptr2->g();
	ptr2->f(); // still call the f() in Base class
}
#endif

#if defined HP_QUESTION_3  // recursion
void coutString(const char* str)
{
	if (*str)
	{
		str++;
		coutString(str);
		cout << "the string is: " << *str << endl;
		//cout << "the string is: " << str << endl; // pay attention to the difference with the 'str' and '*str'
	}
}
void HP_question_3(void)
{
	char *str = "hello, jack";
	coutString(str);
}
#endif

#if defined HAMAN_QUESTION_1
char str1[20] = "0123456789";
char *str2 = "0123456789";

//sizeof(int) 4
//sizeof(str1) 20
//sizeof(str2) 4
//sizeof(*str2) 11   wrong, sizeof(*str2) should be 1
//strlen(str1) 10
//strlen(str2) 10

void Haman_question_1(void)
{
	cout << "sizeof(int) is " << sizeof(int) << endl
		<< "str1 is "  << str1 << endl
		<< "sizeof(str1) is " << sizeof(str1) << endl
		<< "sizeof(str2) is " << sizeof(str2) << endl
		<< "sizeof(*str2) is " << sizeof(*str2) << endl
		<< "strlen(str1) is " << strlen(str1) << endl
		<< "strlen(str2) is " << strlen(str2) << endl ;
}

#endif

#if defined HAMAN_QUESTION_2
class A {
	public:
		A() { doSth();}
		virtual void doSth() {cout << "I'm A" << endl;}
		void doOthers(class A& a) {
			a.doSth();
		}
};

class B:public A {
	public:
		virtual void doSth() {cout << "I'm B" << endl;}
		void doMyself() {
			doOthers(*this);
		}
};

void Haman_question_2(void)
{
	B b;
	A *a = &b;
	
	// this code cout : 1. I'm A
	//                  2. I'm B
	a->doSth();   
	
	b.doMyself();
}
#endif

#if defined EXERCISE_6

#endif

int main(void)
{
	#if defined HP_QUESTION_1
		HP_question_1();
	#elif defined HP_QUESTION_2
		HP_question_2();
	#elif defined HP_QUESTION_3
		HP_question_3();
	#elif defined HAMAN_QUESTION_1
		Haman_question_1();
	#elif defined HAMAN_QUESTION_2
		Haman_question_2();
	#endif


	return 1;
}
