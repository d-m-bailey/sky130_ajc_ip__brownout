#------------------------------------------------------------------------
#After running CACE, this octave script extracts the response time of
#the under-voltage detector i.e. when avdd falls below a preset threshold
#voltage.
#------------------------------------------------------------------------
#
#Ajacci, Ltd. Co. (c) 2024
#
#Adapted from Tim Edwards' efabless Corp CACE example:
#https://github.com/RTimothyEdwards/sky130_ef_ip__rdac3v_8bit
#
#Response time is defined here as the time lapse between a voltage drop
#in avdd that crosses the preset trip voltage and the digital alarm 
#assertion at the output.
#
#
#-----------------------------------------------------------------------

# Load the results from CACE
args = argv();
load(args{1});

# Find the index of the conditions representing vtrip[2:0]
bvecidx = -1;

names = results.("NAMES");
l = length(names);
for i = 1:l,
    n = names(i);
    if (strcmp(n, "vtrip[2:0]") == 1),
	bvecidx = i;
    endif
endfor

# Sanity checks
if (bvecidx < 0),
    printf("Error:  Cannot find condition vtrip[2:0] in list!");
    return
endif

result = results.("RESULT");

# Get the digital value array
cstr = sprintf("CONDITION%d", bvecidx);
bvals = results.(cstr);

# Convert digital binary string to integer
ival = bin2dec(bvals);

#result is organized in alternating brown-out/under-voltage pairs
for i=1:4:length(ival)
  response_time(bitshift((i+3),-2)) = result(i+1);
endfor

printf("%g\n", response_time)
