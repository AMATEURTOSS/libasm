#include "../includes/libasm.h"

#define ANSI_COLOR_RED     "\x1b[31m"
#define ANSI_COLOR_GREEN   "\x1b[32m"
#define ANSI_COLOR_YELLOW  "\x1b[33m"
#define ANSI_COLOR_BLUE    "\x1b[34m"
#define ANSI_COLOR_MAGENTA "\x1b[35m"
#define ANSI_COLOR_CYAN    "\x1b[36m"
#define ANSI_COLOR_RESET   "\x1b[0m"

int main()
{
	/*
	** ft_strlen
	*/

	printf(ANSI_COLOR_CYAN "ft_strlen---------------------------------" ANSI_COLOR_RESET "\n");
	char *src_strlen = "hello world";
	int num_strlen = ft_strlen(src_strlen);
	printf("src: \"%s\" len: \"%d\"\n", src_strlen, num_strlen);

	/*
	** ft_strcpy
	*/
	printf(ANSI_COLOR_CYAN "ft_strcpy---------------------------------" ANSI_COLOR_RESET "\n");
	char *src_strcpy = "hello world";
	char dst_strcpy[100];
	char *ret_strcpy = ft_strcpy(dst_strcpy, src_strcpy);
	printf("src: \"%s\" dst: \"%s\"\n", src_strcpy, dst_strcpy);
	printf("return value of ft_strcpy: \"%s\"\n", ret_strcpy);

	/*
	** ft_strcmp
	*/

	printf(ANSI_COLOR_CYAN "ft_strcmp---------------------------------" ANSI_COLOR_RESET "\n");
	char *str_strcmp = "hello";
	char *str2_strcmp = "hello";
	char *str3_strcmp = "hello 425";

	int num_strcmp = ft_strcmp(str_strcmp, str2_strcmp);
	int num2_strcmp = strcmp(str_strcmp, str2_strcmp);
	int num3_strcmp = ft_strcmp(str2_strcmp, str3_strcmp);
	int num4_strcmp = strcmp(str2_strcmp, str3_strcmp);
	printf("ft_strcmp same str: %d\n", num_strcmp);
	printf("strcmp same str: %d\n", num2_strcmp);
	printf("ft_strcmp diff str: %d\n", num3_strcmp);
	printf("strcmp diff str: %d\n", num4_strcmp);

	/*
	** ft_write
	*/

	printf(ANSI_COLOR_CYAN "ft_write----------------------------------" ANSI_COLOR_RESET "\n");
	int fd_write = open("./test.txt", O_WRONLY);
	int wrong_fd_write = open("./doesntexist.txt", O_RDWR);
	int num_write = ft_write(fd_write, "hello world", 11);
	int num2_write = ft_write(1, "\"hello world\" is written in test.txt\n", 38);
	int num3_write = ft_write(wrong_fd_write, "hello world", 11);
	printf("first write: %d \nsecond write: %d \nthird write: %d\n", num_write, num2_write, num3_write);
	close(fd_write);
	close(wrong_fd_write);

	/*
	** ft_read
	*/

	printf(ANSI_COLOR_CYAN "ft_read-----------------------------------" ANSI_COLOR_RESET "\n");
	char str_read[100];
	char str2_read[100];
	int fd_read = open("./test.txt", O_RDONLY);
	int wrong_fd_read = open("./doesntexist.txt", O_RDONLY);
	int num_read = ft_read(fd_read, str_read, 11);
	int num2_read = ft_read(wrong_fd_read, str2_read, 11);
	printf("The value inside the file: \"%s\"\n", str_read);
	printf("first read: %d \nsecond read: %d \n", num_read, num2_read);
	close(fd_read);
	close(wrong_fd_read);

	/*
	** ft_strdup
	*/

	printf(ANSI_COLOR_CYAN "ft_strdup---------------------------------" ANSI_COLOR_RESET "\n");
	char *str_strdup = "hello world";
	char *copy_strdup;

	copy_strdup = ft_strdup(str_strdup);
	printf("origin: %s\n", str_strdup);
	printf("copy: %s\n", copy_strdup);
	printf(ANSI_COLOR_CYAN "END---------------------------------------" ANSI_COLOR_RESET "\n");
}