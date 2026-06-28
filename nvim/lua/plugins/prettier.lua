-- Install the prettier binary so conform can use it.
-- LazyVim's lang.markdown extra already registers prettier as a markdown
-- formatter; it just needs the binary present. We intentionally do NOT enable
-- the formatting.prettier extra, to keep prettier scoped to markdown only
-- (driven by each repo's .prettierrc, e.g. proseWrap: always).
return {
  { "mason-org/mason.nvim", opts = { ensure_installed = { "prettier" } } },
}
