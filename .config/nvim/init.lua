require('lumenn.remap')
require('lumenn.lazy')
require('lumenn.set')

-- Function to detect Hugo HTML template files
local function detect_hugo_template()
  local filename = vim.fn.expand('%:e')
  local content = vim.fn.getline(1, '$')

  if filename == "html" and vim.fn.search("{{") ~= 0 then
    vim.bo.filetype = "gotmpl"
  end
end

-- Create an autocommand group for file detection
vim.api.nvim_create_augroup("HugoTemplateDetection", { clear = true })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*",
  callback = detect_hugo_template,
  group = "HugoTemplateDetection",
})
