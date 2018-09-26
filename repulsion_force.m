%Return the repulsion force based on the relative position of all particles
function ret = repulsion_force(positions,i)
    particle = positions(i,:);
    positions(i,:) = [];
    relative_positions = positions;
    for i = 1:length(relative_positions)
        relative_positions(i,:) = relative_positions(i,:) - particle;
    end
    
end