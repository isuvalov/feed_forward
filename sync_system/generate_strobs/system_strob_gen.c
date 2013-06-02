//
// Copyright 1991-2010 Mentor Graphics Corporation
//
// All Rights Reserved.
//
// THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS THE
// PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS SUBJECT TO
// LICENSE TERMS.
//
// Simple Verilog PLI Example - C function to compute fibonacci seq.
//
#include "veriuser.h"
#include "acc_user.h"
#include <stdlib.h>
#include <math.h>

int fseq_sizetf()
{
    return(32);
}

int fseq_calltf()
{
    int ret;

	ret=strob_gen(tf_getp(1), tf_getp(2), tf_getp(3), tf_getp(4), tf_getp(5), tf_getp(6));
	tf_putp(0, ret);

    return(0);
}


int fseq_checktf()
{
    bool err = FALSE;
    if (tf_nump() != 6) {
        tf_error("For work this function I need 6 arguments!!!!.\n");
        err = TRUE;
    }
    if (tf_typep(1) == tf_nullparam) {
        tf_error("Memory can't a NULL argument.\n");
        err = TRUE;
    }
    if (tf_sizep(1) > 32) {
        tf_error("Out put size 32bit.\n");
        err = TRUE;
    }
    if (err) {
        tf_message(ERR_ERROR, "", "", "");
    }
    return(0);
}

double round(double r) {
    return (r > 0.0) ? floor(r + 0.5) : ceil(r - 0.5);
}

unsigned int true_period_cnt=0;

double realtime=0.0;
double prev_time=0.0;
int rndval=0;
double time_error_val=0.0;

int strob_gen(unsigned int period, int fd, int freqoffset, int error_val, int p_loss, int start_delay)
/*  fd - in Hz, period - in samples, freqoffset - in mHz */
/* error_val - size of whole window(in two ways +/-) where strob generate, in samples */
/* p_loss - probability of loss strob, value 65535 is 100%, 0 meens that loss=0 */
/* realtime - delay in samples */
{
	int ret;
	double newfreq;
	int d_p_loss;


	newfreq=((double)fd+((double)freqoffset/1000.0));
	
	if (realtime==0.0)
	{
	  srand(1000);
	  realtime=(double)start_delay/newfreq;
	}


	ret=0;
	realtime=realtime+1.0/newfreq;



	
	if (  (realtime-prev_time)>=((((double)period)/newfreq)+time_error_val)  ) // -1.0/newfreq
	{
	rndval=rand();
	time_error_val=((double)rndval/(double)RAND_MAX)-0.5;
	time_error_val=time_error_val*((double)error_val/newfreq);


		prev_time=realtime;
		rndval=rand();
		d_p_loss=65534*((double)rndval/(double)RAND_MAX)+1;
		if (p_loss<=d_p_loss)
			ret=1;
		else
			ret=0;
	}
	return ret;
	
}


s_tfcell veriusertfs[] =
{
    {userfunction,      // type of PLI routine - usertask or userfunction
     0,                 // user_data value
     fseq_checktf,      // checktf() routine
     fseq_sizetf,       // sizetf() routine
     fseq_calltf,       // calltf() routine
     0,                 // misctf() routine
     "$syst_strob_gen"       // "$tfname" system task/function name
    },
    {0}                 // final entry must be 0
};
