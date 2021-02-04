%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Vectors (chapter 2)
% 
%%

%% Section 2.1, code block 2.2

% creating scalars (numeric variables)
aScalar = 4;


%% Section 2.2, code block 2.4


% create a vector
v = [ 2 -1];


% plot it
figure(1), clf
plot([0 v(1)],[0 v(2)],'k')
axis([-3,3,-3,3])
grid on

%% Section 2.2, code block 2.6

% row vector
v1 = [ 2 5 4 7 ];


% column vector
v2 = [ 2; 5; 4; 7 ];

%% Section 2.3, code block 2.8

% start with a row vector
v1 = [ 2 5 4 7 ];

% transpose to a column vector
v2 = v1';


%% Section 2.5, code block 2.10

% two vectors
v1 = [ 2 5 4 7 ];
v2 = [ 4 1 0 2 ];

% scalar-multiply and add
v3 = 4*v1 - 2*v2;

%% Section 2.9, code block 2.12

% the "base" vector
v = [ 1 2 ];

figure(2), clf, hold on
plot([0 v(1)],[0 v(2)],'linew',2)

for i=1:10
    
    % random scalar
    s = randn;
    sv = s*v;
    
    % plot that one on top
    plot([0 sv(1)],[0 sv(2)],'linew',2)
end

grid on
axis([-1 1 -1 1]*4)
axis square

%% done.
