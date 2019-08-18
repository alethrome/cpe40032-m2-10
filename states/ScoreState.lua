--[[
    ScoreState Class

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:init()
    self.bronze = love.graphics.newImage('BRONZE1.png')
    self.width = self.bronze:getWidth()
    self.height = self.bronze:getHeight()
    self.silver = love.graphics.newImage('SILVER1.png')
    self.width = self.silver:getWidth()
    self.height = self.silver:getHeight()
    self.gold = love.graphics.newImage('GOLD1.png')
    self.width = self.gold:getWidth()
    self.height = self.gold:getHeight()

    self.x = VIRTUAL_WIDTH / 2 - 12


end



function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oops! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
    
    love.graphics.setFont(mediumFont)
    if self.score > 5 and self.score < 11 then
        love.graphics.draw(self.bronze, self.x , 135)
        love.graphics.printf('You got Bronze Medal :)',0 , 180,VIRTUAL_WIDTH, 'center')

    elseif self.score > 10 and self.score  < 21 then
        love.graphics.draw(self.silver, self.x, 135)
        love.graphics.printf('You got Silver Medal :)',0 , 180,VIRTUAL_WIDTH, 'center')
   
    elseif self.score > 20 then
        love.graphics.draw(self.gold, self.x, 135)
        love.graphics.printf('You got Gold Medal :)',0 , 160,VIRTUAL_WIDTH, 'center')
    end
 
    
    love.graphics.printf('Press Enter to Play Again!', 0, 210, VIRTUAL_WIDTH, 'center')

end