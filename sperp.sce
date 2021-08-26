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

#white background black text, bigger font

$prime_duration = 600;
$target_duration = 600;
$baseline_duration = 600;
$filler_duration = 600;

$baseline_probe_duration = 1000;
$filler_probe_duration = 1000;

#Prompt sleep will always come after sleep, therefore the time desired between final target and prompt should be sleep_duration + prompt_sleep_duration
$sleep_duration = 200;
$prompt_sleep_duration = 800;

$fixation_duration = 1000;


begin;

text {
	caption = "";
} prime_text;

text {
	caption = "";
} target_text;

text {
	caption = "";
} baseline_text;

text {
	caption = "";
} filler_text;

text {
	caption = "";
} experimental_prompt;

text {
	caption = "";
} baseline_prompt;

text {
	caption = "";
} filler_prompt;

trial { 

	trial_duration = $prime_duration;
	picture { text prime_text; x=0; y=0; };
	
} prime;

trial {

	trial_duration = $target_duration;
	picture { text target_text; x=0; y=0; };
	
} target;

trial {

	trial_duration = $baseline_duration;
	picture { text baseline_text; x=0; y=0; };
	
} baseline;

trial {

	trial_duration = $filler_duration;
	picture { text filler_text; x=0; y=0; };
	
} filler;

trial {
	
	trial_type = first_response;
	trial_duration = forever;
	picture { text experimental_prompt; x=0; y=0; };

} experimental_probe;

trial {

	trial_type = first_response; 
	trial_duration = forever;
	picture { text baseline_prompt; x=0; y=0; };
	
} baseline_probe;

trial {

	trial_duration = $filler_probe_duration;
	picture { text filler_prompt; x=0; y=0; };
	
} filler_probe;

trial { 

	trial_duration = $sleep_duration;
	picture { text { caption="";}; x=0; y=0; };
	
} sleep;

trial {

	trial_duration = $prompt_sleep_duration;
	picture { text { caption="";}; x=0; y=0; };
	
} prompt_sleep;

trial {
	
	trial_duration = $fixation_duration;
	picture { line_graphic { 
		coordinates = -300, 0, 300, 0;
		coordinates = 0, -300, 0, 300;
		line_width = 5;
	}; x=0; y=0; };
	
} fixation;



trial {

	trial_duration = 500;
	
	picture { text { caption = "FILLER";}; x=0; y=0; };
} F_alert;
	
trial {

	trial_duration = 500;
	
	picture { text { caption = "BASELINE";}; x=0; y=0; };
} B_alert;

trial {

	trial_duration = 500;
	
	picture { text { caption = "PRIME";}; x=0; y=0; };
} P_alert;


trial {

	trial_duration = 500;
	
	picture { text { caption = "TARGET";}; x=0; y=0; };
} T_alert;