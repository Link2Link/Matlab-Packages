function ModelParameterNames = getAllNameOfModule(file)
ModelParameterNames = fieldnames(get_param(file,'ObjectParameters'));
% GlobalParameterNames = setdiff(RootParameterNames,ModelParameterNames);