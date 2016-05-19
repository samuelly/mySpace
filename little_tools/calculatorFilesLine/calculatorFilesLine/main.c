//
//  main.c
//  calculatorFilesLine
//
//  Created by zhuqi on 16/5/18.
//  Copyright © 2016年 zhuqi. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <unistd.h>

#define MAX_LENGTH 1024

int readFileList(char *basePath);
int getFileLineNum(char *fileName);
void getRunningEnvPath(char *wholeName);

static int lineNumber = 0;
static long totalLineNum = 0;
static char runningPath[MAX_LENGTH];
const char *programName = "calculatorFilesLine";

int main(int argc, const char * argv[]) {
    char runningEnvWholePathName[MAX_LENGTH];
    
    ///get the current absoulte path
    memset(runningEnvWholePathName, '\0', sizeof(runningEnvWholePathName));
    memset(runningPath, '\0', sizeof(runningPath));
    
    //getcwd(basePath, MAX_LENGTH - 1); 
    strcpy(runningEnvWholePathName, argv[0]);  // 从argv[]中获取运行程序时的带当前路径的名称
    //printf("the running program name is : %s\n",runningEnvWholePathName);
    getRunningEnvPath(runningEnvWholePathName);
    readFileList(runningPath);
    
    return 0;
}

void getRunningEnvPath(char *wholePathName)
{
    unsigned long nameLength = strlen(programName);
    unsigned long wholePathLength = strlen(wholePathName);
    memcpy(runningPath, wholePathName, wholePathLength - nameLength);
}

int readFileList(char *basePath)
{
    DIR *dir;
    struct dirent *ptr;
    char base[MAX_LENGTH];
    char fileWholePath[255];
    
    if ((dir=opendir(basePath)) == NULL)
    {
        perror("Open dir error...");
        exit(1);
    }
    
    while ((ptr=readdir(dir)) != NULL)
    {
        if(strcmp(ptr->d_name,".")==0 || strcmp(ptr->d_name,"..")==0)    ///current dir OR parrent dir
            continue;
        else if(ptr->d_type == 8) {   ///file
            if (strcmp(ptr->d_name, programName) == 0) { // 当打开本程序文件时不计入统计
                continue;
            }
            
            strcpy(fileWholePath, basePath);
            strcat(fileWholePath, "/");
            strcat(fileWholePath, ptr->d_name);
            lineNumber = getFileLineNum(fileWholePath); //不知何原因，mac下需要传入文件的完整路径，fopen才能正确打开，光文件名不行
            printf("file name : %s/%s lineNum : %d\n",basePath,ptr->d_name,lineNumber);
        } else if(ptr->d_type == 10)    ///link file
            printf("d_name:%s/%s\n",basePath,ptr->d_name);
        else if(ptr->d_type == 4)    ///dir
        {
            memset(base,'\0',sizeof(base));
            strcpy(base,basePath);
            strcat(base,"/");
            strcat(base,ptr->d_name);
            readFileList(base);
        }
        
        totalLineNum += lineNumber;
    }
    printf("total line number in the folder is : %ld\n",totalLineNum);
    closedir(dir);
    return 1;
}

int getFileLineNum(char *fileName)
{
    int lineNum = 0;
    FILE *fp;  // 指向文件的指针
    char buffer[MAX_LENGTH];  //缓冲区，存储读取到的每行的内容
    
    if ((fp = fopen(fileName, "rt+")) == NULL) { // 以读取二进制文件方式打开
        perror(fileName);
        return 0;
    }
    
    while (fgets(buffer, MAX_LENGTH - 1, fp)) { // 读取一行内容
        lineNum ++;
    }
    
    fclose(fp);
    
    return lineNum;
}

///**
// * 统计文件的字符数、单词数、行数
// *
// * @param  filename  文件名
// * @param  totalNum  文件统计数据
// *
// * @return  成功返回统计数据，否则返回NULL
// **/
//int *getCharNum(char *filename, int *totalNum){
//    FILE *fp;  // 指向文件的指针
//    char buffer[1003];  //缓冲区，存储读取到的每行的内容
//    int bufferLen;  // 缓冲区中实际存储的内容的长度
//    int i;  // 当前读到缓冲区的第i个字符
//    char c;  // 读取到的字符
//    int isLastBlank = 0;  // 上个字符是否是空格
//    int charNum = 0;  // 当前行的字符数
//    int wordNum = 0; // 当前行的单词数
//    if( (fp=fopen(filename, "rb")) == NULL ){
//        perror(filename);
//        return NULL;
//    }
//    printf("line   words  chars\n");
//    // 每次读取一行数据，保存到buffer，每行最多只能有1000个字符
//    while(fgets(buffer, 1003, fp) != NULL){
//        bufferLen = strlen(buffer);
//        // 遍历缓冲区的内容
//        for(i=0; i<bufferLen; i++){
//            c = buffer[i];
//            if( c==' ' || c=='\t'){  // 遇到空格
//                !isLastBlank && wordNum++;  // 如果上个字符不是空格，那么单词数加1
//                isLastBlank = 1;
//            }else if(c!='\n'&&c!='\r'){  // 忽略换行符
//                charNum++;  // 如果既不是换行符也不是空格，字符数加1
//                isLastBlank = 0;
//            }
//        }
//        !isLastBlank && wordNum++;  // 如果最后一个字符不是空格，那么单词数加1
//        isLastBlank = 1;  // 每次换行重置为1
//        // 一行结束，计算总字符数、总单词数、总行数
//        totalNum[0]++;  // 总行数
//        totalNum[1] += charNum;  // 总字符数
//        totalNum[2] += wordNum;  // 总单词数
//        printf("%-7d%-7d%d\n", totalNum[0], wordNum, charNum);
//        // 置零，重新统计下一行
//        charNum = 0;
//        wordNum = 0;
//    }
//    return totalNum;
//}


