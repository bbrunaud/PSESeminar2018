using Plasmo
using PlasmoAlgorithms
using Gurobi

g = PlasmoGraph()
setsolver(g,GurobiSolver(OutputFlag=0))

include("modelgen.jl")
node = []
products = 1:3
for i in products
    n = add_node(g)
    m = spmodel(i)
    setmodel(n,m)
    push!(node,n)
end

@linkconstraint(g, [s in sites, i in 1:products[end-1], t in otime],node[i][:hf][s,i,t] == node[i+1][:hi][s,i+1,t])

heur(g) = 41575.633

r = lagrangesolve(g, max_iterations=10, update_method=:subgradient,lagrangeheuristic=heur)
