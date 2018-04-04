# PlasmoAlgorithms Tutorial
Files for the [PlasmoAlgorithms](https://github.com/bbrunaud/PlasmoAlgorithms.jl) tutorial presented at the PSE Seminar, at the Department of Chemical Engineering, Carnegie Mellon University on April 2018. 

## Install Julia

Install the latest version of Julia v0.6.2, and add the executable `bin/julia` or `julia.exe` to the PATH
Binaries of Julia for all platforms are available [here](http://julialang.org/downloads/).

Windows user can alternatively install [JuliaPro](https://juliacomputing.com/products/juliapro.html), which includes the binaries of Julia, a selection of packages, and [Juno](http://junolab.org/) editor

## Install Basic JuMP packages

To install [JuMP](https://github.com/JuliaOpt/JuMP.jl) and the open-source LP/MIP solvers [Clp](https://projects.coin-or.org/Clp) and [Cbc](https://projects.coin-or.org/Cbc)  run the following code:
```julia
Pkg.add("JuMP")
Pkg.add("Clp")
```
If you have a previous installation of Julia,
be sure to update your packages to the latest version by running ``Pkg.update()``.

To test that your installation is working, run the following code (the first time you run the code you may see the message like "INFO: Precompiling stale cache ..." for a few seconds):

```julia
using JuMP, Cbc
m = Model(solver=CbcSolver())
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
```

## Install Plasmo and PlasmoAlgorithms
```julia
Pkg.clone("https://github.com/jalving/Plasmo.jl.git")
Pkg.clone("https://github.com/bbrunaud/PlasmoAlgorithms.jl.git")
```


