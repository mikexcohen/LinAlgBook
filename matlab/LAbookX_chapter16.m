%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Singular value decomposition (chapter 16)
%
%%

%% Section 16.3, code block 16.2

% a fun matrix
A = [1 1 0; 0 1 1 ] ;

% and its glorious SVD
[U,S,V] = svd(A);

%% Section 16.10, code block 16.4

% matrix
A = randn(5,5);

% "my" condition number
s = svd(A);
condnum = max(s) / min(s);

% MATLAB's condition number
condnumM = cond(A);

% comparison
disp([ condnum,condnumM ])

%% Section 16.14, code block 16.6

% the matrix
m = 6;
n = 3;
A = randn(m,n);

% the SVD's
[Uf,Sf,Vf] = svd(A); % f for full
[Ue,Se,Ve] = svd(A,'econ'); % e for econ

% check out their sizes
whos A U* S* V*

%% Section 16.14, code block 16.8

% matrix
A = randn(4,5);

% get V
[V,L2] = eig(A'*A);

% sort by descending eigenvalues
[L2,idx] = sort(diag(L2),'d');
V = V(:,idx);

% same for U
[U,L2] = eig(A*A');
[L2,idx] = sort(diag(L2),'d');
U = U(:,idx); % sort by descending L


% create Sigma
S = zeros(size(A));
for i=1:length(L2)
    S(i,i) = sqrt(L2(i));
end

% check against MATLAB's SVD function
[U2,S2,V2] = svd(A);

%% Section 16.14, code block 16.10

% the matrix and its decomp
A = randn(5,3);
[U,S,V] = svd(A);

% loop over layers
figure(1), clf
for i=1:3
    subplot(2,4,i)
    
    % create a layer
    onelayer = U(:,i)*S(i,i)*V(:,i)';
    imagesc(onelayer)
    title(sprintf('Layer %g',i))
    
    % low-rank approx up to this layer
    subplot(2,4,i+4)
    lowrank = U(:,1:i)*S(1:i,1:i)*V(:,1:i)';
    imagesc(lowrank)
    title(sprintf('Layers 1:%g',i))
end

% the original (full-rank) image
subplot(248)
imagesc(A),title('Original A')

%% Section 16.14, code block 16.12

% matrix sizes
m = 6;
n = 16;

% desired condition number
condnum = 42;

% create U and V from random numbers, orthogonalized
[U,r] = qr( randn(m) );
[V,r] = qr( randn(n) );

% create singular values vector
s = linspace(condnum,1,min(m,n));
S = zeros(m,n);
for i=1:min(m,n)
    S(i,i) = s(i);
end

% construct matrix
A = U*S*V';

% confirm!
cond(A)

%% Section 16.14, code block 16.14

% get pic and convert to double
pic = imread('https://upload.wikimedia.org/wikipedia/en/8/86/Einstein_tongue.jpg');
pic = double(pic);

% SVD
[U,S,V] = svd( pic );

% components to keep
comps = 1:20;

% low-rank approximation
lowrank = U(:,comps) * S(comps,comps)*V(:,comps)';


% show the original and low-rank
figure(2), clf
subplot(121)
imagesc(pic), axis image
title('Original')

subplot(122)
imagesc(lowrank), axis image
title(sprintf('Comps. %g-%g',comps(1),comps(end)))
colormap gray

%% Section 16.14, code block 16.16

% convert to percent explained
s = 100*diag(S)./sum(S(:));

figure(3), clf
plot(s,'s-'), xlim([0 100])
xlabel('Component number')
ylabel('Pct variance explains')


% threshold in percent
thresh = 4;

% comps greater than X%
comps = s>thresh;
lowrank = U(:,comps) * S(comps,comps)*V(:,comps)';

% show the original and low-rank
figure(4)
subplot(121)
imagesc(pic), axis image
title('Original')

subplot(122)
imagesc(lowrank), axis image
title(sprintf('%g comps with > %g%%',sum(comps),thresh))
colormap gray

%% Section 16.14, code block 16.18

% initialize
RMS = zeros(length(s),1);


for si=1:length(s)
    % compute low-rank approx
    lowrank=U(:,1:si)*S(1:si,1:si)*V(:,1:si)';
    
    % difference image
    diffimg = lowrank - pic;
    
    % RMS
    RMS(si) = sqrt(mean(diffimg(:).^2));
end

figure(5), clf
plot(RMS,'s-')
xlabel('Rank approximation')
ylabel('Error (a.u.)')

%% Section 16.14, code block 16.20

% some tall matrix
X = randi([1 6],[4 2]);

% eq. 29
[U,S,V] = svd(X);

% eq. 30
longV1 = inv((U*S*V')'*U*S*V')*(U*S*V')';

% eq. 31
longV2 = inv(V*S'*U'*U*S*V')*(U*S*V')';

% eq. 32
longV3 = inv(V*S'*S*V') * (U*S*V')';

% eq. 33
longV4 = V*(S'*S)^(-1)*V'*V*S'*U';

% eq. 34
MPpinv = pinv(X);


% compare any of them to the pinv, e.g.,
MPpinv - longV3

%% Section 16.14, code block 16.22

k = 5;
n = 13;
a = pinv(ones(n,1)*k);
a - 1/(k*n) % check for zeros

%% Section 16.14, code block 16.24

% parameters
M = 10; % matrix size
nIters = 100; % number of iterations
condnums = linspace(10,1e10,30);

% initialize the average eigval differences
avediffs = zeros(nIters,length(condnums));


% loop over experiment iterations
for iteri=1:nIters
    
    % condition numbers
    for condi=1:length(condnums)
        
        % create A
        [U,~] = qr( randn(M) );
        [V,~] = qr( randn(M) );
        S = diag( linspace(condnums(condi),1,M) );
        A = U*S*V'; % construct matrix
        
        
        % create B
        [U,~] = qr( randn(M) );
        [V,~] = qr( randn(M) );
        S = diag( linspace(condnums(condi),1,M) );
        B = U*S*V'; % construct matrix
        
        
        % eigenvalues
        l1 = eig(A,B);
        l2 = eig(inv(B)*A);
        
        % and sort
        l1 = sort(l1);
        l2 = sort(l2);
        
        % store the differences
        avediffs(iteri,condi) = mean(abs(l1-l2));
    end
end

% plot
figure(6), clf
plot(condnums,nanmean(avediffs),'s-')
xlabel('Condition number')
ylabel('\Delta\lambda')

%% done.
