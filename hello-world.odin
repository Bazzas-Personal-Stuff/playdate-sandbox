package main

import "core:runtime"
import "playdate"
import "playdate/system"
import "playdate/graphics"

@(export)
eventHandler :: proc "c" (pd_api: ^playdate.Api, event: playdate.System_Event, arg: u32) -> i32 {
    context = playdate.odin_context

    #partial switch event{
        case .init:
            playdate.init(pd_api)
            system.set_update_callback(update)
            start()
    }

    return 0
}

start :: proc() {
}

update :: proc() -> (should_update_display: bool) {
    return false
}