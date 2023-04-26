function flag = isStructEqu(st1, st2, eps)
flag = false;

list1 = fieldnames(st1);
list2 = fieldnames(st2);

% 长度相等
if length(list1) ~= length(list2)
    return;
end

% 属性名相等
for idx = 1: length(list1)
    name1 = list1{idx};
    name2 = list2{idx};
    if ~strcmp(name1, name2)
        return;
    end
end

% 属性数据类型一样
for idx = 1: length(list1)
    name1 = list1{idx};
    name2 = list2{idx};
    if ~(strcmp(class(st1.(name1)), class(st2.(name2))))
        return;
    end
end

% 属性值相等
for idx = 1: length(list1)
    name1 = list1{idx};
    name2 = list2{idx};
    if ~(norm(double(st1.(name1) - st2.(name2))) < eps)
        return;
    end
end

flag = true;
