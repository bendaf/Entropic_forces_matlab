function log_volume_fracs = LOG_VOLUME_FRACTIONS(sample_paths)

% round the path to examine similarity
sample_paths = round(sample_paths);

% calculate the possible starting steps
starting_steps = reshape(sample_paths(3:4,1,:),2,size(sample_paths,3))';
pos_starting_steps = unique(starting_steps,'rows');

% calculate the reachable positions for each starting step
count_steps = zeros([size(pos_starting_steps,1) 2]);
for i=1:size(pos_starting_steps,1)
    indexes = ismember(starting_steps,pos_starting_steps(i,:),'rows');
 
    final_steps = reshape(sample_paths(1:2,size(sample_paths,2),indexes), ...
                                        2,sum(indexes))';
    count_steps(i,1)= sum(indexes);
    count_steps(i,2)= size(unique(final_steps,'rows'),1);
end
% count_steps

% calculate the log_volume_frac for each path.
log_volume_fracs = zeros(size(sample_paths,3),1);
for i=1:size(starting_steps,1)
    index = ismember(pos_starting_steps,starting_steps(i,:),'rows');
    
    log_volume_fracs(i) = ( ...
                H_step(count_steps(index,2),count_steps(index,1)));...
%                                               / count_steps(index,1);
%     pl = [starting_steps(i,:) log_volume_fracs(i)]
end
s = sum(log_volume_fracs);