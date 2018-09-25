function  Traffic
num_particles= 10;
initial = zeros(1,num_particles*4);
for i = 1:num_particles
    initial((i-1)*4+1) = normrnd(100,50);
    initial((i-1)*4+3) = normrnd(100,50);
end
[t,y] = ode45(@movement,[0 1000],initial)
y
len = length(y);
figure(1)
for i = 1:len
    hold off
    for j = 1:num_particles
        plot(y(i,(j-1)*4+1),y(i,(j-1)*4+3),'o')
        hold on
    end
    axis([0 1e3 0 1e3])
    drawnow
end
end

function ret = movement(t,z)
num_particles = length(z)/4;
ret=zeros(1,length(z));
for i = 1:num_particles
    ret(1+(i-1)*4) = z(2+(i-1)*4);
    ret(2+(i-1)*4) = 1 - 0.1*(z(2+(i-1)*4)^2);
    ret(3+(i-1)*4) = z(4+(i-1)*4);
    ret(4+(i-1)*4) = 1 - 0.1*(z(4+(i-1)*4)^2);
end
ret = ret';
end