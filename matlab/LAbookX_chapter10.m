%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Systems of equations (chapter 10)
% 
%%

%% Section 10.3, code block 10.2

% create a matrix
A = randn(4,3);

% take its LU decomposition
[L,U,P] = lu(A);

%% Section 10.5, code block 10.4

A = randn(2,4);

% its RREF
rref(A)

%% Section 10.12, code block 10.6

% the matrix
A = [ 2 0 -3; 3 1 4 ; 1 0 -1];

% note: column vector!
x = [ 2 3 4 ]';

% the constants vector
b = A*x;


%% Section 10.12, code block 10.8

% one example
rref(randn(3,6))

%% done.

