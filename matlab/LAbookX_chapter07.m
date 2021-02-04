%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Rank (chapter 7)
% 
%%

%% Section 7.3, code block 7.2

% a matrix
A = randn(3,6);

% and its rank
r = rank(A)

%% Section 7.4, code block 7.4

% scalar
s = randn;

% matrix
M = randn(3,5);

% their ranks
r1 = rank(M);
r2 = rank(s*M);

% are the same
disp ([ r1 r2 ])


%% Section 7.10, code block 7.6

% inspect the source code for rank
edit rank


%% Section 7.15, code block 7.8

% two random matrices
A = randn(9,2);
B = randn(2,16);

% the rank of their product (assume max possible)
C = A*B;


%% Section 7.15, code block 7.10

% zeros matrix
Z = zeros(5);

% tiny noise matrix
N = randn(5) * eps*1e-307;

% add them together
ZN = Z + N;

% check their ranks
rank(Z) % r=0
rank(ZN) % r=5

% and the matrix norm
norm(ZN,'fro')

%% done.
