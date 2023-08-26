/*IMPORT DATA*/
proc import datafile="/home/u62868661/Datasets/ANCOVA/Weight loss.xlsx"
dbms=xlsx
out=df
replace;
run;

/*DESCRIPTIVE ANALYSIS*/


/*ANALYSIS OF COVARIANCE*/
proc glm data=df;
	class Group;
	model 'BMI reduction'n=Group 'Baseline BMI'n 'Baseline BMI'n * Group;
	lsmeans Group / adjust=tukey pdiff alpha=.05;
run;