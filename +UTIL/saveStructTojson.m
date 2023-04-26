function saveStructTojson(file, data)
%saveStruct2json 保存结构体到json文件
txt = jsonencode(data);
fid = fopen(file,'w');
fprintf(fid, txt);
fclose(fid);
end

