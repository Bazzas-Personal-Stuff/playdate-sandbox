package main

import "core:log"
import "playdate"
import sys "playdate/system"
import "playdate/display"

// //////////////////////////
// // Playdate Boilerplate //
// //////////////////////////
@(export)
eventHandler :: proc "c" (pd_api: ^playdate.Api, event: playdate.System_Event, arg: u32) -> i32 {
    context = playdate.default_context()

    when ODIN_DEBUG {
        context.logger = playdate.default_logger()
    }

    #partial switch event{
        case .init:
            playdate.init(pd_api)
            sys.set_update_callback(update)
            start()
    }

    return 0
}
// //////////////////////////
// //////////////////////////
// //////////////////////////


display_dimensions: [2]i32

start :: proc() {
    display_dimensions = {display.get_width(), display.get_height()}
}

move_speed: i32 = 10
offset: [2]i32

update :: proc() -> (should_update_display: bool) {

    buttons, _, _ := sys.get_button_state()

    if .up in buttons {
        offset.y -= 1
    }
    if .down in buttons {
        offset.y += 1
    }
    if .left in buttons {
        offset.x -= 1
    }
    if .right in buttons {
        offset.x += 1
    }

    fps_pos := display_dimensions + (offset * move_speed)
    fps_pos %= display_dimensions
    sys.draw_fps(fps_pos.x, fps_pos.y)

    return true
}