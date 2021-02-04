%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Matrix spaces (chapter 8)
% 
%%

%% Section 8.7, code block 8.2

A = randn(3,4);
null(A)


%% Section 8.15, code block 8.4

% create reduced-rank matrices
A = randn(4,3) * randn(3,4);
B = randn(4,3) * randn(3,4);

% find a vector in A's nullspace
n = null(A);

% zeros vector
B*A*n

% not zeros vector
A*B*n

%% Section 8.15, code block 8.6

% create a rank-9 matrix
A = randn(16,9) * randn(9,11);

% "right" null space
rn = null(A);

% left-null space
ln = null(A');

% rank of the matrix
r = rank(A);

% check the dimensionalities!
size(rn,2) + r
size(ln,2) + r

%% done.
