%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Projections and orthogonalization (chapter 13)
% 
%%

%% Section 13.2, code block 13.2

% matrix and vector
A = [1 2; 3 1; 1 1 ] ;
b = [ 5.5 -3.5 1.5 ]';

% short-cut for least-squares solver
A\b


%% Section 13.6, code block 13.4

% the matrix
A = randn(4,3);

% its QR decomposition
[Q,R] = qr(A);


%% Section 13.11, code block 13.6

% sizes
m = 4;
n = 4;

% matrix
A = randn(m,n);

% initialize
Q = zeros(m,n);

for i=1:n % loop through columns (n)
    
    Q(:,i) = A(:,i);
    
    % orthogonalize
    if i>1
        a = A(:,i); % convenience
        for j=1:i-1 % only to earlier columns
            q = Q(:,j); % convenience
            Q(:,i) = Q(:,i) - (a'*q/(q'*q)) * q;
        end
    end
    
    % normalize
    Q(:,i) = Q(:,i) / norm(Q(:,i));
end

% test against "real" Q matrix
[Q2,R] = qr(A);

% note the possible sign differences.
% seemingly non-zero columns will be 0 when adding
Q - Q2

%% done.
