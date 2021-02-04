%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Matrix inverse (chapter 12)
% 
%%

%% Section 12.4, code block 12.2

% a square matrix (full-rank!)
A  = randn(3,3);

% inverse
Ai = inv(A);

% should equal identity
A*Ai

%% Section 12.5, code block 12.4

% invertible matrix
A = randn(3);

% RREF with identity
Ar = rref([A eye(3)]); % RREF

% extract the inverse part
Ar = Ar(:,4:end);

% inverse via inv function
Ai = inv(A);

% check for equality
Ar-Ai


%% Section 12.7, code block 12.6

% tall matrix
A = randn(5,3);

% left inverse
Al = inv(A'*A)*A';

% check for I
Al*A


%% Section 12.8, code block 12.8

% make a reduced-rank matrix
A = randn(3,3);
A(2,:) = A(1,:);

% MP pseudoinverse
Api = pinv(A);

Api*A

%% Section 12.12, code block 12.10

% create matrix
m = 4;
A = randn(m);
[M,G] = deal( zeros(m) );

% compute matrices
for i=1:m
  for j=1:m
        
    %% select rows/cols
    rows = true(1,m);
    rows(i) = false;
        
    cols = true(1,m);
    cols(j) = false;
        
    % compute M
    M(i,j) = det( A(rows,cols) );
        
    % compute G
    G(i,j) = (-1)^(i+j);
  end
end

% compute C
C = M .* G;

% compute A
Ainv = C'/det(A);
AinvI = inv(A);
AinvI-Ainv % compare against inv()

%% Section 12.12, code block 12.12

% square matrix
A   = randn(5);
Ai  = inv(A);
Api = pinv(A);
Ai - Api % test equivalence

% tall matrix
T   = randn(5,3);
Tl  = inv(T'*T)*T'; % left inv
Tpi = pinv(T); % pinv
Tl - Tpi % test equivalance

%% done.
