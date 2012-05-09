#include <R.h>
#include <Rdefines.h>
#include <R_ext/Error.h>

SEXP binned_sum ( SEXP x, SEXP bin, SEXP nbins ) {

     double *rx = REAL(x);
     int *ibin = INTEGER(bin);
     int nb = *INTEGER(nbins);
     int nx = length(x);
    
     SEXP res;
     PROTECT(res=allocMatrix(REALSXP, nb, 2));
     double *rres = REAL(res);
    
	for (int i = 0; i < 2*nb; i++){
         rres[i] = 0;
     }
                  
     for (int i = 0; i < nx; i++){
        int b = ibin[i] - 1;
		// check if b in within boundaries
        if (-1 < b && b < nb  && !ISNA(rx[i])){
           rres[b] += 1;
           rres[b + nb] += rx[i];
        }
     }
     UNPROTECT(1);
     return res;
}