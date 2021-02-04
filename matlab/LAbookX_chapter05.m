%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Matrices (chapter 5)
% 
%%

%% Section 5.4, code block 5.2

% create a matrix of random numbers
A = randn(2,5);

% two ways to transpose
At1 = A';
At2 = transpose(A);


%% Section 5.5, code block 5.4

% identity matrix
I = eye(4);

% ones matrix
O = ones(4);

% zeros matrix
Z = zeros(4);


%% Section 5.5, code block 5.6

% diagonal matrix from a vecot
D = diag([ 1, 2, 3, 5]);

% diagonal of a full matrix
R = randn(3,4);
d = diag(R);


%% Section 5.5, code block 5.8

% random numbers matrix
A = randn(3,5);

% another random matrix
B = randn(3,4);

% augmented matrix
AB = [A B];


%% Section 5.5, code block 5.10

% Create a matrix
A = randn(5);

% extract the lower triangle
L = tril(A);

% extract the upper triangle
U = triu(A);

%% Section 5.5, code block 5.12

% start from this vector
t = 1:4;

% toeplitz
T = toeplitz(t);

% hankel
H = hankel(t,t([end 1:end-1]));

%% Section 5.8, code block 5.14

% scalar to shift by
l = .01;

% identity matrix
I = eye(4);

% just some matrix
A = randn(4);

% shifted version
As = A + l*I;

%% Section 5.9, code block 5.16

% a matrix
A = randn(4);

% its trace
tr = trace(A);

%% Section 5.13, code block 5.18

% create two matrices
A = randn(4,2);
B = randn(4,2);

% initialize the result
C = zeros(2);

% the multiplications
for coli=1:2 % columns in A
    for colj=1:2 % columns in B
        C(coli,colj) = dot(A(:,coli),B(:,colj));
    end
end

%% Section 5.13, code block 5.20

% a full matrix
A = randn(4);

% get the upper-triangle
Al = tril(A);

% sum it with its transpose
S = Al + Al';

%% Section 5.13, code block 5.22

% empty rectangular matrix
D = zeros(4,8);

% populate its diagonals
for d=1:min(size(D))
    D(d,d) = d;
end

%% done.
