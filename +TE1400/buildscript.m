function buildscript(filename)
current_path = pwd;

abspath = which(filename);
disp(abspath);
[filepath,name,ext] = fileparts(abspath);
cd(filepath);
% open_system(name);
which(name);

slbuild(name);
% close_system(name);
cd(current_path);
end