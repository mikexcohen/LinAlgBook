%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Least squares (chapter 14)
% 
%%

%% Section 14.10, code block 14.2

% load the data
data = load('widget_data.txt');

% design matrix
X = [ones(1000,1) data(:,1:2)];

% outcome variable
y = data(:,3);

% beta coefficients
beta = X\y;

% scaled coefficients (intercept not scaled)
betaScaled = beta'./std(X);


%% Section 14.10, code block 14.4

figure(1), clf
subplot(121)
plot(X(:,2),y,'o','markerfacecolor','k')
axis square, title('Time variable')
xlabel('Time of day')
ylabel('Widgets purchased')


subplot(122)
plot(X(:,3),y,'o','markerfacecolor','k')
axis square, title('Age variable')
xlabel('Age'), ylabel('Widgets purchased')


%% Section 14.10, code block 14.6

% predicted data values
yHat = X*beta;

% R-squared
r2 = 1 - sum((yHat-y).^2) / sum((y-mean(y)).^2);

%% done.
