%%
%       BOOK: Linear Algebra: Theory, Intuition, Code
%     AUTHOR: Mike X Cohen
%    WEBSITE: sincxpress.com
%
%    CHAPTER: Quadratic form and definiteness (chapter 17)
%
%%

%% Section 17.1, code block 17.2

% create matrix and vector
m = 4;
A = randn(m);
v = randn(1,m);

% the quadratic form
v*A*v'


%% Section 17.9, code block 17.4

A = [1 2; 2 3]; % matrix
vi = -2:.1:2; % vector elements
quadform = zeros(length(vi));

for i=1:length(vi)
    for j=1:length(vi)
        v = [vi(i) vi(j)]'; % vector
        quadform(i,j) = v'*A*v/(v'*v);
    end
end

figure(1), clf
surf(vi,vi,quadform')
xlabel('v_1'), ylabel('v_2')
zlabel('$\zeta$','Interpreter','latex')

%% Section 17.9, code block 17.6

n = 4;
nIterations = 500;
defcat = zeros(nIterations,1);

for iteri=1:nIterations
    
    % create the matrix
    A = randi([-10 10],n);
    ev = eig(A); % ev = EigenValues
    while ~isreal(ev)
        A = randi([-10 10],n);
        ev = eig(A);
    end
    
    % "zero" threshold (from rank)
    t = n * eps(max(svd(A)));
    
    % test definiteness
    if all(sign(ev)==1)
        defcat(iteri) = 1; % pos. def
    elseif all(sign(ev)>-1) && sum(abs(ev)<t)>0
        defcat(iteri) = 2; % pos. semidef
    elseif all(sign(ev)<1) && sum(abs(ev)<t)>0
        defcat(iteri) = 4; % neg. semidef
    elseif all(sign(ev)==-1)
        defcat(iteri) = 5; % neg. def
    else
        defcat(iteri) = 3; % indefinite
    end
end

% print out summary
for i=1:5
    fprintf('cat %g: %g\n',i,sum(defcat==i))
end


%% done.
