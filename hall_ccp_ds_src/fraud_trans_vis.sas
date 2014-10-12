*------------------------------------------------------------*;
* EM Version: 13.2;
* SAS Release: 9.04.01M2P062414;
* Host: LINCOLN;
* Project Path: D:\All_Users\pathal\EMProj;
* Project Name: ccp;
* Diagram Id: EMWS3;
* Diagram Name: assoc/rules;
* Generated by: pathal;
* Date: 26JUN2014:01:50:48;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Macro Variables;
*------------------------------------------------------------*;
%let EM_PROJECT =;
%let EM_PROJECTNAME =;
%let EM_WSNAME =;
%let EM_WSDESCRIPTION =assoc/rules;
%let EM_SUMMARY =WORK.SUMMARY;
%let EM_NUMTASKS =SINGLE;
%let EM_EDITMODE =R;
%let EM_DEBUGVAL =;
%let EM_ACTION =run;
*------------------------------------------------------------*;
%macro em_usedatatable;
%if ^%symexist(EM_USEDATATABLE) %then %do;
%let EM_USEDATATABLE = Y;
%end;
%if "&EM_USEDATATABLE" ne "N" %then %do;
%global Ids2_data Ids2_newdata;
*------------------------------------------------------------*;
* Data Tables;
*------------------------------------------------------------*;
%let Ids2_data = CCP.FRAUDULENT_TRANSACTION;
%let Ids2_newdata =;
*------------------------------------------------------------*;
%end;
%global Ids2_source;
%if "&Ids2_newdata" ne "" %then %do;
%let Ids2_source = USERTABLE;
%end;
%else %do;
%let Ids2_source = DATASOURCE;
%end;
%mend em_usedatatable;
%em_usedatatable;
*------------------------------------------------------------*;
* Create workspace data set;
*------------------------------------------------------------*;
data workspace;
length property $64 value $200;
property= 'PROJECTLOCATION';
value= "&EM_PROJECT";
output;
property= 'PROJECTNAME';
value= "&EM_PROJECTNAME";
output;
property= 'WORKSPACENAME';
value= "&EM_WSNAME";
output;
property= 'WORKSPACEDESCRIPTION';
value= "&EM_WSDESCRIPTION";
output;
property= 'SUMMARYDATASET';
value= "&EM_SUMMARY";
output;
property= 'NUMTASKS';
value= "&EM_NUMTASKS";
output;
property= 'EDITMODE';
value= "&EM_EDITMODE";
output;
property= 'DEBUG';
value= "&EM_DEBUGVAL";
output;
run;
*------------------------------------------------------------*;
* Create nodes data set;
*------------------------------------------------------------*;
data nodes;
length id $12 component $32 description $64 X 8 Y 8 diagramID $32 parentID $32;
id= "Ids2";
component="DataSource";
description= "FRAUDULENT_TRANSACTION";
diagramID="_ROOT_";
parentID="";
X=104;
Y=196;
output;
id= "Assoc2";
component="Association";
description= "Association";
diagramID="_ROOT_";
parentID="";
X=292;
Y=196;
output;
run;
*------------------------------------------------------------*;
* DataSource Properties;
*------------------------------------------------------------*;
data WORK.fraudulenttransaction_P;
  length   Property                         $ 32
           Value                            $ 200
           ;

Property="Name";
Value="FRAUDULENT_TRANSACTION";
output;
Property="CreateDate";
Value="1718984654.5";
output;
Property="ModifyDate";
Value="1718984654.5";
output;
Property="CreatedBy";
Value="pathal";
output;
Property="ModifiedBy";
Value="pathal";
output;
Property="SampleSizeType";
Value="";
output;
Property="SampleSize";
Value="";
output;
;
run;
*------------------------------------------------------------*;
* Variable Attributes for Ids2;
*------------------------------------------------------------*;
data WORK.Ids2_VariableAttribute;
length Variable $64 AttributeName $32 AttributeValue $64;
Variable='date';
AttributeName="ROLE";
AttributeValue='REJECTED';
Output;
Variable='procedure_code';
AttributeName="ROLE";
AttributeValue='TARGET';
Output;
run;
*------------------------------------------------------------*;
* EMNOTES File for Ids2;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Ids2_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* RULESFILTER Data Set for Assoc2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* EMNOTES File for Assoc2;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Assoc2_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Create node properties data set;
*------------------------------------------------------------*;
data nodeprops;
length id $12 property $64 value $400;
id= "Ids2";
property="DataSource";
value= "fraudulenttransaction";
output;
id= "Ids2";
property="Scope";
value= "LOCAL";
output;
id= "Ids2";
property="Role";
value= "TRANSACTION";
output;
%let Ids2_lib = %scan(&Ids2_data, 1, .);
id= "Ids2";
property="Library";
value= "&Ids2_lib";
output;
%let Ids2_member = %scan(&Ids2_data, 2, .);
id= "Ids2";
property="Table";
value= "&Ids2_member";
output;
id= "Ids2";
property="NCols";
value= "3";
output;
id= "Ids2";
property="NObs";
value= "150228";
output;
id= "Ids2";
property="NBytes";
value= "3671040";
output;
id= "Ids2";
property="Segment";
value= "";
output;
id= "Ids2";
property="DataSourceRole";
value= "TRANSACTION";
output;
id= "Ids2";
property="OutputType";
value= "VIEW";
output;
id= "Ids2";
property="ForceRun";
value= "N";
output;
id= "Ids2";
property="ComputeStatistics";
value= "N";
output;
id= "Ids2";
property="DataSelection";
value= "&Ids2_source";
output;
id= "Ids2";
property="NewTable";
value= "&Ids2_newdata";
output;
id= "Ids2";
property="MetaAdvisor";
value= "BASIC";
output;
id= "Ids2";
property="ApplyIntervalLevelLowerLimit";
value= "Y";
output;
id= "Ids2";
property="IntervalLowerLimit";
value= "20";
output;
id= "Ids2";
property="ApplyMaxPercentMissing";
value= "Y";
output;
id= "Ids2";
property="MaxPercentMissing";
value= "50";
output;
id= "Ids2";
property="ApplyMaxClassLevels";
value= "Y";
output;
id= "Ids2";
property="MaxClassLevels";
value= "20";
output;
id= "Ids2";
property="IdentifyEmptyColumns";
value= "Y";
output;
id= "Ids2";
property="VariableValidation";
value= "STRICT";
output;
id= "Ids2";
property="NewVariableRole";
value= "REJECT";
output;
id= "Ids2";
property="DropMapVariables";
value= "Y";
output;
id= "Ids2";
property="DsId";
value= "fraudulenttransaction";
output;
id= "Ids2";
property="DsSampleName";
value= "";
output;
id= "Ids2";
property="DsSampleSizeType";
value= "";
output;
id= "Ids2";
property="DsSampleSize";
value= "";
output;
id= "Ids2";
property="DsCreatedBy";
value= "pathal";
output;
id= "Ids2";
property="DsCreateDate";
value= "1718984654.5";
output;
id= "Ids2";
property="DsModifiedBy";
value= "pathal";
output;
id= "Ids2";
property="DsModifyDate";
value= "1718984654.5";
output;
id= "Ids2";
property="DsScope";
value= "LOCAL";
output;
id= "Ids2";
property="Sample";
value= "D";
output;
id= "Ids2";
property="SampleSizeType";
value= "PERCENT";
output;
id= "Ids2";
property="SampleSizePercent";
value= "20";
output;
id= "Ids2";
property="SampleSizeObs";
value= "10000";
output;
id= "Ids2";
property="DBPassThrough";
value= "Y";
output;
id= "Ids2";
property="RunAction";
value= "Train";
output;
id= "Ids2";
property="Component";
value= "DataSource";
output;
id= "Ids2";
property="Description";
value= "";
output;
id= "Ids2";
property="EM_VARIABLEATTRIBUTES";
value= "WORK.Ids2_VariableAttribute";
output;
id= "Ids2";
property="EM_FILE_EMNOTES";
value= "Ids2_EMNOTES.txt";
output;
id= "Assoc2";
property="ItemCount";
value= "3";
output;
id= "Assoc2";
property="AssocSupportType";
value= "COUNT";
output;
id= "Assoc2";
property="SeqSupportType";
value= "PERCENT";
output;
id= "Assoc2";
property="SupportA";
value= "5";
output;
id= "Assoc2";
property="MinConf";
value= "1";
output;
id= "Assoc2";
property="PctsupA";
value= "5";
output;
id= "Assoc2";
property="PctsupS";
value= "2";
output;
id= "Assoc2";
property="SupportS";
value= ".";
output;
id= "Assoc2";
property="ChainCount";
value= "3";
output;
id= "Assoc2";
property="ConsolTime";
value= "0";
output;
id= "Assoc2";
property="MaxDur";
value= ".";
output;
id= "Assoc2";
property="Criterion";
value= "DEFAULT";
output;
id= "Assoc2";
property="NumRules";
value= "500";
output;
id= "Assoc2";
property="NumTransposeRules";
value= "200";
output;
id= "Assoc2";
property="MaxItems";
value= "100000";
output;
id= "Assoc2";
property="ExportIdRule";
value= "N";
output;
id= "Assoc2";
property="Recommendation";
value= "N";
output;
id= "Assoc2";
property="ForceRun";
value= "N";
output;
id= "Assoc2";
property="RunAction";
value= "Train";
output;
id= "Assoc2";
property="Component";
value= "Association";
output;
id= "Assoc2";
property="EM_FILE_EMNOTES";
value= "Assoc2_EMNOTES.txt";
output;
run;
*------------------------------------------------------------*;
* Create connections data set;
*------------------------------------------------------------*;
data connect;
length from to $12;
from="Ids2";
to="Assoc2";
output;
run;
*------------------------------------------------------------*;
* Create actions to run data set;
*------------------------------------------------------------*;
%macro emaction;
%let actionstring = %upcase(&EM_ACTION);
%if %index(&actionstring, RUN) or %index(&actionstring, REPORT) %then %do;
data actions;
length id $12 action $40;
id="Assoc2";
%if %index(&actionstring, RUN) %then %do;
action='run';
output;
%end;
%if %index(&actionstring, REPORT) %then %do;
action='report';
output;
%end;
run;
%end;
%mend;
%emaction;
*------------------------------------------------------------*;
* Execute the actions;
*------------------------------------------------------------*;
%em5batch(execute, workspace=workspace, nodes=nodes, connect=connect, datasources=datasources, nodeprops=nodeprops, action=actions);
