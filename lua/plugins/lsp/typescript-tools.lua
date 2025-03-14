-- ts_ls/tsserver wrapper

local M = {
  "pmizio/typescript-tools.nvim"
}

function M.config()
  require("typescript-tools").setup({
    ft = {
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    handlers = {
      ["textDocument/publishDiagnostics"] = require("typescript-tools.api").filter_diagnostics(
      -- Ignore typescript error codes
      -- https://typescript.tv/errors
        {
          -- 2304, -- Cannot find name 'world'. (to auto import)

          -- Ignore default ts diagnostics
          1002, 1005, 1006, 1015, 1016, 1029, 1035, 1036, 1038, 1039, 1046, 1054, 1055, 1056, 1064, 1066, 1068, 1070, 1095, 1103, 1107, 1109, 1117, 1121, 1127, 1128, 1149, 1155, 1160, 6133, 1163, 1175, 1183, 1192, 1196, 1202, 1208, 1218, 1219, 1225, 1228, 1232, 1243, 1244, 1247, 1248, 1254, 1259, 1274, 1280, 1308, 1309, 1323, 1337, 1341, 1345, 1355, 1357, 1361, 1363, 1368, 1371, 1375, 1378, 1385, 1389, 1431, 1432, 1434, 1470, 1471, 1479, 1484, 2300, 2305, 2306, 2307, 2314, 2315, 2318, 2322, 2335, 2339, 2341, 2344, 2345, 2348, 2349, 2351, 2352, 2353, 2355, 2361, 2362, 2364, 2365, 2366, 2367, 2368, 2369, 2370, 2371, 2372, 2377, 2378, 2383, 2389, 2390, 2391, 2393, 2394, 2395, 2397, 2403, 2411, 2415, 2416, 2420, 2425, 2428, 2430, 2440, 2445, 2448, 2451, 2454, 2456, 2459, 2475, 2476, 2488, 2491, 2497, 2498, 2503, 2504, 2507, 2511, 2512, 2515, 2528, 2531, 2532, 2533, 2536, 2538, 2539, 2540, 2550, 2551, 2552, 2554, 2556, 2558, 2559, 2561, 2564, 2567, 2571, 2574, 2577, 2580, 2582, 2583, 2584, 2588, 2589, 2595, 2604, 2611, 2612, 2613, 2614, 2616, 2617, 2632, 2636, 2637, 2638, 2652, 2654, 2656, 2661, 2663, 2664, 2665, 2668, 2669, 2677, 2678, 2680, 2683, 2684, 2686, 2687, 2688, 2689, 2691, 2693, 2694, 2695, 2705, 2706, 2707, 2709, 2713, 2715, 2717, 2720, 2722, 2724, 2730, 2732, 2739, 2740, 2741, 2742, 2749, 2769, 2774, 2779, 2786, 2790, 2792, 2794, 2802, 2813, 2814, 2820, 2821, 2823, 2834, 2835, 2855, 4010, 4020, 4023, 4025, 4031, 4055, 4060, 4063, 4075, 4081, 4104, 4111, 4112, 4113, 4114, 5023, 5024, 5025, 5042, 5054, 5055, 5058, 5069, 5070, 5083, 5087, 5093, 5095, 5097, 5101, 5110, 6053, 6059, 6133, 6138, 6192, 6196, 6198, 6234, 6385, 6387, 6504, 7005, 7006, 7008, 7009, 7010, 7016, 7017, 7022, 7023, 7026, 7027, 7029, 7030, 7031, 7034, 7038, 7041, 7044, 7053, 8020, 17000, 17004, 17009, 17019, 18003, 18004, 18016, 18028, 18046, 18047, 18048, 18052, 71002, 80001, 80005, 80006
        }
      ),
    },
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayVariableTypeHints = false,
      includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      includeInlayPropertyDeclarationTypeHints = false,
      includeCompletionsForModuleExports = true,
      includeInlayFunctionLikeReturnTypeHints = false,
      includeInlayEnumMemberValueHints = false,
      quotePreference = "auto"
    },
    tsserver_format_options = {
      allowIncompleteCompletions = false,
      semicolons = "Insert"
    },
    settings = {
      separate_diagnostic_server = false,
      include_completions_with_insert_text = false,
      expose_as_code_action = "all",
      complete_function_calls = false,
    },
  })
end

return M
