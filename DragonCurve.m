nFolds= 25;       % Number of folds

Directions= zeros(1,2^nFolds);  % Represents the direction vectors between 
                                % each corner point on the dragon curve
Points= Directions;             
Directions(1)= 1i;        % Using the complex plane to simplify rotations

for n=1:nFolds  % At every iteration, the direction vectors until the last 
                % point are rotated by 90 degrees in reverse order.
                % The rotation is done by multiplying with 1i.
    for k=2^(n-1) + 1:2^n
        l= k-2^(n-1);
        Directions(k) = Directions(2^(n-1) - l+1) * 1i;
    end
end
% Drct=Drct*1i;   % Rotate the whole curve for sleeping dragon

for i=2:length(Directions)
    Points(i) = Points(i-1) + Directions(i-1);
end

% If you want to plot just a specific region;
% [v]=(Points==21-21*1i);
% [v1 n1]=max(v);
% [v]=(Points==43);
% [v2 n2]=max(v);
% plot(Points(n1:n2),'linewidth',2);

hf = figure;
set(hf,'WindowState','maximized');
plot(Points,'linewidth',2)        
ha = gca;
set(ha,'DataAspectRatio',[1,1,1],'XTick', [], 'YTick',[])
xlabel(['Dragon curve with ', num2str(nFolds), ' folds.'],'Interpreter', 'latex','FontSize',16)


