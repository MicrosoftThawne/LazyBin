-->>   LazyBin | 1.0.1   <<--
-->> Written by JaheedFX <<--

local lazyBin = {}
local LUA_TTABLE = "table";local LUA_TSTRING = "string";local LUA_TNUMBER = "number";local LUA_TBOOLEAN = "boolean";local LUA_TNIL = nil;local LUA_TUSERDATA = "userdata";local LUA_TFUNCTION = "function"
local RegisteredKeys      = {}
local RegisteredFunctions = {}
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

function lazyBin.RegisterKey(key, event)
  table.insert(RegisteredKeys,  key)
  table.insert(RegisteredFunctions,  event)
end

function lazyBin.match(_1, _2)
  if _1 == _2 then
    return true
  else
    return false
  end
end

-->> TODO: Add arguments to registered functions! <<--
Mouse.KeyDown(function(key)
    if string.match(table.concat(RegisteredKeys), tolower(key)) then
      for index,value in pairs(RegisteredKeys) do
     		if string.match(tolower(key), tolower(value)) then
      	  RegisteredFunctions[index]()
      	end
    	end
    end
end)
  
function lazyBin.ChangeText(object, text)
  object.Text = text
end

function lazyBin.type(_)
  return tostring(type(_))
end
function lazyBin.ButtonClick(button, event)
	button.MouseButton1Down:Connect(event)
end

function lazyBin.SetVisibility(object, state)
	object.Visible = state
end

function lazyBin.ChangeState(state)
  if lazyBin.match(lazyBin.type(state), LUA_TBOOLEAN) ~= true then return false end
	state = not state
	return state
end

function lazyBin.ChangeBackColor(object, color)
    object.BackBackgroundColor3 = Color3.new(color)
end
function lazyBin.ChangeTextColor(object, color)
    object.BackBackgroundColor3 = Color3.new(color)
end
  
return lazyBin
