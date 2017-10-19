x1 = [3,3]';
x2 = [4,3]';
x3 = [1,1]';

x = [x1, x2, x3];

y = [1, 1, -1];

w = [0, 0]';
b = 0;

i = 1;

while(i<=3)
    f = y(i)*(w'*x(:,i)+b);
    if f > 0
        i = i+1;
    else
        w = w + y(i)*x(:,i);
        b = b + y(i);
        i
        i = 1;
    end
end

plot(x(1,1), x(2,1), 'o')
hold on

plot(x(1,2), x(2,2), 'o')
hold on

plot(x(1,3), x(2,3), '*')
hold on

fplot(@(x) -(w(1)*x+b)/w(2),[0,5])
