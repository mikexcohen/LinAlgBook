%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Vector Multiplications (chapter 3)
% 
%%

%% Section 3.1, code block 3.2

% create two vectors
v1 = [ 2 5 4 7 ];
v2 = [ 4 1 0 2 ];

% dot product between them
dp = dot (v1,v2);

%% Section 3.5, code block 3.4

% some scalars
l1 = 1;
l2 = 2;
l3 = -3;

% some vectors
v1 = [ 4 5 1 ]';
v2 = [-4 0 -4 ]';
v3 = [ 1 3 2 ]';

% a linear weighted combination
l1*v1 + l2*v2 + l3*v3

%% Section 3.6, code block 3.6

% two column vectors
v1 = [ 2, 5, 4, 7 ]';
v2 = [ 4 1 0 2 ]';

% outer product
op = v1 * v2';


%% Section 3.7, code block 3.8

% two vectors
v1 = [ 2, 5, 4, 7 ];
v2 = [ 4, 1, 0, 2 ];

% Hadamard multiplication
v3 = v1 .* v2;

%% Section 3.9, code block 3.10

% a vector
v = [2 5 4 7];

% its norm
vMag = norm(v);

% the unit vector
v_unit = v / vMag;



%% Section 3.13, code block 3.12

% three vectors
v1 = [ 1, 2, 3, 4, 5 ];
v2 = [ 2, 3, 4, 5, 6 ];
v3 = [ 3, 4, 5, 6, 7 ];

% linear weighted combo
w = [ -1 3 -2 ];
result = v1*w(1) + v2*w(2) + v3*w(3)

%% Section 3.13, code block 3.14

v = [ 7 4 -5 8 3 ]';
o = ones ( size(v) ) ;

% average via dot product
ave = dot(v,o) / length(v)

%% Section 3.13, code block 3.16

% vector
v = [ 7, 4, -5, 8, 3 ];

% random weighting vector
w = rand( size(v) );

% weighted dp
wAve = dot(v,w/sum(w));

%% done.
