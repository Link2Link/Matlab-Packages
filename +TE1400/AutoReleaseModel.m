function AutoReleaseModel(modelName, path, varargin)
% Generate the released module with TcCom
% demo : AutoReleaseModel('SC_kinematic', 'Algorithm_release')

if nargin > 3
    error('Too many input argument');
end

if nargin == 3
    stepsize = varargin{1};
else
    stepsize = '1e-3';
end


% modelName = 'kinematics';
TcName = [modelName , '_TcCOM'];
file = [path, '\' ,TcName];

if exist(file, 'file') > 0
    delete([file, '.slx']);
    disp(['Delete the old model : ', [file, '.slx']]);
end

h = new_system(TcName,'FromFile',modelName);
AutoConfigModel(TcName, false, stepsize);
save_system(h, file);
close_system(h);


h = load_system(modelName);
modelversion = get_param(h, 'ModelVersion');
close_system(h);

Tcmodelversion = sprintf('%d.%d.', [str2num(getenv('LIB_VERSION_MAJOR')),str2num(getenv('LIB_VERSION_MINOR'))]);
Tcmodelversion = [Tcmodelversion, modelversion];
disp([TcName, ' version : ', Tcmodelversion]);

h = load_system(TcName);
set_param(h, 'TcProject_DrvFileVersion', Tcmodelversion);
save_system(h);
close_system(h);

end