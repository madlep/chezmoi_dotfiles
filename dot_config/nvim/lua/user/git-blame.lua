local git_blame_ok, _ = pcall(require, "gitblame")
if not git_blame_ok then
  return
end
