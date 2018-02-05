#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

#define NUM_BYTES 16

int main() {
  int fd_devrandom;
  int fd_machineid;
  unsigned char buf[NUM_BYTES];
  char str[NUM_BYTES*2+1];
  size_t pos, ret;
  struct stat stat_buf;

  fd_machineid=open("/etc/machine-id", O_WRONLY);
  if (fd_devrandom<0) {
    return 0; //don't modify file unless it is present and empty
  }
  ret=fstat(fd_machineid, &stat_buf);
  if (ret != 0) {
    printf("Warning: Error statting /etc/machine-id in docker-machine-id-setup\n");
    return 1;
  }
  if (stat_buf.st_size != 0) {
    return 0; //don't modify file unless it is present and empty
  }

  fd_devrandom=open("/dev/random", O_RDONLY);
  if (fd_devrandom<0) {
    printf("Warning: Couldn't open /dev/random in docker-machine-id-setup\n");
    return 1;
  }

  for (pos=0; pos < NUM_BYTES; pos+=ret) {
    ret=read(fd_devrandom, buf + pos, NUM_BYTES-pos);
    if (ret<0) {
      printf("Warning: Error reading from /dev/random in docker-machine-id-setup\n");
    }
  }
  close(fd_devrandom);

  for (pos=0; pos < NUM_BYTES; pos++) {
    sprintf(str+pos*2, "%02x", buf[pos]);
  }
  str[pos*2]='\n';
  ret=write(fd_machineid, str, pos*2+1);
  close(fd_machineid);
}
