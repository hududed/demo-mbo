library(mlr3mbo)
library(bbotk)
library(data.table)
library(dplyr)
library(mlr3tuning)
library(mlr3)
library(mlr3learners)
library(paradox)
set.seed(42)

dt = subset(read.csv("data-multiobjective.csv"))
data <- data.table(dt)
search_space = ps(x1 = p_int(lower = 2000, upper = 5500),
                  x2 = p_int(lower = 1000, upper = 20000),
                  x3 = p_int(lower = 1, upper = 10))
codomain = ps(y1 = p_int(tags = "minimize"), y2 = p_dbl(tags = "minimize"))
archive = Archive$new(search_space = search_space, codomain = codomain)
archive$add_evals(xdt = data[, c("x1", "x2", "x3")], ydt = data[, c("y1","y2")])
print(archive)

surrogate = srlrn(list(default_gp(), default_gp()), archive = archive)  # GP
acq_function = acqf("ehvi", surrogate = surrogate) # EHVI
acq_optimizer = acqo(opt("focus_search", n_points = 1000, maxit = 10),
                     terminator = trm("evals", n_evals = 11000),
                     acq_function = acq_function)
print(acq_optimizer)

q = 2
lie = data.table()
liar = min

# FIRST LOOP
set.seed(42)
acq_function$surrogate$update()
acq_function$update()
candidate = acq_optimizer$optimize()  # first candidate

tmp_archive = archive$clone(deep = TRUE)
acq_function$surrogate$archive = tmp_archive
lie[, "y1" := liar(archive$data[["y1"]])]
lie[, "y2" := liar(archive$data[["y2"]])]
candidate_new = candidate

for (i in seq_len(q)[-1L]) {
    tmp_archive$add_evals(xdt = candidate_new, xss_trafoed = transform_xdt_to_xss(candidate_new, tmp_archive$search_space), ydt = lie)
    acq_function$surrogate$update()
    acq_function$update()
    candidate_new = acq_optimizer$optimize()
    candidate = rbind(candidate, candidate_new)
}
print(candidate)

acq_function$surrogate$archive = archive
data_new = data.table(x1 = candidate$x1, x2 = candidate$x2, x3 = candidate$x3, y1 =200, y2 = 3.3)
archive$add_evals(xdt = data_new[, c("x1", "x2", "x3")], ydt = data_new[, c("y1","y2")])
print(archive$data)

# SECOND LOOP
acq_function$surrogate$update()
acq_function$update()
candidate = acq_optimizer$optimize()

tmp_archive = archive$clone(deep = TRUE)
acq_function$surrogate$archive = tmp_archive
lie[, "y1" := liar(archive$data[["y1"]])]
lie[, "y2" := liar(archive$data[["y2"]])]
candidate_new = candidate

for (i in seq_len(q)[-1L]) {
    tmp_archive$add_evals(xdt = candidate_new, xss_trafoed = transform_xdt_to_xss(candidate_new, tmp_archive$search_space), ydt = lie)
    acq_function$surrogate$update()
    acq_function$update()
    candidate_new = acq_optimizer$optimize()
    candidate = rbind(candidate, candidate_new)
}

acq_function$surrogate$archive = archive
data_new = data.table(x1 = candidate$x1, x2 = candidate$x2, x3 = candidate$x3, y1 =500, y2 = 5.5)
archive$add_evals(xdt = data_new[, c("x1", "x2", "x3")], ydt = data_new[, c("y1","y2")])
print(archive$data)
