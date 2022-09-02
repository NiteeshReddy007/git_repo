#include <stdio.h>
#include <sys/types.h>          /* See NOTES */
#include <sys/socket.h>
#include <unistd.h> // for exit function 
#define _GNU_SOURCE 
#define PORT 7001 
int main()
{
    int serfd;

    serfd = socket(AF_INET,SOCK_STREAM,0); // raw socket descriptor
       
       if(serfd == -1)
       {
           printf("error in socket");
           exit();
       }
     
     struct sockaddr_in servadd;
     

     //int bind(int sockfd, const struct sockaddr *addr,
     //           socklen_t addrlen);

  servadd.sin_family = AF_INET;
  servadd.sin_addr.s_addr = INADDR_ANY;
  servadd.sin_port = htons(PORT);

   if(bind(serfd,(struct sockaddr*)&servadd,sizeof(servadd)) < 0)
   {
       printf("error at bind system call");
       exit();
   } 

   listen(serfd,10);  //
   
   int addrlen = sizeof(servadd);
   int newfd;  
   
       newfd = accept(serfd, (struct sockaddr*)servadd,(socklen_t*)&addrlen);
           
       
       if(newfd == -1)
       {
           printf("error at accept system call");
       }


      char inbuff[1024];

      read(newfd,inbuff,1024);

      write(newfd,inbuff,1024);
   
     getchar();
    return 0;
}