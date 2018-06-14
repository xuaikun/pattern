% 任务四 画图
clc;
clear;
close all;

x3=0:0.1:1;
x1=[ 0 0 1 1];
x2=[ 0 1 0 1];

stem(x1(1:2),x2(1:2),'bX');
hold on
stem(x1(3:4),x2(3:4),'bo');
text(0,0,'x1');
text(0,1,'x2');
text(1,0,'x3');
text(1,1,'x4');
text(0.6,0.6,'g(x)=-2*x+1=0')
hold on
x1=0.5;
plot(x1,x3,'b*');
xlabel('x');

