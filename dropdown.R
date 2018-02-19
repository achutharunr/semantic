function (name, choices, choices_value = choices, default_text = "Select", value = NULL) 
{  
  unique_dropdown_class <- paste0("dropdown_name_", name)
  shiny::tagList(    
    shiny::div(class = paste("ui selection fluid dropdown", unique_dropdown_class), 
               shiny_text_input(name, shiny::tags$input(type = "hidden", name = name), value = value), 
               uiicon("dropdown"),  
               shiny::div(class = "default text", default_text),    
               shiny::div(class = "menu", purrr::map2(choices, choices_value, ~div(class = "item", `data-value` = .y, .x)      
                                                     )
                         )
              ),
    shiny::tags$script(paste0("$('.ui.dropdown.", unique_dropdown_class, "').dropdown().dropdown('set selected', '", value, "');") 
                      )
  )
}
