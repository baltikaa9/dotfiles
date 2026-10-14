 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#121318',
    base01 = '#1e1f25',
    base02 = '#282a2f',
    base03 = '#8e9099',
    base04 = '#c5c6d0',
    base05 = '#e2e2e9',
    base06 = '#e2e2e9',
    base07 = '#e2e2e9',
    base08 = '#ffb4ab',
    base09 = '#dfbbde',
    base0A = '#bfc6dc',
    base0B = '#afc6ff',
    base0C = '#dfbbde',
    base0D = '#afc6ff',
    base0E = '#bfc6dc',
    base0F = '#dbe2f9',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e2e2e9',          bg = '#121318' })
  hi('TelescopeBorder',         { fg = '#8e9099',             bg = '#121318' })
  hi('TelescopePromptNormal',   { fg = '#e2e2e9',          bg = '#121318' })
  hi('TelescopePromptBorder',   { fg = '#8e9099',             bg = '#121318' })
  hi('TelescopePromptPrefix',   { fg = '#afc6ff',             bg = '#121318' })
  hi('TelescopePromptCounter',  { fg = '#c5c6d0',  bg = '#121318' })
  hi('TelescopePromptTitle',    { fg = '#121318',             bg = '#afc6ff' })
  hi('TelescopePreviewTitle',   { fg = '#121318',             bg = '#bfc6dc' })
  hi('TelescopeResultsTitle',   { fg = '#121318',             bg = '#dfbbde' })
  hi('TelescopeSelection',      { fg = '#e2e2e9',          bg = '#282a2f' })
  hi('TelescopeSelectionCaret', { fg = '#afc6ff',             bg = '#282a2f' })
  hi('TelescopeMatching',       { fg = '#afc6ff',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e2e2e9',          bg = '#121318' })
  hi('MiniPickBorder',         { fg = '#8e9099',             bg = '#121318' })
  hi('MiniPickPrompt',   { fg = '#e2e2e9',          bg = '#121318' })
  hi('MiniPickPromptPrefix',   { fg = '#afc6ff',             bg = '#121318' })
  hi('MiniPickBorderText',    { fg = '#121318',             bg = '#afc6ff' })
  hi('MiniPickMatchCurrent',      { fg = '#e2e2e9',          bg = '#282a2f' })
  hi('MiniPickPromptCaret', { fg = '#afc6ff',             bg = '#282a2f' })
  hi('MiniPickMatchRanges',       { fg = '#afc6ff',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
