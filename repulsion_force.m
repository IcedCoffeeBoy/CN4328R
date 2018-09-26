%Return the repulsion force based on the relative position of all particles
function ret = repulsion_force(positions,i)
    particle = positions(i,:);
    positions(i,:) = [];
    relative_positions = positions;
    for i = 1:length(relative_positions)
        relative_positions(i,:) = relative_positions(i,:) - particle;
    end
    dist = sqrt(relative_positions(:,1).^2 + relative_positions(:,2).^2);
    angle = atan2(relative_positions(:,2),relative_positions(:,1));
    force = -10./(dist.^2+0.01);
    xforce = cos(angle).*force;
    yforce = sin(angle).*force;
    
    ret = [sum(xforce) sum(yforce)];
end