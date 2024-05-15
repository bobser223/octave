clc
mod = input('module input: ');


vector = randn(1, 7); %воно генерує якусь шляпу, тому краще друге число також написати 1
norm_vector = vector / norm(vector) * mod;


disp(norm_vector);
