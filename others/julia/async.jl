task = @task begin
                 sleep(5)
                 println("Done")
             end

println(task)

# exec
schedule(task)
wait(task)