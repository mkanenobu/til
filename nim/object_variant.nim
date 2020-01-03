
type
  Person = ref object of RootObj
    name: string
    age: int
  EmploymentStatus = enum
    esPartTime,
    esFullTime

  # Dependent Type
  Employee = ref object of Person
    id: int
    case Status: EmploymentStatus
    # full-time Employee has Bonum property
    of esFullTime:
      Bonus: int
    # part-timer has not
    of esPartTime: discard

var
  fullTimeEmployee = Employee(Status: esFullTime)
  partTimer = Employee(Status: esPartTime)

# partTimer.Bonus = 300_000 # => FieldError
fullTimeEmployee.Bonus = 300_000
