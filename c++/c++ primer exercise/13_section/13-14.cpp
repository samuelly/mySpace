#include <iostream>

using namespace std;

class Exmpl{
public:
	// default constructor
	Exmpl(){
		cout << "Exmpl()" << endl;}

	// copy constructor
	Exmpl(const Exmpl& ){
		cout << "Exmpl(const Exmpl& obj)" << endl;}

	Exmpl& operator = (const Exmpl& obj)
	{
		cout << "Exmpl& operator = (const Exmpl&)" << endl;
		return *this;
	}

	// Destructor
	~Exmpl(){
		cout <<"~Exmpl()" << endl; }
		
private:
	
};

void func1(Exmpl tobj) // parameter is Exmpl object
{

}

void func2(Exmpl& tobj) // parameter is reference of Exmpl object
{

}

Exmpl func3()
{
	Exmpl obj;
	return obj;  // return Exmpl object
}

int main()
{	
	// call the default constructor to create a Exmpl object:obj
	Exmpl obj; 
	
	cout << "~~~~~~~~~~~~~~~~~" << endl;

	// 1.call the copy constructor; 2.���β�Exmpl���󴴽�Ϊʵ��Exmpl�����һ������;3.����ִ����Ϻ�����������������β�Exmpl����
	//func1(obj); 
	cout << "----------------------" << endl;

	// �β���Exmpl��������ã��������copy���캯��������ʵ��
	//func2(obj); 
	cout << "@@@@@@@@@@@@@@@@@@@@@@" << endl;

	// ����Ĭ�Ϲ��캯�������ֲ�Exmpl����
	// ��������ʱ������copy���캯����������Ϊ����ֵ������Exmpl���� (��Ҫ)
	// Ȼ����������������پֲ�Exmpl����
	// Ȼ����ø�ֵ������
	// ִ���긳ֵ�����󣬵�����������������Ϊ����ֵ������Exmpl����
	obj = func3();
	
	return 0;
}

