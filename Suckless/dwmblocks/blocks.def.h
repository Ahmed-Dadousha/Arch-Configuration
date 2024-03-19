//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"VOL:", "amixer get Master | grep -q '\\[off\\]' && echo 'NON' || amixer get Master | awk -F'[][]' 'END{ print $2 }' ", 1, 10},
	{"RAM:", "memory.sh",							  1, 0},
	{"DATE:","date '+%a %d %b | Time: %I:%M:%S %p'" , 									  1, 0},
	{"LANG:", "setxkbmap -query | awk '/layout/{print ($2==\"us\")?\"eng\":$2}'", 						  1, 10},
	{"BATT:", "battery.sh",                                                                                                   1, 0}
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
