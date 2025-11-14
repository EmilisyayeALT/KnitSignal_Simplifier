This module requires the Knit framework.
Place SignalService inside your server-side Knit Services folder, and place SignalController inside your client-side Knit Controllers folder.

Signal:CreateSignal(name:string) - This will create a Signal when called. If theres already a signal named that then it will warn you and return it.
Signal:GetSignal(name:string) - this will return your Signal for your next steps (If it does not exist, this will automatically create one for use). Recommended to put this as a variable.