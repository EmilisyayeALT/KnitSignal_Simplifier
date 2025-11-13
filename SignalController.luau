--!strict

-- Created by emilisyaye, have fun :)

local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit.KnitClient) -- ENSURE YOU HAVE THIS!
local Signal = require(game:GetService("ReplicatedStorage").Packages.Signal)

type SignalType = typeof(Signal.new())

local SignalController = Knit.CreateController({
	Name = "SignalController",
})

function SignalController:KnitInit()
	self.AllSignals = {} :: { [string]: SignalType }
end

function SignalController:CreateSignal(name : string)
	if self.AllSignals[name] then
		warn(("[ClientSignalService] Signal '%s' already exists. Returning existing one."):format(name))
		return self.AllSignals[name]
	end

	self.AllSignals[name] = Signal.new()
	return self.AllSignals[name]
end

function SignalController:GetSignal(name : string)
	if not self.AllSignals[name] then
		warn(("[ClientSignalService] Signal '%s' does not exist. Creating one and returning."):format(name))
		self.AllSignals[name] = Signal.new()
		return self.AllSignals[name]
	end
	return self.AllSignals[name]
end

function SignalController:FireSignal(name : string, ...)
	self:GetSignal(name):Fire(...)
end

function SignalController:DestroySignal(name: string)
	local signalObj = self:GetSignal(name)
	signalObj:Destroy()
	self.AllSignals[name] = nil
end

function SignalController:DestoryMultipleSignals(... : string)
	for _, signalName in pairs({...}) do
		self:DestroySignal(signalName)
	end
end

return SignalController
