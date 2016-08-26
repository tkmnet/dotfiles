import XMonad
import qualified XMonad.StackSet as W  -- myManageHookShift
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog         -- for xmobar
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeWindows
import XMonad.Hooks.ManageDocks        -- avoid xmobar area
import XMonad.Hooks.Place
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.Grid
import XMonad.Layout.ToggleLayouts     -- Full window at any time
import XMonad.Util.EZConfig            -- removeKeys, additionalKeys
import XMonad.Util.Run

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

modm = mod4Mask
altMask = mod1Mask
colorThink     = "#E2231A"
colorBlue      = "#857da9"
colorBlue2     = "#1e90ff"
colorOrange    = "#ff6600"
colorGreen     = "#88b986"
colorGray      = "#676767"
colorWhite     = "#d3d7cf"
colorGrayAlt   = "#313131"
colorNormalbg  = "#1a1e1b"

myTerminal = "xfce4-terminal"

main :: IO ()

main = do
    wsbar <- spawnPipe "xmobar ~/.xmonad/xmobarrc"
    xmonad $ ewmh defaultConfig
       { borderWidth = 2
       , terminal = myTerminal
       , normalBorderColor = colorGray
       , focusedBorderColor = colorThink
       , startupHook = myStartupHook
       , manageHook = placeHook simpleSmart <+> 
                      myManageHookFloat <+>
                      manageDocks
       , layoutHook = toggleLayouts Full $ avoidStruts $ myLayout
       , logHook = myLogHook wsbar
       , handleEventHook = fadeWindowsEventHook <+>
                           docksEventHook
       , workspaces = myWorkspaces
       , modMask = modm }

       `removeKeys`
        [
          (modm              , xK_Return)
        , (modm .|. shiftMask, xK_Return)
        , (modm              , xK_p     )
        , (modm .|. shiftMask, xK_p     )
        , (modm .|. shiftMask, xK_c     )
        , (modm              , xK_n     )
        , (modm              , xK_Tab   )
        , (modm .|. shiftMask, xK_Tab   )
        ]

       `additionalKeys`
       [ ((modm              , xK_Right ), nextWS ) -- go to next workspace
       , ((modm              , xK_Left  ), prevWS ) -- go to prev workspace
       , ((modm              , xK_h     ), sendMessage MirrorExpand)
       , ((modm              , xK_l     ), sendMessage MirrorShrink)
       , ((modm .|. shiftMask, xK_Right ), shiftToNext)
       , ((modm .|. shiftMask, xK_Left  ), shiftToPrev)
       , ((modm              , xK_j     ), windows W.focusDown)
       , ((modm              , xK_k     ), windows W.focusUp)
       , ((modm .|. shiftMask, xK_j     ), windows W.swapDown)
       , ((modm .|. shiftMask, xK_k     ), windows W.swapUp) ]
       
       `additionalKeys`
       [ ((modm .|. s, k), windows $ f i)
        | (i, k) <- zip myWorkspaces ([xK_1 .. xK_9] ++ [xK_0])
        , (f, s) <- [(W.greedyView, 0), (W.shift, shiftMask)]
       ]

       `additionalKeys`
       [ ((modm                    , xK_c      ), kill) -- %! Close the focused window
       ]

       `additionalKeys`
       [ ((modm              , xK_Return ), spawn myTerminal)
       , ((modm              , xK_p      ), spawn "import -window root ~/Pictures/Screenshot/`date +%y%m%d_%H%M%S`.png")
       , ((modm .|. shiftMask, xK_p      ), spawn "import -frame ~/Pictures/Screenshot/`date +%y%m%d_%H%M%S`.png")
       , ((modm              , xK_w      ), spawn "firefox")
       , ((modm              , xK_s      ), spawn "firefox --new-window 'https://www.google.co.jp/'")
       , ((modm              , xK_f      ), spawn "pcmanfm")
       , ((modm              , xK_o      ), spawn "gksudo poweroff")
       , ((modm              , xK_F5     ), spawn "xbacklight - 10")
       , ((modm              , xK_F6     ), spawn "xbacklight + 10")
       , ((modm              , xK_Escape ), spawn "systemctl suspend")
       , ((modm              , xK_r      ), spawn "xfrun4 -q;xfrun4 -r")
       , ((modm .|. altMask  , xK_l      ), spawn "dm-tool lock")
       ]

       `additionalKeys`
       [ ((modm .|.   altMask, xK_d     ), spawn "XMODIFIERS=@im=uim /usr/lib/mozc/mozc_tool --mode=word_register_dialog")
       , ((modm .|.   altMask, xK_r     ), spawn "uim-remote -r") ]

myLayout = (spacing 5 $ (Grid))
       ||| (spacing 5 $ (ResizableTall 1 (3/100) (3/5) []))
       ||| (spacing 5 $ (Mirror $ (ResizableTall 1 (3/100) (3/5) [])))
       ||| (noBorders Full)

myStartupHook = do
        setWMName "LG3D"
        spawn "./.xmonad/autostart.sh"

myManageHookFloat = composeAll
            [ className =? "MPlayer"           --> doFloat,
              className =? "Gimp"              --> doFloat,
              className =? "Websearch.py"      --> doFloat,
              className =? "Plugin-container"  --> doFloat,
              title     =? "wpa_gui"           --> doFloat,
              title     =? "Application Finder"--> doFloat,
              title     =? "Execute File"      --> doFloat,
              title     =? "Speedbar"          --> doFloat]

myLogHook h = dynamicLogWithPP $ wsPP { ppOutput = hPutStrLn h }

wsPP = xmobarPP { ppOrder               = \(ws:l:t:_)   -> [ws,t]
                , ppCurrent             = xmobarColor   colorThink       colorNormalbg
                , ppUrgent              = xmobarColor   colorWhite       colorNormalbg
                , ppVisible             = xmobarColor   colorWhite       colorNormalbg
                , ppHidden              = xmobarColor   colorWhite       colorNormalbg
                , ppHiddenNoWindows     = xmobarColor   colorGray        colorNormalbg
                , ppTitle               = xmobarColor   colorThink       colorNormalbg
                , ppWsSep               = " "
                , ppSep                 = " :: "
                }

