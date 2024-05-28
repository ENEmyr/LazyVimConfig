return {
  "kawre/leetcode.nvim",
  opts = {
    injectro = {
      ["python3"] = {
        before = true,
      },
      ["cpp"] = {
        before = { "#include <algorithm>", "#include <vector>", "using namespace std;" },
        after = "int main() {}",
      },
    },
  },
}
