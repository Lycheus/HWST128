
b
Command: %s
53*	vivadotcl21
opt_design -directive Explore2default:defaultZ4-113h px? 
d
$Directive used for opt_design is: %s67*	vivadotcl2
Explore2default:defaultZ4-136h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2$
xczu9eg-ffvb11562default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2$
xczu9eg-ffvb11562default:defaultZ17-349h px? 
?
?The version limit for your license is '%s' and will expire in %s days. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
519*common2
2019.012default:default2
-12032default:defaultZ17-1223h px? 
n
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px? 
R

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px? 
t
Command: %s
53*	vivadotcl2C
/report_drc (run_mandatory_drcs) for: opt_checks2default:defaultZ4-113h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
q
%s completed successfully
29*	vivadotcl23
report_drc (run_mandatory_drcs)2default:defaultZ4-42h px? 
U
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px? 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 2125.113 ; gain = 69.031 ; free physical = 10745 ; free virtual = 137302default:defaulth px? 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
8
Deriving generated clocks
2*timingZ38-2h px? 
i

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
12default:default2
62default:defaultZ31-138h px? 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px? 
<
'Phase 1 Retarget | Checksum: 14d6eb641
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:14 ; elapsed = 00:00:09 . Memory (MB): peak = 2650.199 ; gain = 525.086 ; free physical = 10344 ; free virtual = 133322default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2
Retarget2default:default2
02default:default2
13732default:defaultZ31-389h px? 
u

Phase %s%s
101*constraints2
2 2default:default2(
Constant propagation2default:defaultZ18-101h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
G
2Phase 2 Constant propagation | Checksum: e795e413
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:16 ; elapsed = 00:00:11 . Memory (MB): peak = 2650.199 ; gain = 525.086 ; free physical = 10328 ; free virtual = 133162default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2(
Constant propagation2default:default2
32default:default2
152default:defaultZ31-389h px? 
f

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101h px? 
9
$Phase 3 Sweep | Checksum: 172b71f55
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:17 ; elapsed = 00:00:12 . Memory (MB): peak = 2650.199 ; gain = 525.086 ; free physical = 10322 ; free virtual = 133112default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2default:default2
02default:default2
922default:defaultZ31-389h px? 
r

Phase %s%s
101*constraints2
4 2default:default2%
BUFG optimization2default:defaultZ18-101h px? 
E
0Phase 4 BUFG optimization | Checksum: 172b71f55
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:18 ; elapsed = 00:00:13 . Memory (MB): peak = 2650.199 ; gain = 525.086 ; free physical = 10324 ; free virtual = 133122default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2%
BUFG optimization2default:default2
02default:default2
02default:defaultZ31-389h px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Shift Register Optimization2default:defaultZ18-101h px? 
O
:Phase 5 Shift Register Optimization | Checksum: 172b71f55
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:18 ; elapsed = 00:00:13 . Memory (MB): peak = 2650.199 ; gain = 525.086 ; free physical = 10324 ; free virtual = 133122default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2/
Shift Register Optimization2default:default2
02default:default2
02default:defaultZ31-389h px? 
a

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.12 ; elapsed = 00:00:00.11 . Memory (MB): peak = 2650.199 ; gain = 0.000 ; free physical = 10324 ; free virtual = 133122default:defaulth px? 
J
5Ending Logic Optimization Task | Checksum: 172b71f55
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:18 ; elapsed = 00:00:13 . Memory (MB): peak = 2650.199 ; gain = 525.086 ; free physical = 10324 ; free virtual = 133122default:defaulth px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
282default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px? 
\
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2 
opt_design: 2default:default2
00:00:222default:default2
00:00:152default:default2
2650.1992default:default2
602.1172default:default2
103242default:default2
133122default:defaultZ17-722h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:00.092default:default2
00:00:00.032default:default2
2674.2112default:default2
0.0002default:default2
103202default:default2
133132default:defaultZ17-722h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?/home/lycheus/rc-fpga-zcu/zcu102/zcu102_rocketchip_ZynqConfig/zcu102_rocketchip_ZynqConfig.runs/impl_1/rocketchip_wrapper_opt.dcp2default:defaultZ17-1381h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2&
write_checkpoint: 2default:default2
00:00:092default:default2
00:00:062default:default2
2674.2112default:default2
24.0122default:default2
103132default:default2
133092default:defaultZ17-722h px? 
v
Command: %s
53*	vivadotcl2E
1report_drc -file rocketchip_wrapper_drc_opted.rpt2default:defaultZ4-113h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
?/home/lycheus/rc-fpga-zcu/zcu102/zcu102_rocketchip_ZynqConfig/zcu102_rocketchip_ZynqConfig.runs/impl_1/rocketchip_wrapper_drc_opted.rpt?/home/lycheus/rc-fpga-zcu/zcu102/zcu102_rocketchip_ZynqConfig/zcu102_rocketchip_ZynqConfig.runs/impl_1/rocketchip_wrapper_drc_opted.rpt2default:default8Z2-168h px? 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px? 


End Record