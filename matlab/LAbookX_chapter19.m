%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Principal components analysis (chapter 19)
%
%%

%% Section 19.7, code block 19.2

% create data
N = 1000;
h = linspace(150,190,N) + randn(1,N)*5;
w = h*.7 - 50 + randn(1,N)*10;

% covariance
X = [h' w'];
X = X-mean(X,1);
C = X'*X / (length(h)-1);

% PCA and sort results
[V,D] = eig(C);
[eigvals,i] = sort(diag(D),'descend');
V = V(:,i);
eigvals = 100*eigvals/sum(eigvals);
scores = X*V; % not used but useful code

% plot data with PCs
figure(1), clf, hold on
plot(X(:,1),X(:,2),'ro')
plot([0 V(1,1)]*45,[0 V(2,1)]*45,'k','linew',2)
plot([0 V(1,2)]*25,[0 V(2,2)]*25,'k','linew',2)
xlabel('Height (cm)'), ylabel('Weight (kg)')
axis([-1 1 -1 1]*50), axis square

%% Section 19.7, code block 19.4

% mean-center
X = X-mean(X,1);

% SVD
[U,S,Vv] = svd(X); % Vv == V

% scores
scores = X*Vv;

% normalized svals
s = diag(S).^2 / (length(X)-1);
s = 100*s/sum(s); % s == eigvals

%% done.
