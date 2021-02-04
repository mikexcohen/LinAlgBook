%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Matrix multiplications (chapter 6)
% 
%%

%% Section 6.1, code block 6.2

% two matrices
M1 = randn(4,3);
M2 = randn(3,5);

% and their product
C = M1 * M2;

%% Section 6.2, code block 6.4

A = randn(2,2);
B = randn(2,2);

% notice that C1 != C2
C1 = A*B;
C2 = B*A;

%% Section 6.8, code block 6.6

% a pair of matrices
M1 = randn(4,3);
M2 = randn(4,3);

% their Hadamard multiplication
C = M1 .* M2

%% Section 6.9, code block 6.8

% a small matrix
A = [ 1, 2, 3; 4, 5, 6 ];

% vectorized
A(:)

%% Section 6.9, code block 6.10

A = randn(4,3);
B = randn(4,3);

% the transpose-trace trick for the frobenius dot product
f = trace(A'*B);

%% Section 6.10, code block 6.12

A = randn(4,3);
norm(A,'fro')

%% Section 6.15, code block 6.14

% the matrices
A = randn(2,4);
B = randn(4,3);

% initialize
C1 = zeros(2,3);

% loop over (N) columns in A
for i=1:size(A,2)
    C1 = C1 + A(:,i)*B(i,:);
end

% show equality by subtraction (expect zeros)
C1 - A*B 


%% Section 6.15, code block 6.16

% create the matrices
D = diag(1:4);
A = randn(4);

% two kinds of multiplication
C1 = D.*A;
C2 = D*A;

% they're the same
[diag(C1) diag(C2)]


%% Section 6.15, code block 6.18

% the matrix
A = diag(rand(3,1));

% the two symmetric matrices
C1 = (A'+A)/2;
C2 = A'*A;

% their equivalence
C1-sqrt(C2)

%% Section 6.15, code block 6.20

% matrix and vector
m = 5;
A = randn(m);
v = randn(m,1);

% the two sides of the equation
LHS = norm(A*v);
RHS = norm(A,'fro')*norm(v);

% their difference
RHS-LHS % should always be positive

%% done.
