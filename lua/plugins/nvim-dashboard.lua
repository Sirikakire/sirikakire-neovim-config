return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				preview = {
					-- command = true,       -- preview command
					-- file_path = true,    -- preview file path
					-- file_height = true,  -- preview file height
					-- file_width = true   -- preview file width
				},
				config = {
					week_header = {
						enable = true,
					},
					packages = {
						enable = true,
					},
					project = {
						enable = false,
						limit = 5,
						icon = " ",
						label = "Recent projects",
						action = "Telescope find_files cwd=",
					},
					mru = { limit = 10, icon = "󰏓 ", label = "Recent files", cwd_only = false },
					footer = { '', '♥  Hello Sirikakire ♥ ', 'Hope you will have a wonderful day  ' },
					shortcut = {
						{ icon = "󰊳 ", desc = "Update", action = "Lazy update", key = "u" },
						{
							icon = " ",
							desc = "Files",
							action = "Telescope find_files",
							key = "f",
						},
						{
							icon = " ",
							desc = "Sidebar",
							action = "Neotree . focus",
							key = "n",
						},
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
