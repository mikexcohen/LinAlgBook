%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Covariance matrices (chapter 18)
%
%%

%% Section 18.8, code block 18.2

% create the "data"
n = 200;
X = randn(n,4);

% mean-center
X = X-mean(X,1);

% covariance
covM = X'*X / (n-1); 

% stdevs
stdM = inv( diag(std(X)) ); 

% correlation matrix
corM = stdM* X'*X *stdM / (n-1); 

% compare covariances
disp(covM-cov(X)) 

% compare corrs
disp(corM-corrcoef(X)) 

%% done.
