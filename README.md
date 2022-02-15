# PharoIM
InputMethod support for Pharo on headless VMs

## Install
Evaluate the following in a playground.
```
EpMonitor disableDuring: [
	Metacello new
		onConflictUseLoaded;
		onWarningLog;
		repository: 'github://tomooda/PharoIM:main/';
		baseline: 'PharoIM';
		load ] 
```
