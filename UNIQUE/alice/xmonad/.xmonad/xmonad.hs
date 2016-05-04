import qualified Data.Map as M

import XMonad
import qualified XMonad.StackSet as W  -- myManageHookShift

import Control.Monad (liftM2)          -- myManageHookShift
import System.IO                       -- for xmobar
import System.Cmd

import XMonad.Actions.WindowGo
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog         -- for xmobar
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeWindows
import XMonad.Hooks.ManageDocks        -- avoid xmobar area
import XMonad.Hooks.Place
import XMonad.Hooks.SetWMName
import XMonad.Layout
import XMonad.Layout.DragPane          -- see only two window
import XMonad.Layout.Gaps
import XMonad.Layout.IM
import XMonad.Layout.Magnifier         -- this makes window bigger
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.Named
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.Tabbed
import XMonad.Layout.Grid
import XMonad.Layout.ThreeColumns      -- for many windows
import XMonad.Layout.ToggleLayouts     -- Full window at any time
import XMonad.Util.EZConfig            -- removeKeys, additionalKeys
import XMonad.Util.Run(spawnPipe)      -- spawnPipe, hPutStrLn
import XMonad.Util.Run
import Graphics.X11.ExtraTypes.XF86


myWorkspaces = ["main", "2", "3", "4", "5", "6", "7", "8"]
modm = mod4Mask

colorThink     = "#E2231A"
colorBlue      = "#857da9"
colorBlue2     = "#1e90ff"
colorOrange    = "#ff6600"
colorYellow    = "#ffc700"
colorRed       = "#ff2a00"
colorGreen     = "#88b986"
colorGray      = "#676767"
colorWhite     = "#d3d7cf"
colorGrayAlt   = "#313131"
colorNormalbg  = "#000000"

myTerminal = "urxvt"

-- Define keys to remove
keysToRemove x =
    [
          (modm .|. shiftMask, xK_Return)
        -- Unused gmrun binding
        , (modm .|. shiftMask, xK_p)
        -- Unused close window binding
        , (modm .|. shiftMask, xK_c)
    ]

-- Delete the keys combinations we want to remove.
strippedKeys x = foldr M.delete (keys defaultConfig x) (keysToRemove x)

main :: IO ()

main = do
    wsbar <- spawnPipe myWsBar
    xmonad $ defaultConfig
       { borderWidth = 2
       , terminal = myTerminal
       , normalBorderColor = colorGray
       , focusedBorderColor = colorThink
       , startupHook = myStartupHook
       , manageHook = placeHook myPlacement <+> 
--                      myManageHookShift <+>
                      myManageHookFloat <+>
                      manageDocks
        -- any time Full mode, avoid xmobar area
       , layoutHook = toggleLayouts (noBorders Full) $ avoidStruts $ myLayout
        -- xmobar setting
       , logHook = myLogHook wsbar
       , handleEventHook = fadeWindowsEventHook <+>
                           docksEventHook
       , workspaces = myWorkspaces
       , modMask = modm }

       `additionalKeys`
       [ ((modm              , xK_Right ), nextWS ) -- go to next workspace
       , ((modm              , xK_Left  ), prevWS ) -- go to prev workspace
       --, ((modm              , xK_v     ), sendMessage ToggleLayout)
       --, ((modm              , xK_g     ), sendMessage ToggleGaps)
       , ((modm .|. shiftMask, xK_l     ), sendMessage MirrorExpand)
       , ((modm .|. shiftMask, xK_h     ), sendMessage MirrorShrink)
       , ((modm .|. shiftMask, xK_Right ), shiftToNext)
       , ((modm .|. shiftMask, xK_Left  ), shiftToPrev)
       --, ((modm              , xK_comma ), sendMessage MagnifyLess)   -- smaller window
       --, ((modm              , xK_period), sendMessage MagnifyMore)  -- bigger window
       , ((modm              , xK_j     ), windows W.focusDown)
       , ((modm              , xK_k     ), windows W.focusUp)
       , ((modm .|. shiftMask, xK_j     ), windows W.swapDown)
       , ((modm .|. shiftMask, xK_k     ), windows W.swapUp) ]

       `additionalKeys`
       [ ((modm .|. m, k), windows $ f i)
         | (i, k) <- zip myWorkspaces
                     [ xK_exclam, xK_at, xK_numbersign
                     , xK_dollar, xK_percent, xK_asciicircum
                     , xK_ampersand, xK_asterisk, xK_parenleft
                     , xK_parenright
                     ]
       , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
       ]

       `additionalKeys`
       [ ((modm                    , xK_Return ), spawn myTerminal)
       , ((modm                    , xK_c      ), kill) -- %! Close the focused window
       , ((modm                    , xK_p  ), spawn "import -window root ~/Pictures/Screenshot/`date +%y%m%d_%H%M%S`.png")
       , ((modm .|. shiftMask      , xK_p  ), spawn "import -frame ~/Pictures/Screenshot/`date +%y%m%d_%H%M%S`.png")
       , ((modm                    , xK_w ), spawn "firefox")
       , ((modm                    , xK_s ), spawn "firefox --new-window 'https://www.google.co.jp/'")
       , ((modm                    , xK_f ), spawn "pcmanfm")
       , ((modm                    , xK_o ), spawn "gksudo poweroff")
       , ((modm                    , xK_F5 ), spawn "xbacklight - 10")
       , ((modm                    , xK_F6 ), spawn "xbacklight + 10")
       , ((modm                    , xK_F8 ), spawn "gksudo wpa_cli enable_network all")
       , ((modm .|. shiftMask      , xK_F8 ), spawn "gksudo wpa_gui")
       , ((modm                    , xK_Escape ), spawn "systemctl suspend")
       , ((modm                    , xK_r ), spawn "xfrun4 -q;xfrun4 -r")
       , ((modm                    , xK_l ), spawn "dm-tool lock")
       ]


-- Handle Window behaveior
myLayout = (spacing 5 $ (Grid))
       ||| (spacing 5 $ (ResizableTall 1 (3/100) (3/5) []))
       ||| (spacing 5 $ (Mirror $ (ResizableTall 1 (3/100) (3/5) [])))
       ||| (spacing 5 $ (dragPane Vertical   (1/10) (1/2)))
       ||| (spacing 5 $ (dragPane Horizontal (1/10) (1/2)))
       ||| (spacing 5 $ (Full))



-- Start up (at xmonad beggining), like "wallpaper" or so on
myStartupHook = do
        setWMName "LG3D"
        spawn "gnome-settings-daemon"
        spawn "gnome-sound-applet"
        spawn "./.xmonad/autostart.sh"
        spawn "sh -c 'sleep 2;xrandr --noprimary;xrandr --output DVI-I-1 --primary --below DVI-I-2';xrandr --output DVI-I-2' --rotate inverted &"

-- some window must created there
--myManageHookShift = composeAll
            -- if you want to know className, type "$ xprop|grep CLASS" on shell
--            [--className =? "Chromium"   --> doShift "main"
--             className =? "Mplayer"   --> doShift "media"
--            ]
--            where viewShift = doF . liftM2 (.) W.view W.shift

-- new window will created in Float mode
myManageHookFloat = composeAll
            [ className =? "MPlayer"           --> doFloat,
              className =? "Gimp"              --> doFloat,
              className =? "Websearch.py"      --> doFloat,
              className =? "Plugin-container"  --> doFloat,
              title     =? "gedit"             --> doFloat,
              title     =? "wpa_gui"           --> doFloat,
              title     =? "Application Finder"--> doFloat,
              title     =? "Execute File"      --> doFloat,
              title     =? "Speedbar"          --> doFloat]


myLogHook h = dynamicLogWithPP $ wsPP { ppOutput = hPutStrLn h }

myWsBar = "xmobar ~/.xmonad/xmobarrc"

wsPP = xmobarPP { ppOrder               = \(ws:l:t:_)   -> [ws,t]
                , ppCurrent             = xmobarColor   colorOrange      colorNormalbg
                , ppUrgent              = xmobarColor   colorRed         colorNormalbg
                , ppVisible             = xmobarColor   colorYellow      colorNormalbg
                , ppHidden              = xmobarColor   colorWhite       colorNormalbg
                , ppHiddenNoWindows     = xmobarColor   colorGray        colorNormalbg
                , ppTitle               = xmobarColor   colorOrange      colorNormalbg
                , ppWsSep               = " "
                , ppSep                 = " :: "
                }


myPlacement = fixed (0.5, 0.5)

