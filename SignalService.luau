--!strict

-- Created by emilisyaye, have fun :)

local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit) -- ENSURE YOU HAVE THIS!
local Signal = require(game:GetService("ReplicatedStorage").Packages.Signal)

type SignalType = typeof(Signal.new())

local SignalService = Knit.CreateService {
	Name = "SignalService"
}

function SignalService:KnitInit()
	self.AllSignals = {} :: { [string]: SignalType }
end

function SignalService:CreateSignal(name : string)
	if self.AllSignals[name] then
		warn(("[SignalService] Signal '%s' already exists. Returning existing one."):format(name))
		return self.AllSignals[name]
	end
	
	self.AllSignals[name] = Signal.new()
	return self.AllSignals[name]
end

function SignalService:GetSignal(name : string)
	if not self.AllSignals[name] then
		warn(("[SignalService] Signal '%s' does not exist. Creating one and returning."):format(name))
		self.AllSignals[name] = Signal.new()
		return self.AllSignals[name]
	end
	return self.AllSignals[name]
end

function SignalService:FireSignal(name : string, ...)
	self:GetSignal(name):Fire(...)
end

function SignalService:DestroySignal(name: string)
	local LookingForSignal = self:GetSignal(name)
	LookingForSignal:Destroy()
	self.AllSignals[name] = nil
end

function SignalService:DestoryMultipleSignals(... : string)
	for _, SignalName in pairs({...}) do
		self:DestroySignal(SignalName)
	end
end

return SignalService
