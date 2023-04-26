function AutoConfigModel(modelName, open, varargin)

if nargin > 3
    error('Too many input argument');
end

if nargin == 3
    stepsize = varargin{1};
else
    stepsize = '1e-3';
end


if open
    open_system(modelName);
end

% TwinCAT.ModuleGenerator.Simulink.ModelExportConfig.ShowModelParam(modelName,'SolverType','Fixed-step');

set_param(modelName, 'SolverType', 'Fixed-step');
set_param(modelName, 'Solver', 'ode4');
set_param(modelName, 'FixedStep', stepsize);
set_param(modelName, 'StopTime', 'Inf');
set_param(modelName, 'SystemTargetFile', 'TwinCatGrt.tlc');
set_param(modelName, 'CodeInterfacePackaging', 'C++ class');

set_param(modelName, 'TcProject_TmxArchive', 'C:\Release\[LibName]_[LibVersion].exe');
set_param(modelName, 'TcProject_SignTwinCatCertName', 'VicenteMedical');
set_param(modelName, 'TcProject_PublishTcRTx86', 'off');

set_param(modelName, 'TcCom_StepSizeAdaptation', 'RequireMatchingTaskCycleTime');
set_param(modelName, 'TcCom_ParametersDataAccess', 'Input Destination DataArea');
set_param(modelName, 'TcCom_ParametersCreateSymbols', 'on');

end