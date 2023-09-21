while true do
    -- Get a reference to the player and the block template
    local player = game.Players.LocalPlayer
    local blockTemplate = game.Workspace.BlockTemplate

    -- Function to spawn and make the block fall
    local function spawnAndFall()
        -- Clone the block template
        local newBlock = blockTemplate:Clone()
        
        -- Set the position of the new block to the player's position with an offset
        newBlock.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
        
        -- Parent the new block to the Workspace
        newBlock.Parent = game.Workspace
        
        -- Apply physics to make it fall
        local fallVelocity = Vector3.new(0, -20, 0) -- Adjust the Y velocity as needed
        newBlock:SetNetworkOwner(nil) -- Remove ownership to enable physics simulation
        newBlock.Velocity = fallVelocity
        
        -- Destroy the block after a certain time (adjust as needed)
        wait(0) -- Adjust the time before destruction as needed
        newBlock:Destroy()
    end

    -- Call the spawnAndFall function when the script is executed
    spawnAndFall()

    -- Disconnect the CharacterRemoving connection when the player leaves
    local characterRemovingConnection
    characterRemovingConnection = player.CharacterRemoving:Connect(function()
        characterRemovingConnection:Disconnect()
    end)
    
    -- Wait for a period of time before repeating the loop
    wait(0) -- Adjust the time between block spawns as needed
end
