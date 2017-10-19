x1 = [3,3]';
x2 = [4,3]';
x3 = [1,1]';

x = [x1, x2, x3];

y = [1, 1, -1];

%x(:,1)

i = 1;
sum = 0;
f = 0;

n = [0,0,0];
alpha = [0,0,0];
b = 0;
eta = 1;


Gram = [x1'*x1, x1'*x2, x1'*x3;
        x2'*x1, x2'*x2, x2'*x3;
        x3'*x1, x3'*x2, x3'*x3];

while(i <= 3)
        for j = 1:3
            sum = sum + alpha(j)*y(j)*Gram(i,j);
        end
            f = y(i)*(sum + b);
        if f<=0
            n(i) = n(i) + 1;
            alpha(i) = alpha(i) + eta;
            b = b + eta * y(i);
            i = 1;
            %sum = 0;
        else
            i = i + 1;
            %sum = 0;
        end
        sum = 0;
end


w = alpha(1)*x(:,1) + alpha(2)*x(:,2) - alpha(3)*x(:,3);


plot(x(1,1), x(2,1), 'o')
hold on

plot(x(1,2), x(2,2), 'o')
hold on

plot(x(1,3), x(2,3), '*')
hold on

fplot(@(x) -(w(1)*x+b)/w(2),[0,5])
