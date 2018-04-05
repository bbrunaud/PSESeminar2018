# PlasmoAlgorithms Tutorial
Files for the [PlasmoAlgorithms](https://github.com/bbrunaud/PlasmoAlgorithms.jl) tutorial presented at the PSE Seminar, at the Department of Chemical Engineering, Carnegie Mellon University on April 2018. 

## Install Julia

Install the latest version of Julia v0.6.2, and add the executable `bin/julia` or `julia.exe` to the PATH
Binaries of Julia for all platforms are available [here](http://julialang.org/downloads/).

Windows user can alternatively install [JuliaPro](https://juliacomputing.com/products/juliapro.html), which includes the binaries of Julia, a selection of packages, and [Juno](http://junolab.org/) editor

## Install Basic JuMP packages

### Install [JuMP](https://github.com/JuliaOpt/JuMP.jl) 
```julia
Pkg.add("JuMP")
```
To get started with JuMP you can take a look at the [documentation]("http://jump.readthedocs.io")

### Install [Gurobi](http://www.gurobi.com) 
1. Download and install Gurobi
2. Set the variable GUROBI_HOME to point to the installation path
3. 
```julia
Pkg.add("Gurobi")
```
4. Set your license

To test that your installation is working, run the following code (the first time you run the code you may see the message like "INFO: Precompiling stale cache ..." for a few seconds):

```julia
using JuMP, Gurobi
m = Model(solver=GurobiSolver())
@variable(m, x >= 0, Int)
@variable(m, y >= 0)
@constraint(m, 2x + y <= 1)
@objective(m, Max, x+y)
status = solve(m)
@show status; @show getvalue(y);
```

The output should be:

```
status = :Optimal
getvalue(y) = 1.0
```

## Install Visualization Package

For visualization we will use the [Plots](https://github.com/JuliaPlots/Plots.jl) package, which can be installed by running:
```julia
Pkg.add("Plots")
Pkg.add("GraphPlots")
```

## Install Plasmo and PlasmoAlgorithms
```julia
Pkg.clone("https://github.com/jalving/Plasmo.jl.git")
Pkg.clone("https://github.com/bbrunaud/PlasmoAlgorithms.jl.git")
```

## Other Solvers Available in Julia
### External Solvers
- [CPLEX]("https://github.com/JuliaOpt/CPLEX.jl")
- [IPOPT](https://github.com/JuliaOpt/Ipopt.jl")
- [BARON]("https://github.com/joehuchette/BARON.jl")
- [OSQP]("http://osqp.readthedocs.io/en/latest/")
- KNITRO
- MOSEK
- SCIP
- XPRESS
- CSDP
- SCS
- ECOS


### Solvers written in Julia
- [Pajarito]("https://github.com/JuliaOpt/Pajarito.jl")
- [POD]("https://github.com/lanl-ansi/POD.jl")
- [Katana]("https://github.com/lanl-ansi/Katana.jl")
- [Juniper]("https://github.com/lanl-ansi/Juniper.jl")

