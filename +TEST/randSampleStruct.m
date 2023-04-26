function st = randSampleStruct(st)
list = fieldnames(st);
for idx = 1: length(list)
    name = list{idx};
    dType = class(st.(name));
    switch dType
        case 'double'
            st.(name) = rand(size(st.(name)));
        case 'int8'
            st.(name) = int8(unidrnd(10,size(st.(name)))-5);
        case 'uint16'
            st.(name) = uint16(unidrnd(10,size(st.(name)))-1);
        case 'logical'
            st.(name) = boolean(unidrnd(2,size(st.(name)))-1);
        otherwise
    end
end
end