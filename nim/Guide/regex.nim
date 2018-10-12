#import re
import nre

var
    rege = re"test[123]"
    tests = @["1", "test", "test2", "test12", "testtest"]

for i in tests:
    #if i.match(reg): # re module
    if i.contains(rege): # nre module
        echo "match ",i
    else:
        echo "not match ", i
