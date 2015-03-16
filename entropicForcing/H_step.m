function H_step = H_step(dif_steps, all_steps)
fraction1 = dif_steps./all_steps;
fraction2 = (all_steps-dif_steps)./all_steps;

if dif_steps == all_steps
    H_step = 1;
else
    H_step = 1 + fraction1.*log2(fraction1) + fraction2.*log2(fraction2);
end

end