import style from "../style.scss"
import { Astal } from "ags/gtk4"
import { createPoll } from "ags/time"
import Workspaces from "./Components/Workspaces"



export default function TopBar() {
    css: style

    const { LEFT, TOP, RIGHT } = Astal.WindowAnchor

    const clock = createPoll("", 1000, "date \"+%H:%M\"")



    return (
        <window visible
            exclusivity={Astal.Exclusivity.EXCLUSIVE}
            layer={Astal.Layer.TOP}
            anchor={LEFT | TOP | RIGHT}
        >
            <Workspaces />

            <label label={clock} />
        </window>
    )
}