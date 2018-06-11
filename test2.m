%test2.m
%任务2
clc;
clear;
close all;
data=[65 70 60 65 70; 1.7 1.75 1.65 1.80 1.78 ];
plot(data(1,:),data(2,:),'bo');
xlabel('height');ylabel('weight');
disp('(1)找到5位同学中身高最矮的那位同学的编号：');
height_data=data(2,:);%将身高数据提取出来
height_data_min=min(height_data);%求出身高最小值；
s=1;%假设身高最矮的同学的编号是
for i=1:length(height_data)%循环查找身高最矮的同学的编号
    if(find(height_data_min==height_data(i)))
        break;
    end
    s=s+1;
end
weight_data_min=data(1,s);%将身高最矮的同学的体重求出来
student_avg=[weight_data_min height_data_min];%将那位学生的数据保存到student_avg中
avg=mean(data');%将平均值数据保存到avg中
fprintf("身高最矮的那位同学的编号为：%d；\n他的体重为：%0.3fkg\n他的身高为：%0.3fm\n",s,student_avg(1),student_avg(2));
fprintf("体重平均值为：%0.3fkg\n身高平均值为：%0.3fm\n",avg(1),avg(2));
disp('press any button to continue:');
pause

disp('(2)计算该同学与均值数据之间的欧式距离：');
% % avg
% % student_avg
temp=student_avg'-avg';%计算 Xi-Xj 得到一个列向量
euclid=sqrt(temp'*temp);  
fprintf('欧式距离为：%0.4f\n',euclid);
disp('press any button to continue:');
pause

temp=student_avg'-avg';%计算 Xi-Xj 得到一个列向量
disp('(3)计算该同学与均值数据之间的马氏距离：');
X=1/2*(student_avg'+avg');%对两个样本进行求平均值操作
S1=(student_avg'-X)*(student_avg'-X)';%类似求两个样本到它们平均值之间的欧式距离
S2=(avg'-X)*(avg'-X)';%类似求两个样本到它们平均值之间的欧式距离
S=S1+S2;%两个欧式距离进行求平均值
mahalanobis=sqrt(temp'*(S^-1)*temp);%求得马氏距离
fprintf('该同学与均值数据之间的马氏距离为：%0.2f\n',mahalanobis);
disp('press any button to continue:');
pause

disp('(4)计算该同学与均值数据之间的夹角余弦距离：');
% % avg
% % student_avg
Xi=student_avg;%样品
Xj=avg';%均值数据
%欧式距离
xi=Xi(1)^2+Xi(2)^2;
xj=Xj(1)^2+Xj(2)^2;
xi_i=sqrt(Xi(1)^2+Xi(2)^2);
xj_j=sqrt(Xj(1)^2+Xj(2)^2);
%计算夹角余弦距离
anglecos=(Xi*Xj)/(xi_i*xj_j);
fprintf('(该同学与均值数据之间的夹角余弦距离：%0.2f\n',anglecos);
disp('press any button to end!');
pause
