package main

import "core:runtime"
import "playdate"
import "playdate/system"
import "playdate/graphics"

dll_context := runtime.default_context()


@(export)
eventHandler :: proc "c" (pd_api: ^playdate.Api, event: playdate.System_Event) -> i32 {
    context = dll_context

    #partial switch event{
        case .init:
            playdate.init(pd_api)
            begin()
    }

    return 0
}

begin :: proc() {

}