return {
    "nvim-tree/nvim-tree.lua",
    tag = "v1.0",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            local map = require("helpers.keymap").nvimtree_map

            -- fs
            map("a", api.fs.create, bufnr)
            map("x", api.fs.cut, bufnr)
            map("p", api.fs.paste, bufnr)
            map("d", api.fs.remove, bufnr)
            map("r", api.fs.rename_full, bufnr)

            map("c", api.fs.copy.node, bufnr)           -- copy file
            map("n", api.fs.copy.filename, bufnr)       -- copy file name
            map("N", api.fs.copy.relative_path, bufnr)  -- copy relative path
            map("nn", api.fs.copy.absolute_path, bufnr) -- copy absolute path
            -- node
            map("i", api.node.show_info_popup, bufnr)   -- info
            map("<CR>", api.node.open.edit, bufnr)      -- open
            map("<2-LeftMouse>", api.node.open.edit, bufnr)
            map("`", api.node.open.preview, bufnr)      -- preview
            map("<C-t>", api.node.open.tab, bufnr)
            map("<C-v>", api.node.open.vertical, bufnr)
            map("<C-x>", api.node.open.horizontal, bufnr)
            map("O", api.node.open.no_window_picker, bufnr)
            map("L", api.node.open.toggle_group_empty, bufnr)
            map("<BS>", api.node.navigate.parent_close, bufnr)
            map(">", api.node.navigate.sibling.next, bufnr)
            map("<", api.node.navigate.sibling.prev, bufnr)
            map("[c", api.node.navigate.git.prev, bufnr)
            map("]c", api.node.navigate.git.next, bufnr)
            map("]e", api.node.navigate.diagnostics.next, bufnr)
            map("[e", api.node.navigate.diagnostics.prev, bufnr)
            map("J", api.node.navigate.sibling.last, bufnr)
            map("K", api.node.navigate.sibling.first, bufnr)
            map("P", api.node.navigate.parent, bufnr)
            map("/", api.node.run.cmd, bufnr)
            map("S", api.node.run.system, bufnr)
            -- tree
            map(".", api.tree.change_root_to_node, bufnr)   -- change root to current
            map(",", api.tree.change_root_to_parent, bufnr) -- change root to parent
            map("B", api.tree.toggle_no_buffer_filter, bufnr)
            map("C", api.tree.toggle_git_clean_filter, bufnr)
            map("h", api.tree.toggle_hidden_filter, bufnr) -- toggle hidden files
            map("I", api.tree.toggle_gitignore_filter, bufnr)
            map("g?", api.tree.toggle_help, bufnr)
            map("R", api.tree.reload, bufnr)
            map("E", api.tree.expand_all, bufnr)
            map("M", api.tree.toggle_no_bookmark_filter, bufnr)
            map("q", api.tree.close, bufnr)
            map("s", api.tree.search_node, bufnr)
            map("U", api.tree.toggle_custom_filter, bufnr)
            map("W", api.tree.collapse_all, bufnr)
            map("<2-RightMouse>", api.tree.change_root_to_node, bufnr)
            -- marks
            map("bd", api.marks.bulk.delete, bufnr)
            map("bt", api.marks.bulk.trash, bufnr)
            map("bmv", api.marks.bulk.move, bufnr)
            map("m", api.marks.toggle, bufnr)
            -- live filter
            map("F", api.live_filter.clear, bufnr)
            map("f", api.live_filter.start, bufnr)
        end
    },
}
