%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Complex numbers (chapter 9)
% 
%%

%% Section 9.2, code block 9.2

% one way to create a complex number
z = complex(3,4);

% initialize zeros
Z = zeros(2,1);

% can simply replace one element with a complex number
Z(1) = 3+4i;

%% Section 9.3, code block 9.4

% some random real and imaginary parts
r = randi([-3,3],1,3);
i = randi([-3,3],1,3);

% combine into a matrix
Z = r + i*1j;

% its conjugate
conj(Z)

%% Section 9.5, code block 9.6

% a complex vector
v = [ 0 1i ];

% Hermitian dot product
dot(v,v)

%% Section 9.10, code block 9.8

U = .5 * [ 1 + 1i 1-1i; 1-1i 1+1i ];

% Hermitian
U'*U 

% not Hermitian
transpose(U)*U 

%% Section 9.10, code block 9.10

% create a complex matrix
A = complex(randn(3,3) , randn(3,3));

% new matrices by adding and multiplying
A1 = A+A';
A2 = A*A';


ishermitian(A1) % issymmetric(A1) is false!
ishermitian(A2)

%% done.
