
-- colorscheme and transparency (transparent no longer)
vim.cmd.colorscheme("nord")
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- lines
vim.o.number = true
vim.o.relativenumber = true                    
vim.o.cursorline = true                       
vim.o.wrap = false                           
vim.o.scrolloff = 10                        
vim.o.sidescrolloff = 10                   

-- indentation
vim.o.tabstop = 2                       
vim.o.shiftwidth = 2                   
vim.o.softtabstop = 2                 
vim.o.expandtab = true               
vim.o.smartindent = true            
vim.o.autoindent = true                  

-- searching
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.path = vim.o.path .. "**"

-- visuals
vim.o.showmode = false
vim.o.synmaxcol = 300

-- other behavior
vim.o.hidden = true
vim.o.errorbells = false
vim.o.backspace = "indent,eol,start"

-- cursor
vim.o.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99

-- splits
vim.o.splitbelow = true
vim.o.splitright = true

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- save last edit position
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    local line = mark[1]
    local ft = vim.bo.filetype
    if line > 0 and line <= lcount
      and vim.fn.index({ "commit", "gitrebase", "xxd" }, ft) == -1
      and not vim.o.diff then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- disable warnings for plugin providers im never gonna use ever (if shit don't work check me)


