#include <iostream>
#include <vector>
#include <list>

using namespace std;

#define EXERCISE_15


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
		for (vector< pair<string,string>* >::const_iterator vIter = c.wait_list.begin(); // 哈罗
				vIter != c.wait_list.end(); vIter++)
				out << (*vIter)->first << "\t" << (*vIter)->second 
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

	#ifdef EXERCISE_15
		exercise_14_7();
	#elif defined EXERCISE_9_35
			
	#else
	#endif

	return 1;
}
