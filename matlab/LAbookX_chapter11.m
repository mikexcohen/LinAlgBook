%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Determinant (chapter 11)
% 
%%

%% Section 11.6, code block 11.2

A = randn(3,3);
det(A)


%% Section 11.6, code block 11.4

% random matrix and vector
A = randi([0 10],4);
b = randi([-10 -1],1);

% show equivalence
[ det(b*A) b^4*det(A) ]


%% Section 11.6, code block 11.6

% matrix sizes
ns = 3:30;

% iterations
iters = 100;

% initialize results matrix
dets = zeros(length(ns),iters);

% loop over matrix sizes
for ni=1:length(ns)
    for i=1:iters
        
        % step 1
        A = randn(ns(ni));
        
        % step 2
        A(:,1) = A(:,2);
        
        % step 3
        dets(ni,i) = abs(det(A)); 
    end
end

% show in a plot
figure(1), clf
plot(ns,log(mean(dets,2)),'s-')
xlabel('Matrix size')
ylabel('Log determinant')

%% done.
