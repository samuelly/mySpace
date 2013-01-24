#include <iostream>
#include <vector>
#include <list>

using namespace std;

#define EXERCISE_14_7


/* Exercise 14.7
** 为下面的 CheckoutRecord 类定义一个输出操作符：
	class CheckoutRecord {
     public:
         // ...
     private:
         double book_id;
         string title;
         Date date_borrowed;
         Date date_due;
         pair<string,string> borrower;
         vector< pair<string,string>* > wait_list;
     };
*/
typedef int Date;

class CheckoutRecord {
     public:
         friend ostream& operator<< (ostream& out, const CheckoutRecord& c);
     private:
         double 						book_id;
         string 						title;
         Date 							date_borrowed;
         Date 							date_due;
         pair<string,string> 			borrower;
         vector< pair<string,string>* > wait_list;
     };

	ostream& operator<< (ostream& out, const CheckoutRecord& c)
	{
		out << c.book_id << "\t" << c.title << endl
			<< "date_borrowed:" << c.date_borrowed  << endl
			<< "date_due:" << c.date_due << endl
			<< "borrower:" << c.borrower.first << "\t" 
			<< c.borrower.second << endl;
		
		out << "wait list:" << endl;
		for (vector< pair<string,string>* >::const_iterator vIter = c.wait_list.begin(); // 注意const_iterator ，因为此方法传入的是const CheckoutRecord& c参数，是const的。
				vIter != c.wait_list.end(); vIter++)
				out << (*vIter)->first << "\t" << (*vIter)->second // 因为vector里的类型是pair<string,string>*，即指向pair类型的指针，所以解引用后需要用->而不是.来指向元素。
					<< endl;
					
		return out;
	}
	
void exercise_14_7(void)
{
	cout << "here is exercise 14.7:" << endl;

}



int main()
{
	cout << "prepare to exercise." << endl;

	#ifdef EXERCISE_14_7
		exercise_14_7();
	#elif defined EXERCISE_9_35
			
	#else
	#endif

	return 1;
}
