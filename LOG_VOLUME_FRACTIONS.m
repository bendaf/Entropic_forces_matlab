function log_volume_fracs = LOG_VOLUME_FRACTIONS(sample_paths)

sample_paths = round(sample_paths);

starting_steps = reshape(sample_paths(3:4,1,:),2,size(sample_paths,3))';
pos_starting_steps = unique(starting_steps,'rows');

count_steps = zeros([size(pos_starting_steps,1) 2]);

for i=1:size(pos_starting_steps,1)
    indexes = ismember(starting_steps,pos_starting_steps(i,:),'rows');
 
    final_steps = reshape(sample_paths(1:2,size(sample_paths,2),indexes), ...
                                        2,sum(indexes))';
    count_steps(i,1)= sum(indexes);
    count_steps(i,2)= size(unique(final_steps,'rows'),1);
end

log_volume_fracs = ones(size(sample_paths,3),1);
count_steps;

for i=1:size(starting_steps,1)
    index = ismember(pos_starting_steps,starting_steps(i,:),'rows');

%     log_volume_fracs(i)=(1-H_step(count_steps(i,2),count_steps(i,1)))...
%                                                  /count_steps(i,1);
end