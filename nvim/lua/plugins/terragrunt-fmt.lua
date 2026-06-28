-- Format HCL (incl. terragrunt.hcl) on save with terraform_fmt.
-- LazyVim's lang.terraform extra maps the `hcl` filetype to `packer_fmt`,
-- which isn't installed here, so saves silently skip formatting. terraform_fmt
-- runs `terraform fmt -` over stdin (filename-agnostic) and produces canonical
-- HCL that matches what the CI `terragrunt hclfmt` hook expects.
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        hcl = { "terraform_fmt" },
      },
    },
  },
}
