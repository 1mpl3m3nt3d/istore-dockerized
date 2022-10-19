@echo off

cd /d %~dp0

cd Web.Client

echo.
echo Installing...

echo.
echo Enabling corepack...
call corepack enable

echo.
call npm --global update

echo.
call npx --yes npm-check-updates@latest --target latest --pre 1 --upgrade --color ^
--concurrency 8 --configFilePath . --configFileName .ncurc.json --cwd . ^
--dep prod,dev,bundle,optional,peer --errorLevel 1

echo.
call yarn set version berry

echo.
call yarn plugin import typescript
echo.
call yarn plugin import interactive-tools

echo.
call yarn config set --home enableTelemetry false

::rem echo.
::rem call yarn config set enableColors true
echo.
call yarn config set enableGlobalCache false
::rem echo.
::rem call yarn config set enableHyperlinks true
::rem echo.
::rem call yarn config set enableImmutableCache false
::rem echo.
::rem call yarn config set enableImmutableInstalls false
::rem echo.
::rem call yarn config set enableInlineBuilds false
::rem echo.
::rem call yarn config set enableInlineHunks true
::rem echo.
::rem call yarn config set enableMessageNames true
::rem echo.
::rem call yarn config set enableMirror true
::rem echo.
::rem call yarn config set enableNetwork true
::rem echo.
::rem call yarn config set enableProgressBars true
::rem echo.
::rem call yarn config set enableScripts true
::rem echo.
::rem call yarn config set enableStrictSsl true
echo.
call yarn config set enableTelemetry false
::rem echo.
::rem call yarn config set networkConcurrency 50
echo.
call yarn config set nmMode hardlinks-global
echo.
call yarn config set nodeLinker pnp
echo.
call yarn config set packageExtensions --json^
 ^"{ \"@mui/x-date-pickers@*\": { \"dependencies\": { \"react-dom\": \"*\" } },^
 \"@svgr/core@*\": { \"dependencies\": { \"@babel/core\": \"*\" } },^
 \"chalk@*\": { \"dependencies\": { \"#ansi-styles\": \"npm:ansi-styles@*\", \"#supports-color\": \"npm:supports-color@*\" } },^
 \"eslint-config-react-app@*\": { \"dependencies\": { \"@babel/plugin-syntax-flow\": \"*\", \"@babel/plugin-transform-react-jsx\": \"*\" } },^
 \"material-react-table@*\": { \"dependencies\": { \"react-dom\": \"*\" } },^
 \"material-table@*\": { \"dependencies\": { \"@emotion/react\": \"*\" } },^
 \"material-ui-popup-state@*\": { \"dependencies\": { \"react-dom\": \"*\" } },^
 \"npm-check-updates@*\": { \"dependencies\": { \"ini\": \"*\" } },^
 \"react-router-dom@*\": { \"dependencies\": { \"@remix-run/router\": \"*\" } },^
 \"stylelint-config-recommended-scss@*\": { \"dependencies\": { \"postcss\": \"*\" } },^
 \"stylelint-config-xo-scss@*\": { \"dependencies\": { \"postcss\": \"*\" } } }^"
echo.
call yarn config set pnpEnableEsmLoader true
echo.
call yarn config set pnpEnableInlining true
echo.
call yarn config set pnpFallbackMode dependencies-only
echo.
call yarn config set pnpMode strict
::rem echo.
::rem call yarn config set preferAggregateCacheInfo false
::rem echo.
::rem call yarn config set preferDeferredVersions false
::rem echo.
::rem call yarn config set preferInteractive false
::rem echo.
::rem call yarn config set preferTruncatedLines false
::rem echo.
::rem call yarn config set progressBarStyle default

echo.
call yarn install
echo.
call yarn up
echo.
call yarn
echo.
call yarn dlx @yarnpkg/sdks vscode
echo.
call yarn

echo.
echo Done!

echo.
pause
