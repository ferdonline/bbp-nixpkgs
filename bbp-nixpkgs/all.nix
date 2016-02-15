# All BPP related pkgs
{
 std-pkgs
}:


let
    pkgFun = 
    pkgs:
      with pkgs;
      let 
         bbp-mpi = mpich2;
         callPackage = newScope mergePkgs;
         mergePkgs = pkgs // { 
         
         
         ##
         ## cmake externals for viz components
         ##
          cmake-external = callPackage ./config/cmake-external{
          
          };

		 ##
		 ## BBP common components
		 ##
		 bbpsdk = callPackage ./common/bbpsdk {
                   
          };
         
		 vmmlib = callPackage ./common/vmmlib {   
		 
          };         

		 ##
		 ## BBP viz components
		 ##
		 servus = callPackage ./viz/servus {   
		 
          };
          
		 lunchbox = callPackage ./viz/lunchbox {   
		 
          }; 
          
         brion = callPackage ./viz/brion {   
		 
          }; 
          
          rtneuron = callPackage ./viz/rtneuron {   
		 
          };  

		 ##
		 ## BBP HPC components
		 ##
          hpctools = callPackage ./hpc/hpctools { 
                python = python27; 
                mpiRuntime = bbp-mpi;
          }; 
          
          functionalizer = callPackage ./hpc/functionalizer { 
                 python = python27; 
                 mpiRuntime = bbp-mpi;                
          };  
          
          touchdetector = callPackage ./hpc/touchdetector {  
                 mpiRuntime = bbp-mpi;  
          };
          
          bluebuilder = callPackage ./hpc/bluebuilder {
                mpiRuntime = bbp-mpi;
          };
          
          mvdTool = callPackage ./hpc/mvdTool { 
          
          };
          
          highfive = callPackage ./hpc/highfive {
          
          };
          
          ### simulation     
          
          mod2c = callPackage ./hpc/mod2c {
      
          };

          coreneuron = callPackage ./hpc/coreneuron {
                mpiRuntime = bbp-mpi;      
          };
          
          bluron = callPackage ./hpc/bluron {
                mpiRuntime = bbp-mpi;      
          };
          
          reportinglib = callPackage ./hpc/reportinglib {
                mpiRuntime = bbp-mpi;      
          };
          
          neurodamus = callPackage ./hpc/neurodamus {
                mpiRuntime = bbp-mpi;      
          };

        };
        in
        mergePkgs;
in
  (pkgFun std-pkgs)



