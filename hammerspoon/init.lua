-- hammerspoon config

require('modules.caffein')
require('modules.mouse')
local caffein = require('modules.caffein'):init({'shift'}, 'f15')
local vim_mode = require('modules.vim'):init('f16', nil)
local app_manager = require('modules.appman'):init('f18')
local mouse = require('modules.mouse'):init('f17')

hs.alert.show('loaded')
hs.hotkey.bind({'cmd'}, 'F17', hs.hints.windowHints)
hs.hotkey.bind({'shift'}, 'space', function() hs.eventtap.keyStroke({'shift'}, 'F17') end)
hs.hints.hintChars = {'F', 'U', 'I', 'O', 'P', 'H', 'J', 'K', 'L', 'B', 'N', 'M', 'Q', 'W', 'E', 'R', 'Z', 'X', 'C', 'V' }

-- tab move

local tabTable = {}

tabTable['Slack'] = {
    left = { mod = {'option'}, key = 'up' },
    right = { mod = {'option'}, key = 'down' }
}
tabTable['Safari'] = {
    left = { mod = {'control', 'shift'}, key = 'tab' },
    right = { mod = {'control'}, key = 'tab' }
}
tabTable['_else_'] = {
    left = { mod = {'control'}, key = 'pageup' },
    right = { mod = {'control'}, key = 'pagedown' }
}

local function getActiveAppName()
    return hs.application.frontmostApplication():name()
end

local function tabMove(dir)

    return function()

        tab = tabTable[getActiveAppName()]

        if tab == nil then
            tab = tabTable['_else_']
        end

        hs.eventtap.keyStroke(tab[dir]['mod'], tab[dir]['key'])
    end
end

local function addVimMode()
    vim_mode:addKey({ mod={}, key=',', func=tabMove('left'), repetition=true })
    vim_mode:addKey({ mod={}, key='.', func=tabMove('right'), repetition=true })
end

addVimMode()
