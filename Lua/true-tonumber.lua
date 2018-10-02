num = tonumber(arg[1])
--print(i)
if num <= 10 then
	print("入力された数字は10以下")
elseif num > 10 and num <= 20 then
	print("入力された数字は10より大きく、20以下")
else
	print("入力された数字は20以上")
end
