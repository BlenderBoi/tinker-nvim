
return {"williamboman/mason.nvim", dependencies={"williamboman/mason-lspconfig.nvim"},
config=function()
	local mason = require("mason")
	mason.setup()
end
}
