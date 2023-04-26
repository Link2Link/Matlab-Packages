function data = loadStructFromjson(file)
%loadStructFromjson Load parameters from json

text = fileread(file);
data = jsondecode(text);

end

