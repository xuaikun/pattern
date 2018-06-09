%test1
% 任务一 课本38页
clc;
clear;
close all;
data=[65 70 60 65 70;1.7 1.75 1.65 1.80 1.78];
% disp('（1）计算体重与身高的均值向量，运行结果如下：');
% disp('均值向量为:');
% avg=mean((data'))%求均值向量
% fprintf("体重均值为：%.4f;\n身高的均值为:%.4f; \n",avg(1),avg(2))
% 
% fprintf("print  any button to continue \n");
% pause

% disp('（2）计算体重与身高的方差向量，运行结果如下：');
% disp('方差向量为:');
% var_data=var(data')%求方差向量
% fprintf("体重方差为：%.4f;\n身高的方差为:%.4f; \n",var_data(1),var_data(2))
% 
% % fprintf("print  any button to continue \n");
% % pause
% 
% disp('（3）计算体重与身高的协方差矩阵，运行结果如下：');
% disp('协方差矩阵为:');
% cov_data=cov(data')
% 
% % fprintf("print  any button to continue \n");
% % pause
% 
% disp('（4）计算体重与身高的相关系数矩阵，运行结果如下：');
% disp('相关系数矩阵为:');
% corr_data=corrcoef(data')

% fprintf("print  any button to continue \n");
% pause

%%
% 接下来是PCA操作
%% ================== Part 1: Load Example Dataset  ===================
%  We start this exercise by using a small
%  dataset that is easily to visualize
% 数据可视化
fprintf('Visualizing example dataset for PCA.\n\n');

%  The following command loads the dataset. 
%  You should now have the 
%  variable X in your environment 定义变量X
X=data';
plot(X(:, 1), X(:, 2), 'bo');
axis square;

fprintf('Program paused. Press enter to continue.\n');
pause;

 
%% =============== Part 2: Principal Component Analysis ===============
%  You should now implement PCA, a dimension 
%  reduction technique. You
%  should complete the code in pca.m
%
fprintf('\nRunning PCA on example dataset.\n\n');

%  Before running PCA, it is important to first normalize X
%  处理数据前对数据进行规范化
%  标准化值 平均值 标准差
[X_norm, mu, sigma] = featureNormalize(X);

%  Run PCA
%  执行pca
%%%%%%%%%%%%%%%%      pca.m需要修改
[U, S] = pca(X_norm)

%  Compute mu, the mean of the each feature
%  计算每个特征的平均值
%  Draw the eigenvectors centered at mean of data.
%  These lines show the
%  directions of maximum variations in the dataset.
hold on;
%   mu 为平均值 其是1X2的矩阵，所以U也必须为xX2的矩阵
drawLine(mu, mu + 1.5 * S(1,1) * U(:,1)', '-k', 'LineWidth', 2);
drawLine(mu, mu + 1.5 * S(2,2) * U(:,2)', '-k', 'LineWidth', 2);
hold off;

fprintf('Top eigenvector: \n');
fprintf(' U(:,1) = %f %f \n', U(1,1), U(2,1));
