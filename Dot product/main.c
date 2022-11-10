#include <stdio.h>
#include <stdint.h>
// #include "01_sum.c"
extern float dot_product (size_t N, const float *A, const float *B);

int main () {
	const size_t N = 12;
	// _Alignas(32) float A[16] = {1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8};
	// _Alignas(32) float B[16] = {6, 7, 8, 9, 10, 11, 12, 13, 1, 2, 3, 4, 5, 6, 7, 8};
	// _Alignas(32) float R[N];

	float A[12] = {1, 2, 3, 4, 5, 6, -7, 8, 1, 2, 3, 4};
	float B[12] = {6, 7, 8, 9, -10, 11, 12, 13, 1, -2, 3, 4};
	printf("%f\n", dot_product(N, A, B));
	float ans = 0;
	for (size_t i = 0; i < N; ++i) {
		ans += A[i] * B[i];
	}
	printf("\n");
	printf("%f\n ", ans);
}