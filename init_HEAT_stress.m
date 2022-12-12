% init_HEAT.m
%
% Intialise the HEAT tool box. Sets up directory paths to core climate
% input data and adds any necessary paths.

% Find which machine is being used
root_dir = pwd;

% Running locally on AKA's machine
if length(root_dir) >= 14
        % Set data directories
        UKCP18dir = '/Volumes/DataDrive/UKCP18/';
        ERA5dir = '/Volumes/DataDrive/ERA5/';
        HadUKdir = '/Volumes/DataDrive/HadUK-Grid/v1.0.2.1/';
        Deriveddir = '/Volumes/DataDrive/HEAToutput/DerivedData/';
        Outputdir = '/Volumes/DataDrive/HEAToutput/';
        
        addpath('PhysicalCalculations/')
        addpath('DataHandling/')
        addpath('Processing/')
        addpath('Outputting/')
        addpath('PreProcessedData/')
        addpath('Dependencies/')
        
        
    
    % Otherwise, assume running on DAFNI (in a Docker container)
else
    % Set data directory
    Inputdir = '/data/inputs/';
    Tempdirin = '/data/inputs/Temperature/';
    TempAltdirin = '/data/inputs/Temperature_alt/';
    Humdirin = '/data/inputs/Humidity/';
    Pressuredirin = '/data/inputs/Pressure/';
    Htdirin = '/data/inputs/Height/';
    
    BaseClimatedirin = '/data/inputs/ClimateBase/';
    Climatedirout = '/data/outputs/Climate/';

    % Note: in this case, 'addpath' should have been done before building
    % the Matlab executable and Docker file, by running add_paths.m.
    
end
