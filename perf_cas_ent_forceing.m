% close all;
clc;
max_time = 10;

figure;
hold on;
% title(num_sample_paths);

coordinates = zeros([20 max_time 2]);
legendS = [];
for j =1:20
num_sample_paths = j*10
legendS = [legendS, cellstr(num2str(num_sample_paths))];
% coordinates(j,1,1) = j*10;
cur_macrostate = [0 0 0 0];

% coordinates = zeros([max_time 2]);
for i=1:max_time
    cas_ent_force = calc_cas_ent_force(cur_macrostate,num_sample_paths,5);
    cur_macrostate = STEP_MACROSTATE(cur_macrostate, cas_ent_force);
    coordinates(j,i,:) = cur_macrostate(1:2);
%     plot(cur_macrostate(1),cur_macrostate(2),'.');
%     plot([0 0 3 3 0], [0 3 3 0 0]);
%     axis([-1 4 -1 4]);
%     pause(0.01);
end

% figure;
% hold on;
end

plot(1:max_time,coordinates(:,1:max_time,1));
% legendCell = cellstr(num2str(coordinates(:,1,1)', '%-d'))
legend(['A','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B']);
plot([0 max_time+1], [1.5 1.5]);
drawnow;