-- 通用的Lua函数

-- 使用printf 函数格式化输出
function printf(format, ... )
	printf(string.format(format, ...))
end

-- 计算表中元素的数量
function tableLen( theTable )
	local count = 0
	for i,j in pairs(theTable) do
			count = count + 1
	end
	return count	
end

-- 使用 IsEmpty
function isEmpty( var )
	if var == nil then return true end
	local varType = type(var)
	if varType == "number" and var == 0 then
		return true
	elseif varType == "string" and #var == 0 then
		return true
	elseif varType == "table" and tableLen(var) == 0 then
		return true
	end

	return false
end

-- 获取元素索引
function indexOf(arrTable, theValue)
	for i,j in pairs(arrTable) do
		if j == theValue then
			return i              -- 对于非数组型的表同样适用，返回值不是一个索引，而是一个字符串形式的键名。
		end
	end
end

-- 判断一个表是否是数组
function isArray( arrTable )
	return #arrTable == tableLen(arrTable)
end

-- 设置默认值
function foo(bar, baz, faz)
	local bar = bar or "Bar"
	local baz = baz or "Baz"
	local faz = faz or "Faz"
	print("We got : ", bar, baz, faz)
end

-- 复制表
function copyTable(t)
	local res = {}
	for i,j in pairs(t) do
		res[i] = j
	end

	return res
end

-- 深度复制表
function deepCopyTable( t )
	if type(t) ~= "table" then
		return t
	end

	local mt = getmetatable(t)
	local res = {}
	for k,v in pairs(t) do
		if type(v) == "table" then
			v = deepCopyTable(v)
		end
		res[k] = v
	end

	setmetatable(res, mt)
	return res
end

-- 复制数组部分
function copyList(t )
	local res = {}
	for i,v in ipairs(t) do
		res[i] = v
	end
	return res
end

-- 复制非数组部分
function copyHash(t )
	local res = {}
	local size = #t
	for i,v in pairs(t) do
		if type(v) ~= "number" or i <=0 or i>size then
			res[i] = v
		end
	end

	return res
end
