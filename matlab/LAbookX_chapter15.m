%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Eigendecomposition (chapter 15)
% 
%%

%% Section 15.4, code block 15.2

% friendly little matrix
A = [ 2 3; 3 2 ];

% vector of eigenvalues
L = eig(A); 

% diagonalization
[V,L] = eig(A);

%% Section 15.12, code block 15.4

% create two matrices
n = 3;
A = randn(n);
B = randn(n);

% note the order of inputs
[evecs,evals] = eig(A,B);

%% Section 15.16, code block 15.6

% largest matrix size
maxN = 100;

% initialize
avediffs = zeros(maxN,1);

for n=1:maxN
    
    % create matrices
    A = randn(n);
    B = randn(n);
    
    % GED two ways
    l1 = eig(A,B);
    l2 = eig(inv(B)*A);
    
    % sort the eigenvalues
    l1 = sort(l1);
    l2 = sort(l2);
    
    % store the differences
    avediffs(n) = mean(abs(l1-l2));
end

figure(1), clf
plot(avediffs,'s-')
xlabel('Matrix size')
ylabel('\Delta\lambda')

%% Section 15.16, code block 15.8

% create a diagonal matrix
D = diag(1:5);

% check out its eigendecomposition
[V,L] = eig(D)

%% Section 15.16, code block 15.10

% create the Hankel matrix
N = 50;
T = toeplitz(1:N);
H = hankel(1:N,[N 1:N-1]);

% diagonalize
[V,D] = eig(H);
[~,sidx] = sort(diag(D),'descend');
V = V(:,sidx);


% visualize
figure(2), clf

% the matrix
subplot(221) 
imagesc(H)
axis square

% all eigenvectors
subplot(222) 
imagesc(V)
axis square

% a few evecs
subplot(212) 
plot(V(:,1:4),'o-')

%% done.
