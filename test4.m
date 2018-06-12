%%
%test4.m
%任务4 奖惩算法
clc;
clear;
close all;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%函数名称：jiangcheng（）
%参数：sample：待识别样品特征
%返回值：y：待识别样品所属类别
%函数功能：奖惩算法
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load templet pattern
w = zeros(26,10);%初始化权矢量矩阵
d = [];
maxpos = 0;
maxval = 0;
f = 1;
n = [];m = [];
%依次输入样本
for j = 1:100
    f=1;
    pattern(i).feature(26,j) = 1;%最后一位置1
    for k = 1:10
        m = pattern(i).feature(:,j);
        d(k) = w(:,k)'*m;
    end
    %判断是否为最大值，如果是，f = 1,否则f = 0；
    for k = 1:10
        if k ~= i
            if d(i) <= d(k)
                f = 0;
            end
        end
    end
    %修正权值
    if ~f
        for k = 1:100
            if k == i
                w(:,k) = w(:,k) + pattern(i).feature(:,j);
            else
                w(:,k) = w(:,k) - pattern(i).feature(:,j);
            end
        end
    end
end
sample(26) =1;
h = [];
%计算各类别的判别函数
for k = 1:10
    h(k) = w(:,k)'*sample';
end
[maxval,maxpos] = max(h);
y = maxpos - 1

