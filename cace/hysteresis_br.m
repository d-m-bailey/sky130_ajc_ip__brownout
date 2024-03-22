#------------------------------------------------------------------------
#Octave script to extract hysteresis of brown-out detector trip voltages
#after running CACE
#------------------------------------------------------------------------
#
#Ajacci, Ltd. Co. (c) 2024
#
#Adapted from Tim Edwards' efabless Corp CACE example:
#https://github.com/RTimothyEdwards/sky130_ef_ip__rdac3v_8bit
#
#Hysteresis is the difference between the postive ramp trip voltage and
#negative ramp trip voltage:
#
#hysteresis = v1 - v2
#
#where v1 is the trip voltage resulting from applying a positive ramp
#to the brown-out detector, and v2 is the trip voltage resulting from
#applying a negative ramp.
#
#
#-----------------------------------------------------------------------

# Load the results from CACE
args = argv();
load(args{1});

# Find the index of the conditions representing otrip[2:0]
bvecidx = -1;

names = results.("NAMES");
l = length(names);
for i = 1:l,
    n = names(i);
    if (strcmp(n, "otrip[2:0]") == 1),
	bvecidx = i;
    endif
endfor

# Sanity checks
if (bvecidx < 0),
    printf("Error:  Cannot find condition otrip[2:0] in list!");
    return
endif

result = results.("RESULT");

# Get the digital value array
cstr = sprintf("CONDITION%d", bvecidx);
bvals = results.(cstr);

# Convert digital binary string to integer
#ival = bin2dec(bvals);

#result is organized in alternating postive-ramp negative-ramp pairs in a single column
for i=1:4:length(bvals)
  rise = result(i+0);
  fall = result(i+1);
  hysteresis(bitshift((i+3),-2)) = (fall - rise); #brout_filt is negative logic so swap rise and fall
endfor

printf("%g\n", hysteresis)
