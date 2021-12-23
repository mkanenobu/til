# composite type (like object)
struct User
    name::String
    email::String
    age::Int64
    option # -> Any
end

println(fieldnames(User))

# construct
u = User(
    "John Doe",
    "john@example.com",
    22,
    "Human"
)
println(u)
# error, fields are immutable
# u.email = "john2@example.com"

mutable struct MutableUser
    name::String
    email::String
    age::Int64
    option # -> Any
end

u2 = MutableUser(
    "John Doe",
    "john@example.com",
    22,
    "Human"
)
println(u2)
u2.email = "john2@example.com"

# inner constructor method
struct UserWithValidation
    name::String
    age::Int64
    UserWithValidation(name, age) = age < 0 ? error("Age out of range") : new(name, age)
end
UserWithValidation("John", 18)
# error
# UserWithValidation("John", -1)
