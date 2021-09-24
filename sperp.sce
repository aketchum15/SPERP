#
# gray background /
# font size vars /
# yes no on prompt screen after var time /
# choice between bgray and white bg /
# break screen between blocks /
# fixation cross sometimes flashes ???


################################## HEADER ################################## - never modify these
scenario = "sperp";
active_buttons = 3;
button_codes = 1, 2, 3;
response_matching = simple_matching;
response_logging = log_active;
default_clear_active_stimuli = true;
pcl_file = "sperp.pcl";

$ports_enabled = 1; #should be set to 1 when in the lab, 0 for development
IF '$ports_enabled == 1';
	 write_codes = true;
	 pulse_width = 5; #necessary if output port is parallel
ENDIF;

###########################################################################
############################## VARIABLES ##################################
###########################################################################

$stim_font_size = 96;
$probe_font_size = 60;

#background color 0-255, 255 for white, 0 for black
$bg_color = 150;
#font color 0-255
$font_color = 0;

$prime_duration = 1000;
$target_duration = 1000;
$baseline_duration = 1000;
$filler_duration = 1000;

$baseline_probe_duration = 1000;
$filler_probe_duration = 1000;

#Prompt sleep will always come after sleep, therefore the time desired between final target and prompt should be sleep_duration + prompt_sleep_duration
$sleep_duration = 200;
$prompt_sleep_duration = 800;

$fixation_duration = 1000;

$yes_no_time = 500;


begin;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $stim_font_size;
} prime_text;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $stim_font_size;
} target_text;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $stim_font_size;
} baseline_text;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $stim_font_size;
} filler_text;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $probe_font_size;
} experimental_prompt;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $probe_font_size;
} baseline_prompt;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $probe_font_size;
} filler_prompt;

text {
	width = 500;
	height = 100;
	caption = "yes                  no";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $probe_font_size;
} yes_no_text;

trial { 

	trial_duration = $prime_duration;
	picture { background_color = $bg_color, $bg_color, $bg_color; text prime_text; x=0; y=0; };
	
} prime;

trial {

	trial_duration = $target_duration;
	picture { background_color = $bg_color, $bg_color, $bg_color; text target_text; x=0; y=0; };
	
} target;

trial {

	trial_duration = $baseline_duration;
	picture { background_color = $bg_color, $bg_color, $bg_color; text baseline_text; x=0; y=0; };
	
} baseline;

trial {

	trial_duration = $filler_duration;
	picture { background_color = $bg_color, $bg_color, $bg_color; text filler_text; x=0; y=0; };
	
} filler;

trial {
	
	trial_type = first_response;
	trial_duration = forever;
	picture { background_color = $bg_color, $bg_color, $bg_color; text experimental_prompt; x=0; y=0; };
	time = 0;
	
	picture { background_color = $bg_color, $bg_color, $bg_color; text experimental_prompt; x=0; y=0; text yes_no_text; x=0; y=-250; };
	delta_time = $yes_no_time;
	
} experimental_probe;

trial {

	trial_type = first_response; 
	trial_duration = forever;
	
	picture { background_color = $bg_color, $bg_color, $bg_color; text baseline_prompt; x=0; y=0; };
	time = 0;
	
	picture { background_color = $bg_color, $bg_color, $bg_color; text baseline_prompt; x=0; y=0; text yes_no_text; x=0; y=-250; };
	delta_time = $yes_no_time;

} baseline_probe;

trial {

	trial_type = first_response;
	trial_duration = forever;
	picture { background_color = $bg_color, $bg_color, $bg_color; text filler_prompt; x=0; y=0; };
	time = 0;
	
	picture { background_color = $bg_color, $bg_color, $bg_color; text filler_prompt; x=0; y=0; text yes_no_text; x=0; y=-250; };
	delta_time = $yes_no_time;

} filler_probe;

trial { 

	trial_duration = $sleep_duration;
	picture { background_color = $bg_color, $bg_color, $bg_color; text { caption="";}; x=0; y=0; };
	
} sleep;

trial {

	trial_duration = $prompt_sleep_duration;
	picture { background_color = $bg_color, $bg_color, $bg_color; text { caption="";}; x=0; y=0; };
		
} prompt_sleep;

trial {
	
	trial_duration = $fixation_duration;
	picture { background_color = $bg_color, $bg_color, $bg_color; line_graphic { 
		coordinates = -300, 0, 300, 0;
		coordinates = 0, -300, 0, 300;
		line_width = 5;
		line_color = $font_color, $font_color, $font_color;
	}; x=0; y=0; };
	
} fixation;

trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 3;
	picture {
		background_color = $bg_color, $bg_color, $bg_color;
		text 
		{
			font_color = $font_color, $font_color, $font_color;
			background_color = $bg_color, $bg_color, $bg_color;
			caption = "Break";
			font = "Times New Roman";
			font_size = $stim_font_size;
		};
		x = 0;
		y = 0;
	};
} break_trial;
