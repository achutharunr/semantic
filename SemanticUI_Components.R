#Semantic UI wrapper code for UI elements

if (!require('pacman',character.only = TRUE))
{
  install.packages('pacman',dep=TRUE)
}

library('pacman')
p_load(shiny,shiny.semantic,shinyjs, ggiraph, RColorBrewer,rhandsontable)
p_load(shinydashboard,data.table,adagio)
p_load(lpSolveAPI, stringi, reshape, DT, shinycssloaders)

jsCode <- " 
$('.accordion').accordion({selector: {trigger: '.title .icon'}}).accordion('close');  
$('.ui.dropdown').dropdown({}); 
$('.rating').rating('setting', 'clearable', true); 
$('.url.example .ui.embed').embed();
$('.button').popup({inline: true});
$('.tabular.menu .item').tab();
$('.activating.element').popup();
$('.button').popup({on: 'click',inline: true});
$('.ui.modal').modal('show');
$('.ui.sticky')
  .sticky({
    context: '#example1'
  });
" 

hdivider <- function(icon, ...){
  h4(class="ui horizontal divider header", uiicon(icon), ...)
}

ipop<-function(...){
  div(div( class="ui circular small basic icon button", uiicon('info circle icon')),
      div( class="ui special popup",style = 'background-color:white; text-align:left;', ...))
}

popspop<-function(icon='info circle icon', ...){
  div(div( class="ui small icon button", uiicon(icon)),
      div( class="ui special popup",
           div(  p(style = 'background-color:white', ...)),style = 'background-color:#D7D3C7'
      ))
}

#Menu with tabs

tab<-function(title, ...){
  list(menu = title, ...)
}

makemenu<-function(...){
  tabset(
    list(...)
  )
}

#UI Stackable Grid

stackable<-function(...){
  div(class = 'ui stackable grid', ...)
}
s_segment<-function(length='equal', dimention='row', parameter='height', ...)
{
  div(class = paste(length,parameter,dimention,sep=' '), ...)
}
#Text Input

input <- function(class = "ui input", style = "", type = "text", name = "", placeholder = "") {
  div(class = class, style = style,
      tags$input(type = type, name = name, placeholder = placeholder)
  )
}

#Accordion

styledaccordion <- function(...){div(class = "ui styled accordion", ...)}

title <- function(active = TRUE, t){div(class = ifelse(active,"active title", "title"), uiicon("dropdown icon"), shiny::tags$b(t))}  
content <- function(active = TRUE, ...){div(class = ifelse(active, "active content", "content"), ...)}


#Ribbon Label
  
ribbonlabel <- function(title, colour = 'blue', size = 'large'){
                          a(class = paste("ui", size, colour, "ribbon label",sep =' '), title)  
                         }

#Raised Segment

raisedsegment <- function(...){
                              div(class = "ui raised segment", ...)
                              }

#UI Container

container <- function(...){
                          div(class = "ui container", ...)
                          }

#Header

header <- function(title, size = 'large', colour = 'black', alignment = 'left aligned', ... )
          {
            div(class = paste('ui', size, colour, alignment, 'header',sep = ' '),title,...)
          }

#PopUp Button

popupbutton <- function(content, icon, psize = 'large')
               {
                div(class = "ui icon button", content=content, uiicon(icon), variation = psize)   
               }

#Pointing Down Label

pointingdownlabel <- function(...)
         {
           div(class="ui large pointing below label", ...)
         }

#Pointing Right Label

pointingrightlabel <- function(...)
{
  div(class="ui big right pointing label", ...)
}

#Menu

menu <- function(class = "ui item menu", ...) {
  div(class = class, ...)
}


#Menu Items

menuItem <- function(..., class = "item") {
  tags$a(class = class, ...)
}

#Button

button <- function(type = '', size = 'large', title){
    div(class = paste('ui', type, size, 'button', sep = ' '), title)
}
  
#Vertical Divider

verticaldivider <- function(...){
  div(class = 'ui vertical divider',...)
}

#StickyContent

sticky <- function(side, ...)
{
  div(class = paste(side, 'ui rail', sep = ' '),
      div(class = 'ui sticky', ...))
}
