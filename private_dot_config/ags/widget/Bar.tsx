import { Variable, GLib, bind } from "astal"
import { exec, execAsync } from "astal/process"
import { readFile, monitorFile } from "astal/file"
import { Astal, Gtk, Gdk } from "astal/gtk3"
import Hyprland from "gi://AstalHyprland"
import Mpris from "gi://AstalMpris"
import Battery from "gi://AstalBattery"
import Wp from "gi://AstalWp"
import Network from "gi://AstalNetwork"
import Tray from "gi://AstalTray"

function NullWidget() {
    return <label visible={false} />
}

function send_error(err: string) {
    exec(["fyi", "-a", "AGS Bar", "-u", "critical", "AGS Bar Error", `${err}`])
}

function Swaync() {
    function checkSwaync() {
        try {
            exec(["bash", "-c", "which swaync-client"])
            return 0
        } catch (err) {
            console.log("[Error] check swaync exists", err)
            send_error(`Which swaync-client error: ${err}`)
        }
        return 1
    }

    function togglePanel() {
        try {
            exec(["swaync-client", "-t"])
        } catch(err) {
            console.log("[Error] toggle swaync panel", err)
            send_error(`swaync-client -t error: ${err}`)
        }
    }

    function getLabel(output: string) {
        try {
            if (!output)
                return "  "
            const parsed = JSON.parse(output)
            const icon = (parsed.dnd === true)? " " : " "
            return `${icon}${parsed.count}`
        } catch(err) {
            console.log("[Error] get label of swaync", err)
            return "  "
        }
    }

    if (checkSwaync() !== 0)
        return NullWidget()
    
    const swaync = Variable<string>("").watch(
        ["swaync-client", "-s"],
        (out, prev) => {
            return out
        }
    )
    
    return <button className="Swaync"
                   onClicked={() => togglePanel()}
                   onDestroy={() => swaync.drop()}>
        <label label={swaync().as(out => getLabel(out))} />
    </button>
}

function SysTray() {
    const tray = Tray.get_default()
    const visible = Variable<boolean>(false)

    return <box className="SysTray">
        <button onClicked={() => visible.set(!visible.get())}>
            <label label="󰍜 " />
        </button>
        <box visible={bind(visible).as(Boolean)}>
            {bind(tray, "items").as(items => items.map(item => (
                <menubutton
                    tooltipMarkup={bind(item, "tooltipMarkup")}
                    usePopover={false}
                    actionGroup={bind(item, "actionGroup").as(ag => ["dbusmenu", ag])}
                    menuModel={bind(item, "menuModel")}
                >
                    <icon gicon={bind(item, "gicon")} />
                </menubutton>
            )))}
        </box>
    </box>
}

function Brightness() {
    const brightness_path = "/sys/class/backlight/amdgpu_bl2/brightness"
    const max_brightness_path = "/sys/class/backlight/amdgpu_bl2/max_brightness"
    function checkFile(path: string) {
        try {
            exec(["bash", "-c", `test -f ${path}`])
            return 0
        } catch(err) {
            console.log(`[Error] ${path} DNE`, err)
            send_error(`Check ${path} exists error: ${err}`)
        }
        return 1
    }

    function getBrightness(path: string) {
        try {
            let b = readFile(path)
            return Number(b)
        } catch (err) {
            console.log(`[error] Cannot read ${path}`)
        }
        return -1
    }

    function handleSwitch(on: boolean) {
        function disable_idle() {
            execAsync(["bash", "-e", "/home/sheric/.config/hypr/script/bar-idle-inhibitor.sh"])
                .catch(err => {
                    console.log("[Error] Bad disable idle", err)
                    send_error(`Disable idle error: ${err}`)
                })
            return 0
        }

        function enable_idle() {
            try {
                exec(["pkill", "-f", 'bar-idle-inhibitor'])
                return 0
            } catch(err) {
                console.log("[Error] Bad enable idle")
                send_error(`Enable idle error: ${err}`)
            }
            return 1
        }

        if (on)
            return disable_idle()
        else
            return enable_idle()
    }

    if (checkFile(brightness_path) !== 0 || checkFile(max_brightness_path) !== 0)
        return NullWidget()

    const brightness = Variable(getBrightness(brightness_path))
    const max_brightness = getBrightness(max_brightness_path)

    try {
        monitorFile(
            `${brightness_path}`,
            (_, event) => {
                /* Event code: 0 [File changed], 1 [Changes done] */
                if (event === 1) {
                    brightness.set(getBrightness(brightness_path))
                }
            }
        )
    } catch (err) {
        console.log("[error] monitor brightness")
    }

    const on = Variable(false);
    
    return <box className="Brightness">
        <label label={
            bind(brightness).as(b => ` ${(100 * b / max_brightness).toFixed(0)}%`)
        } />
        <button onClicked={() => {
            on.set(!on.get())
            if (handleSwitch(on.get()) !== 0) {
                on.set(!on.get())
            }
        }} >
            <label label={bind(on).as(on =>
                (on)? "  " : "  "
            )} />
        </button>
    </box>
}

function Wifi() {
    const network = Network.get_default()
    const wifi = bind(network, "wifi")

    return <box visible={wifi.as(Boolean)} className="Wifi">
        {wifi.as(wifi => wifi && (
            <icon icon={bind(wifi, "iconName")} />
        ))}
        {wifi.as(wifi => wifi && (
            <label label={bind(wifi, "ssid").as(ssid => ` ${ssid}`)} />
        ))}
        {wifi.as(wifi => wifi && (
            <label label={bind(wifi, "strength").as(strength => ` ${strength}%`)} />
        ))}
    </box>

}

function AudioSlider() {
    const speaker = Wp.get_default()?.audio.defaultSpeaker!
    const visibleChild = Variable("stackPercent")

    return <box className="AudioSlider">
        <button onClicked={() => speaker.set_mute(!speaker.get_mute())}>
            <icon icon={bind(speaker, "volumeIcon")} />
        </button>
        <stack visibleChildName={visibleChild()}>
            <button name="stackPercent" onClicked={() => visibleChild.set("stackSlider")}>
                <label label={bind(speaker, "volume").as(volume => ` ${Math.round(100 * volume).toFixed(0)}%`)} />
            </button>
            <box name="stackSlider"
                 className="VolumeBox"
                 marginLeft={visibleChild().as(name => (name === "stackSlider")? 8 : 0)}
                 marginRight={visibleChild().as(name => (name === "stackSlider")? 8 : 0)}
            >
                <button onClicked={() => visibleChild.set("stackPercent")}>
                    <label label={bind(speaker, "volume").as(volume => `${Math.round(100 * volume).toFixed(0)}% `)} />
                </button>
                <slider className="VolumeSlider"
                        widthRequest={visibleChild().as(name => (name === "stackSlider")? 100 : 0)}
                        onDragged={({ value }) => speaker.volume = value}
                        value={bind(speaker, "volume")}
                />
            </box>
        </stack>
    </box>
}

function BatteryLevel() {
    const bat = Battery.get_default()

    return <box className="Battery"
        visible={bind(bat, "isPresent")}>
        <icon icon={bind(bat, "batteryIconName")} />
        <label label={bind(bat, "percentage").as(p =>
            ` ${Math.floor(p * 100)}%`
        )} />
    </box>
}

/*
function Media() {
    const mpris = Mpris.get_default()

    return <box className="Media">
        {bind(mpris, "players").as(ps => ps[0] ? (
            <box>
                <box
                    className="Cover"
                    valign={Gtk.Align.CENTER}
                    css={bind(ps[0], "coverArt").as(cover =>
                        `background-image: url('${cover}');`
                    )}
                />
                <label
                    label={bind(ps[0], "metadata").as(() =>
                        `${ps[0].title} - ${ps[0].artist}`
                    )}
                />
            </box>
        ) : (
            <label label="Nothing Playing" />
        ))}
    </box>
}
*/

function Workspaces({ monitor }: { monitor: Gdk.Monitor}) {
    const default_icon = " "
    const icon_map = [
        ["", "[c]", " "],
        ["", "[cpp]", " "],
        ["", "[markdown]", " "],
        ["", "[python]", " "],
        ["", "[javascript", " "],
        ["", "[typescript", " "],
        ["", "nvim", " "],
        ["", "youtube", " "],
        ["", "imv", " "],
        ["", "pdf", " "],
        ["", "github", " "],
        ["", "qalculate", "󰪚 "],
        ["", "yazi", " "],
        ["", "discord", " "],
        ["", "vesktop", " "],
        ["", "google", " "],
        ["", "twitch", " "],
        ["", "mpv", " "],
        ["", "quod libet", " "],
        ["", "libreoffice calc", " "],
        ["", "libreoffice writer", " "],
        ["", "libreoffice", " "],
        ["", "gimp", " "],
        ["", "obs", "󱡞 "],
        ["", "steam", " "],
        ["firefox", "firefox", " "],
        ["kitty", "", " "],
        ["foot", "", " "],
    ]
    
    const hypr = Hyprland.get_default()

    function getIcon(title_name: string, class_name: string) {
        if (!title_name)
            return default_icon
        title_name = title_name.toLowerCase()
        for (let [_, window_key, icon] of icon_map) {
            if (window_key && title_name.includes(window_key))
                return icon
        }
        for (let [class_key, _, icon] of icon_map) {
            if (class_key && class_name.includes(class_key))
                return icon
        }
        return default_icon
    }

    function getLabel(client: Hyprland.Client) {
        return <label label={bind(client, "title").as(
            title_name => getIcon(title_name, client.get_class())
        )} className={bind(hypr, "focusedClient").as(
            fc => (fc && fc.get_workspace() === client.get_workspace() 
                && fc.get_x() === client.get_x()
                && fc.get_y() === client.get_y())? "BarClientFocused" : "BarClient"
        )}/>
    }

    function handleClients(ws: Hyprland.Workspace) {
        return <box className={
            bind(ws, "clients").as(clients => (clients.length === 0)? "BarWSBox" : 
                (clients.length === 1)? "BarWSBoxSingle" : "BarWSBoxMulti")
        }>
            { bind(ws, "clients").as(clients => clients
                .sort((a, b) => a.get_x() - b.get_x() || a.get_y() - b.get_y())
                .map(client => {
                    return getLabel(client)
                })
            ) }
        </box>
    }

    function handleWorkspace(ws: Hyprland.Workspace) {
        return (
            <button className={bind(hypr, "focusedWorkspace").as(
                fw => (ws.get_id() === fw.get_id()) ? "BarWSFocused" : "BarWS")}
                onClicked={() => {
                    if (ws.get_id() !== hypr.get_focused_workspace().get_id())
                        ws.focus()
                }}
            >
                {handleClients(ws)}
            </button>
        )
    }

    return <box className="Workspaces">
        {bind(hypr, "workspaces").as(wss => wss
            .filter(ws => (
                ws.get_monitor().get_x() === monitor.get_geometry().x && ws.get_monitor().get_y() === monitor.get_geometry().y
            ))
            .sort((a, b) => {
                if (a.name === 'special:magic-1' || b.name === 'speical:magic-2')
                    return 1
                if (a.name === 'special:magic-2' || b.name === 'special:magic-1')
                    return -1
                return a.id - b.id
            })
            .map(ws => handleWorkspace(ws))
        )}
    </box>
}

function FocusedClient() {
    const hypr = Hyprland.get_default()
    const focused = bind(hypr, "focusedClient")

    return <box
        className="Focused"
        visible={focused.as(Boolean)}>
        {focused.as(client => (
            client && <label label={bind(client, "title").as(title_name => (title_name)? title_name.slice(0, 48) : "")} />
        ))}
    </box>
}

function Time({ formatID=0 }) {
    const formatList = [
        "%H:%M:%S",
        "%Y-%m-%d, %A | %H:%M:%S"
    ]
    
    const time = Variable<string>("").poll(200, () =>
        GLib.DateTime.new_now_local().format(formatList[formatID])!)

    function handleClick() {
        formatID = 1 - formatID
        time.stopPoll();
        time.startPoll();
    }

    return <button
        className="Time"
        onDestroy={ () => time.drop() }
        label={ time() }
        onClicked={ handleClick }
    />
}

export default function Bar(monitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return <window
        className="Bar"
        gdkmonitor={monitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}>
        <centerbox>
            <box halign={Gtk.Align.START}>
                <FocusedClient />
                <Time />
            </box>
            <box >
                <Workspaces monitor={monitor} />
            </box>
            <box halign={Gtk.Align.END} >
                <Wifi />
                <BatteryLevel />
                <Brightness />
                <AudioSlider />
                <Swaync />
                <SysTray />
            </box>
        </centerbox>
    </window>
}
