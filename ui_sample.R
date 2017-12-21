#Semantic UI Page

ui <- semanticPage(suppressDependencies("bootstrap"),
                   useShinyjs(),
                   tags$style(type = "text/css",
                              
                              "label { font-size: 16px;
                              font-family:Georgia;
                              }"
                   ),
                   style="background-color:#fff3f3",
                   h2(class="ui header", style="background: linear-gradient(white, #fff3f3);",
                      img(src="logo.jpg", height = 100, width = 100),
                      div(class = 'content',
                          stackable(
                            s_segment(length='eleven', dimention='column', parameter='wide',
                                      div(header('Test Header', 'large', 
                                                 style="color:#bb0826; font-family:Georgia; vertical-align: middle;",
                                                 align = 'center'
                                      ))),
                            s_segment(length='five', dimention='column', parameter='wide',
                                      h3('Test Team Name', 
                                         style="color:#bb0826; font-family:Georgia; vertical-align: middle;"           
                                      ))
                          )
                      )
                   ),
                   raisedsegment(style = 'border-radius: 50px;',
                                 stackable(s_segment(length='one', dimention='column', parameter='wide',
                                                     p(),uiicon(type = 'bordered fitted large block layout icon'), 
                                                     align = 'center'
                                 ),
                                 s_segment(length='two', dimention='column',
                                           parameter='wide', align = 'left',
                                           radioButtons("MainSelection", inline = F,
                                                        width = '100%', 
                                                        label = div(header('', 'small', 
                                                                           style="color:#bb0826; font-family:Georgia; vertical-align: middle;"),
                                                                    p(),p()
                                                        ),
                                                        choices = list("Opt1" = 1, "Opt2" = 2, "Opt3" = 3),
                                                        selected = 1)
                                 ),
                                 s_segment(length='one', dimention='column',
                                           parameter='wide', verticaldivider('')
                                 ),
                                 s_segment(length='eight', dimention='column',
                                           parameter='wide', p(),
                                           h3(paste('Welcome! Today is',format(Sys.Date(), "%A, %B %d"),'.',sep = ' '))
                                 ) 
                                 )
                   ),
                   div(style = 'background-color:#e8dfdf', p(),p(),p(),p(),
                       conditionalPanel("input.MainSelection == 1 && output.p_queue_table.length < 4",
                                        div(class="ui active inverted dimmer",
                                            div(class="ui huge text loader","Loading!")
                                        )
                       ),
                       conditionalPanel("input.MainSelection == 1",
                                        div(style = 'background-color:#fff3f3',
                                            raisedsegment(div(style = 'background-color:white; font-family:Georgia; ', 
                                                              stackable(s_segment(length='sixteen', dimention='column', parameter='wide',
                                                                                  div(style = 'background-color:white; font-family:Georgia; ', 
                                                                                      hdivider("file text outline icon", "Test")
                                                                                  )
                                                              )
                                                              ),
                                                              stackable(s_segment(length='sixteen', dimention='column', parameter='wide',
                                                                                  div(style = 'font-size:150%',
                                                                                      p(uiicon('info circle icon'),'Test')
                                                                                  )), br(),
                                                                        s_segment(length='twelve', dimention='column', parameter='wide',
                                                                                  withSpinner(div(rHandsontableOutput("p_queue_table"), style = 'text-align:center'), type = getOption("spinner.type", default = 8),
                                                                                              color = getOption("spinner.color", default = "#ba6b6c"))),
                                                                        s_segment(length='three', dimention='column', parameter='wide', 
                                                                                  div(align = 'center', actionButton(class = 'ui primary button',"QsaveBtn", "Save", width = '100%')),
                                                                                  br(), uiOutput('queuemessage')
                                                                        )
                                                                        
                                                              )
                                            )
                                            )
                                        )
                       ),
                       conditionalPanel("input.MainSelection == 2",
                                        div(style = 'background-color:#fff3f3',
                                            raisedsegment(div(style = 'background-color:white; font-family:Georgia; ',
                                                              stackable(s_segment(length='sixteen', dimention='column', parameter='wide',
                                                                                  div(hdivider("users icon", "Test"))
                                                              ),
                                                              s_segment(length='nine', dimention='column', parameter='wide',
                                                                        div(style = 'font-size:150%',
                                                                            p(uiicon('info circle icon'),'Test')
                                                                        )),
                                                              s_segment(length='nine', dimention='column', parameter='wide',
                                                                        withSpinner(div(rHandsontableOutput("emp_table"), style = "text-align: center"),type = getOption("spinner.type", default = 8),
                                                                                    color = getOption("spinner.color", default = "#ba6b6c")
                                                                        )
                                                              ),
                                                              s_segment(length='six', dimention='column', parameter='wide',
                                                                        div(align = 'center', checkboxInput('change', 'Change All', value = FALSE, width = '50%')),br(),
                                                                        div(align = 'center', actionButton(class = 'ui primary button', "PsaveBtn", "Save", width = '50%')),
                                                                        br(),uiOutput('message'))
                                                              
                                                              #                                                               s_segment(length='six', dimention='column', parameter='wide',br(), br(),
                                                              #                                                                         
                                                              #                                                               )
                                                              )
                                            )
                                            )
                                        )
                       ),
                       
                       conditionalPanel("input.MainSelection == 3",
                                        div(style = 'background-color:#fff3f3',
                                            raisedsegment(div(style = 'background-color:white; font-family:Georgia; ',
                                                              stackable(s_segment(length='sixteen', dimention='column', parameter='wide',
                                                                                  hdivider("users icon", "Allocation")
                                                              )
                                                              ),
                                                              raisedsegment(style = 'border-radius: 50px;',
                                                                            stackable(s_segment(length='one', dimention='column', parameter='wide',p(),
                                                                                                uiicon(type = 'bordered fitted large angle double right icon'),
                                                                                                align = 'center'
                                                                            ),
                                                                            s_segment(length='three', dimention='column', parameter='wide',
                                                                                      radioButtons("MinMax", inline = F, width = '100%', 
                                                                                                   label = div(header('Objective Function :', 'small', 
                                                                                                                      style="color:#bb0826; font-family:Georgia; vertical-align: middle;"),p(),p()
                                                                                                   ),
                                                                                                   choices = list("Test" = 1, "Test" = 2), selected = 1), br(),
                                                                                                    div(align = 'center', actionButton(class = 'ui primary button', 'opt',"Test",width = '50%'))  
                                                                            ),
                                                                            s_segment(length='one', dimention='column', parameter='wide', verticaldivider('')),
                                                                            s_segment(length='two', dimention='column', parameter='wide',
                                                                                    br(),  div(align = 'center',
                                                                                          uiOutput('status')
                                                                                      )),
                                                                            s_segment(length='one', dimention='column', parameter='wide', verticaldivider('')),     
                                                                            s_segment(length='three', dimention='column', parameter='wide', br(),div(align = 'left',
                                                                                                                                                uiOutput('volstatus')
                                                                            )),
                                                                            s_segment(length='one', dimention='column', parameter='wide', verticaldivider('')),     
                                                                            
                                                                            s_segment(length='four', dimention='column', parameter='wide', br(),div(align = 'left',
                                                                                                                                               uiOutput('empstatus')
                                                                            ))
                                                                            
                                                                            )
                                                              )
                                            ), br(),br(),
                                            stackable(s_segment(length='one', dimention='column', parameter='wide',p()
                                            ),
                                            s_segment(length='three', dimention='column', parameter='wide',
                                                      actionButton(class = 'ui primary button', 'outsave',"Test Test",width = '100%')
                                            ),
                                            s_segment(length='twelve', dimention='column', parameter='wide',
                                                      div(align = 'center',
                                                          h4(textOutput('savemessage'))
                                                      )
                                            )
                                            ),br(),br(),
                                            stackable(s_segment(length='eight', dimention='column', parameter='wide',
                                                                raisedsegment(ribbonlabel('Test Test', colour = 'green'),br(),br(), p(),dataTableOutput('out_q'))
                                            ),
                                            s_segment(length='eight', dimention='column', parameter='wide',
                                                      raisedsegment(ribbonlabel('Test Test', colour = 'green'),br(), br(), p(), dataTableOutput('out_e'))
                                            )
                                            )
                                            )
                                        )
                       )
                   )
                   )
