#include <cstdlib>
#include <ctime>
#include <cmath>

using namespace std;

static const unsigned int size = 100;
static const unsigned int range = 10;

int main() {
    unsigned int a[size];
    unsigned int b[size];
    unsigned int c[size];

    // vector sum computation
    for (unsigned int i = 0; i < size; i++) {
        c[i] = a[i] + b[i];
    }

    return 0;
}
