local lazyBin = loadstring(game:HttpGet("https://github.com/MicrosoftThawne/LazyBin/blob/master/LazyBin/module.lua"))()

function Test()
  print("Test function executed!")
end

-->> When LeftShift is pressed the 'Test()' function will be ran! <<--
lazyBin.RegisterKey(Enum.KeyCode.LeftShift, Test)
