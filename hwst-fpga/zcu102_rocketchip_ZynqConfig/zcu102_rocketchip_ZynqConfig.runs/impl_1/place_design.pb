
?
?No debug cores found in the current design.
Before running the implement_debug_core command, either use the Set Up Debug wizard (GUI mode)
or use the create_debug_core and connect_debug_core Tcl commands to insert debug cores into the design.
154*	chipscopeZ16-241h px? 
d
Command: %s
53*	vivadotcl23
place_design -directive Explore2default:defaultZ4-113h px? 
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
y
Command: %s
53*	vivadotcl2H
4report_drc (run_mandatory_drcs) for: incr_eco_checks2default:defaultZ4-113h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
q
%s completed successfully
29*	vivadotcl23
report_drc (run_mandatory_drcs)2default:defaultZ4-42h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px? 
w
Command: %s
53*	vivadotcl2F
2report_drc (run_mandatory_drcs) for: placer_checks2default:defaultZ4-113h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
q
%s completed successfully
29*	vivadotcl23
report_drc (run_mandatory_drcs)2default:defaultZ4-42h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px? 
n
/The placer was invoked with the '%s' directive.14*	placeflow2
Explore2default:defaultZ46-5h px? 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
82default:defaultZ30-611h px? 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.052default:default2
00:00:00.062default:default2
2714.2302default:default2
0.0002default:default2
102922default:default2
132912default:defaultZ17-722h px? 
Z
EPhase 1.1 Placer Initialization Netlist Sorting | Checksum: f8bc1bc8
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.09 ; elapsed = 00:00:00.14 . Memory (MB): peak = 2714.230 ; gain = 0.000 ; free physical = 10292 ; free virtual = 132912default:defaulth px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.052default:default2
00:00:00.052default:default2
2714.2302default:default2
0.0002default:default2
102952default:default2
132942default:defaultZ17-722h px? 
?

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
g
RPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 5c35e275
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:52 ; elapsed = 00:00:50 . Memory (MB): peak = 3749.488 ; gain = 1035.258 ; free physical = 9035 ; free virtual = 123732default:defaulth px? 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px? 
O
:Phase 1.3 Build Placer Netlist Model | Checksum: f7ce489f
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:05 ; elapsed = 00:00:57 . Memory (MB): peak = 3820.234 ; gain = 1106.004 ; free physical = 8882 ; free virtual = 122222default:defaulth px? 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px? 
L
7Phase 1.4 Constrain Clocks/Macros | Checksum: f7ce489f
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:05 ; elapsed = 00:00:57 . Memory (MB): peak = 3820.234 ; gain = 1106.004 ; free physical = 8883 ; free virtual = 122232default:defaulth px? 
H
3Phase 1 Placer Initialization | Checksum: f7ce489f
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:06 ; elapsed = 00:00:58 . Memory (MB): peak = 3820.234 ; gain = 1106.004 ; free physical = 8883 ; free virtual = 122232default:defaulth px? 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px? 
C
.Phase 2 Global Placement | Checksum: f451b236
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:02:45 ; elapsed = 00:01:51 . Memory (MB): peak = 3960.402 ; gain = 1246.172 ; free physical = 8765 ; free virtual = 121072default:defaulth px? 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px? 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px? 
O
:Phase 3.1 Commit Multi Column Macros | Checksum: f451b236
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:02:46 ; elapsed = 00:01:52 . Memory (MB): peak = 3960.402 ; gain = 1246.172 ; free physical = 8765 ; free virtual = 121072default:defaulth px? 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px? 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 11c73846f
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:02:52 ; elapsed = 00:01:55 . Memory (MB): peak = 3960.402 ; gain = 1246.172 ; free physical = 8756 ; free virtual = 120972default:defaulth px? 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px? 
L
7Phase 3.3 Area Swap Optimization | Checksum: 159bb4d8f
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:02:53 ; elapsed = 00:01:56 . Memory (MB): peak = 3960.402 ; gain = 1246.172 ; free physical = 8754 ; free virtual = 120962default:defaulth px? 
?

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
S
>Phase 3.4 Pipeline Register Optimization | Checksum: d3736b92
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:02:53 ; elapsed = 00:01:56 . Memory (MB): peak = 3960.402 ; gain = 1246.172 ; free physical = 8754 ; free virtual = 120962default:defaulth px? 
s

Phase %s%s
101*constraints2
3.5 2default:default2$
IO Cut Optimizer2default:defaultZ18-101h px? 
F
1Phase 3.5 IO Cut Optimizer | Checksum: 184ab7435
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:02:55 ; elapsed = 00:01:57 . Memory (MB): peak = 3960.402 ; gain = 1246.172 ; free physical = 8752 ; free virtual = 120942default:defaulth px? 
x

Phase %s%s
101*constraints2
3.6 2default:default2)
Timing Path Optimizer2default:defaultZ18-101h px? 
K
6Phase 3.6 Timing Path Optimizer | Checksum: 184ab7435
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:02:55 ; elapsed = 00:01:57 . Memory (MB): peak = 3960.402 ; gain = 1246.172 ; free physical = 8752 ; free virtual = 120942default:defaulth px? 
t

Phase %s%s
101*constraints2
3.7 2default:default2%
Fast Optimization2default:defaultZ18-101h px? 
G
2Phase 3.7 Fast Optimization | Checksum: 18ca9afe8
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:02:58 ; elapsed = 00:02:00 . Memory (MB): peak = 3960.402 ; gain = 1246.172 ; free physical = 8751 ; free virtual = 120932default:defaulth px? 
y

Phase %s%s
101*constraints2
3.8 2default:default2*
Small Shape Clustering2default:defaultZ18-101h px? 
L
7Phase 3.8 Small Shape Clustering | Checksum: 16953ae51
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:03:06 ; elapsed = 00:02:08 . Memory (MB): peak = 3960.402 ; gain = 1246.172 ; free physical = 8692 ; free virtual = 120342default:defaulth px? 
r

Phase %s%s
101*constraints2
3.9 2default:default2#
DP Optimization2default:defaultZ18-101h px? 
E
0Phase 3.9 DP Optimization | Checksum: 198c77cca
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:03:20 ; elapsed = 00:02:14 . Memory (MB): peak = 3993.996 ; gain = 1279.766 ; free physical = 8687 ; free virtual = 120302default:defaulth px? 
?

Phase %s%s
101*constraints2
3.10 2default:default20
Flow Legalize Slice Clusters2default:defaultZ18-101h px? 
R
=Phase 3.10 Flow Legalize Slice Clusters | Checksum: f9dd8936
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:03:20 ; elapsed = 00:02:15 . Memory (MB): peak = 3993.996 ; gain = 1279.766 ; free physical = 8688 ; free virtual = 120302default:defaulth px? 
s

Phase %s%s
101*constraints2
3.11 2default:default2#
Slice Area Swap2default:defaultZ18-101h px? 
F
1Phase 3.11 Slice Area Swap | Checksum: 1993aa081
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:03:30 ; elapsed = 00:02:26 . Memory (MB): peak = 3993.996 ; gain = 1279.766 ; free physical = 8652 ; free virtual = 119942default:defaulth px? 
y

Phase %s%s
101*constraints2
3.12 2default:default2)
Commit Slice Clusters2default:defaultZ18-101h px? 
L
7Phase 3.12 Commit Slice Clusters | Checksum: 15ddf99cb
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:03:43 ; elapsed = 00:02:30 . Memory (MB): peak = 3993.996 ; gain = 1279.766 ; free physical = 8650 ; free virtual = 119932default:defaulth px? 
v

Phase %s%s
101*constraints2
3.13 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px? 
I
4Phase 3.13 Re-assign LUT pins | Checksum: 1cc9a2593
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:03:45 ; elapsed = 00:02:33 . Memory (MB): peak = 3993.996 ; gain = 1279.766 ; free physical = 8653 ; free virtual = 119962default:defaulth px? 
?

Phase %s%s
101*constraints2
3.14 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.14 Pipeline Register Optimization | Checksum: 77d1549c
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:03:46 ; elapsed = 00:02:33 . Memory (MB): peak = 3993.996 ; gain = 1279.766 ; free physical = 8670 ; free virtual = 120122default:defaulth px? 
u

Phase %s%s
101*constraints2
3.15 2default:default2%
Fast Optimization2default:defaultZ18-101h px? 
G
2Phase 3.15 Fast Optimization | Checksum: a130b680
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:03:58 ; elapsed = 00:02:39 . Memory (MB): peak = 3993.996 ; gain = 1279.766 ; free physical = 8677 ; free virtual = 120202default:defaulth px? 
C
.Phase 3 Detail Placement | Checksum: a130b680
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:03:58 ; elapsed = 00:02:40 . Memory (MB): peak = 3993.996 ; gain = 1279.766 ; free physical = 8677 ; free virtual = 120202default:defaulth px? 
?

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px? 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?

Phase %s%s
101*constraints2
4.1.1 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px? 
V
APost Placement Optimization Initialization | Checksum: 15bea2496
*commonh px? 
u

Phase %s%s
101*constraints2
4.1.1.1 2default:default2"
BUFG Insertion2default:defaultZ18-101h px? 
?
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
82default:defaultZ32-721h px? 
?
2Processed net %s, inserted BUFG to drive %s loads.35*	placeflow22
top/adapter/core/_T_1205_0_reg2default:default2
12132default:defaultZ46-40h px? 
?
?BUFG insertion identified %s candidate nets, %s success, %s skipped for placement/routing, %s skipped for timing, %s skipped for netlist change reason.36*	placeflow2
12default:default2
12default:default2
02default:default2
02default:default2
02default:defaultZ46-41h px? 
H
3Phase 4.1.1.1 BUFG Insertion | Checksum: 1c2e487fe
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:04:22 ; elapsed = 00:02:47 . Memory (MB): peak = 4020.590 ; gain = 1306.359 ; free physical = 8701 ; free virtual = 120442default:defaulth px? 
?
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
0.1532default:defaultZ30-746h px? 
S
>Phase 4.1.1 Post Placement Optimization | Checksum: 157eec584
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:05:04 ; elapsed = 00:03:24 . Memory (MB): peak = 4020.590 ; gain = 1306.359 ; free physical = 8701 ; free virtual = 120442default:defaulth px? 
N
9Phase 4.1 Post Commit Optimization | Checksum: 157eec584
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:05:04 ; elapsed = 00:03:24 . Memory (MB): peak = 4020.590 ; gain = 1306.359 ; free physical = 8701 ; free virtual = 120442default:defaulth px? 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px? 
L
7Phase 4.2 Post Placement Cleanup | Checksum: 157eec584
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:05:05 ; elapsed = 00:03:25 . Memory (MB): peak = 4020.590 ; gain = 1306.359 ; free physical = 8714 ; free virtual = 120572default:defaulth px? 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px? 
F
1Phase 4.3 Placer Reporting | Checksum: 2550fd38e
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:05:05 ; elapsed = 00:03:26 . Memory (MB): peak = 4045.879 ; gain = 1331.648 ; free physical = 8715 ; free virtual = 120582default:defaulth px? 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px? 
M
8Phase 4.4 Final Placement Cleanup | Checksum: 220224194
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:05:06 ; elapsed = 00:03:26 . Memory (MB): peak = 4045.879 ; gain = 1331.648 ; free physical = 8715 ; free virtual = 120582default:defaulth px? 
\
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 220224194
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:05:06 ; elapsed = 00:03:26 . Memory (MB): peak = 4045.879 ; gain = 1331.648 ; free physical = 8715 ; free virtual = 120582default:defaulth px? 
>
)Ending Placer Task | Checksum: 176794d39
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:05:06 ; elapsed = 00:03:26 . Memory (MB): peak = 4045.879 ; gain = 1331.648 ; free physical = 8842 ; free virtual = 121852default:defaulth px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
502default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
place_design: 2default:default2
00:05:142default:default2
00:03:292default:default2
4045.8792default:default2
1331.6482default:default2
88422default:default2
121852default:defaultZ17-722h px? 
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
00:00:072default:default2
00:00:022default:default2
4045.8792default:default2
0.0002default:default2
87622default:default2
121672default:defaultZ17-722h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?/home/lycheus/rc-fpga-zcu/zcu102/zcu102_rocketchip_ZynqConfig/zcu102_rocketchip_ZynqConfig.runs/impl_1/rocketchip_wrapper_placed.dcp2default:defaultZ17-1381h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2&
write_checkpoint: 2default:default2
00:00:112default:default2
00:00:062default:default2
4045.8792default:default2
0.0002default:default2
88212default:default2
121792default:defaultZ17-722h px? 
?
?report_io: Time (s): cpu = 00:00:00.18 ; elapsed = 00:00:00.25 . Memory (MB): peak = 4045.879 ; gain = 0.000 ; free physical = 8798 ; free virtual = 12156
*commonh px? 
?
?report_utilization: Time (s): cpu = 00:00:00.37 ; elapsed = 00:00:00.46 . Memory (MB): peak = 4045.879 ; gain = 0.000 ; free physical = 8820 ; free virtual = 12179
*commonh px? 
?
?report_control_sets: Time (s): cpu = 00:00:00.12 ; elapsed = 00:00:00.22 . Memory (MB): peak = 4045.879 ; gain = 0.000 ; free physical = 8819 ; free virtual = 12178
*commonh px? 


End Record