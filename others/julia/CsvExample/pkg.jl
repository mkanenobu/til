using Pkg

Pkg.activate(@__DIR__)

pkgs = ["CSV", "DataFrames"]

for pkg in pkgs
  Pkg.add(pkg)
end

Pkg.instantiate()
