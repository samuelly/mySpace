#include <iostream>

#define MIN(A,B) ({ __typeof__(A) __a = (A);\
					__typeof__(B) __b = (B);\
					__a < __b ? __a : __b; })


char *strchr(const char *p, int ch)
{
	for (;; ++p) {
			if (*p == ch)
					return((char *)p);
			if (!*p)
					return((char *)NULL);
	}
	/* NOTREACHED */
}

int atoi(const char *s)
{
    static const char digits[] = "0123456789";  /* legal digits in order */
    unsigned val=0;         /* value we're accumulating */
    int neg=0;              /* set to true if we see a minus sign */

    /* skip whitespace */
    while (*s==' ' || *s=='\t') {
        s++;
    }

    /* check for sign */
    if (*s=='-') {
        neg=1;
        s++;
    } else if (*s=='+') {
        s++;
    }

    /* process each digit */
    while (*s) {
        const char *where;
        unsigned digit;

        /* look for the digit in the list of digits */
        where = strchr(digits, *s);
        if (where == 0) {
            /* not found; not a digit, so stop */
            break;
        }

        /* get the index into the digit list, which is the value */
        digit = (where - digits);

        /* could (should?) check for overflow here */

        /* shift the number over and add in the new digit */
        val = val*10 + digit;

        /* look at the next character */
        s++;
    }

    /* handle negative numbers */
    if (neg) {
        return -val;
    }

    /* done */
    return val;
}

using namespace std;

char *s = "hello, world!";
char *t = "\t";
int main()
{
    int a = 5;
    int b = 3;

    int *ptr;
    cout << "result is :" << MIN(5,3) << endl;
    cout << "ehene\teddf\nedfsdf" << endl;
    cout << sizeof(ptr) << endl;
    while(*s != NULL)
    {
        cout << *s << endl;
        s++;
    }
   while(*t == NULL)
    {
        cout << "Im null" << endl;
        break;
    }

    return 0;
}
