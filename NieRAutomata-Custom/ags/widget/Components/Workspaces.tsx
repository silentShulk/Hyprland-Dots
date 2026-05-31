import style from "../../style.scss"
import Hyprland from "gi://AstalHyprland"
import { For, createState } from "ags"

export default function Workspaces() {
    css: style

    const hyprland = Hyprland.get_default()
    const [workspaces, setWorkspaces] = createState(hyprland.workspaces)

    return (
        <box class="workspaces-container">
            <For each={workspaces}>
                {(workspace) => (
                    <label label={workspace.id.toString()}></label>
                )}
            </For>
        </box>
    )
}