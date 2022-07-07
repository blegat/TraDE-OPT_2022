using JuMP
import SimpleConicADMM

function test_SOC()
    model = Model(SimpleConicADMM.Optimizer)
    @variable(model, x[1:3] in SecondOrderCone())
    @constraint(model, x[1] == 1)
    @objective(model, Max, x[2] + x[3])
    optimize!(model)
    display(solution_summary(model))
end

test_SOC()
