% test3.m
%任务3
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%函数名称：bayesleasterror()
%参数：sample：待识别的样品特征
%返回值：y：待识别样品所属类别
%函数功能：最小错误概率的贝叶斯分类器
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clc;
clear;
close all;
% load templet pattern;%加载文件
pattern=[65 70 60 65 70; 1.7 1.75 1.65 1.80 1.78 ];
%对样品库和待测样品进行主成分分析
[pcapat,pcasamp] = pca(sample);
temp = 0;
for i = 1:10
    pattern(i).feature = pcapat(:,temp + 1:temp+pattern(i).num);
    temp = temp + pattern(i).num;
end
s_cov = [];
s_inv = [];
s_det = [];
for i = 1:10
    s_cov(i).dat = cov(pattern(i).feature');%求各类别的协方差矩阵
    s_inv(i).dat = inv(s_cov(i).dat);%求协方差矩阵的逆矩阵
    s_det(i) = det(s_cov(i).dat);%求协方差矩阵的行列式
end
sum1 = 0;
p = [];
for i = 1:10
    sum1 = sum1 + pattern(i).num;%求样品库样品总数
end
for i = 1:10
    p(i) = pattern(i).num/sum1;%求各类别的先验概率
end
h = [];
mean_sap = [];
for i = 1:10
    mean_sap(i).dat = mean(pattern(i).feature')';%求每一类样品的特征值
end
%计算最大的判别函数
for i = 1:10
    h(i) = (pcasamp-mean_sap(i).dat)'*s_inv(i).dat*(pcasamp-mean_sap(i).dat)...
        *(-0.5)+log(p(i))+log(abs(s_det(i)))*(-0.5);
end
[maxval maxpos] = max(h);
y = maxpos - 1;
