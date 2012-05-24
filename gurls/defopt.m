function opt = defopt(expname)

if (nargin < 1)
	fprintf('Your experiment must be given a unique name\n');
end

%% Experiment options
opt.name = expname; % We can make this argument mandatory; Unique name per experiment
opt.combineclasses = @mean; % How to combine performance measure per class (mean/median/min/max?)
opt.plotstr = opt.name; % by default plot string is expname, you can change it if you want.
opt.savefile = [opt.name '.mat'];

%% Algorithm options
opt.kernel.type = 'rbf';
opt.singlelambda = @median; % give the function for combining your lambdas; could be max, min or mean, for instance.
opt.predbagmethod = 'vote';
opt.smallnumber = 1e-8; % lambda is searched between [min(eig_r, opt.smallnumber), eig_1], where r = rank, eig_1 = max eig val.
opt.hoMOnline = false;

%% GD Options

opt.gd.method = 0; % standard gradient descent
opt.gd.maxiter = 1000;
opt.gd.singleiter = @median;
opt.gd.eta_numerator = 1;
opt.gd.nu = 1;

%% Directory options
opt.tmpdir = opt.name;

%% Output options
opt.savekernel = 1;
opt.saveanalysis = 1;
opt.hoperf = @perf_macroavg;
opt.ploteval = 'acc';
opt.perfeval = {'acc'};

opt.nholdouts = 1;
%% Data option
opt.hoproportion = 0.2;
opt.nlambda = 100;
opt.nsigma =  25;



%% Quiet
% Currenty either 0 or 1; levels of verbosity may be implemented later;
opt.verbose = 1;

%% Version info
opt.version = 0.1;

opt.smp_nestimates = 2;
opt.smp_subsize = 50;
opt.epochs = 4;

opt.subsize = 50;
opt.calibfile = 'pippo';


%% Laplacian related stuff

opt.labelledproportion = 0.4;
opt.maxIter = 1000;
