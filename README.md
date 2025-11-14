#This module requires the Knit framework.
Place SignalService inside your server-side Knit Services folder, and place SignalController inside your client-side Knit Controllers folder.

Signal:CreateSignal(name:string) - This will create a Signal when called. If theres already a signal named that then it will warn you and return it.

Signal:GetSignal(name:string) - this will return your Signal for your next steps (If it does not exist, this will automatically create one for use). Recommended to put this as a variable.

Signal:Fire(name:string, ...) Will fire the signal when used, ensure you have a listener loaded first.

To create a listener, you would need the GetSignal and Fire. In one code, younwill need both while the listener will only need to get the signal. A listener should look like this flr example:

'''
local signal = Signal:GetSignal("AddCash")

signal:connect(function()

    -- your code

end)
'''

Signal:DestorySignal(name:string) - destroys the signal if not needed anymore

Signal:DestroyMultipleSignald(...:string) - destroys the selected signals