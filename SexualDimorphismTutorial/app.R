library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(shinydashboardPlus)

# The User Interface
ui <- dashboardPage(
    header=dashboardHeader(
      title=tagList(
        span(class = 'logo-lg', 'Evolution of Intrasexual Dimorphism'),
        icon('atom')
      ),
      titleWidth=375
    ),
    ## Sidebar content
    sidebar=dashboardSidebar(
      sidebarMenu(
        id='sidebarmenu',
        menuItem("Introduction", tabName = "mod1",
            icon = icon('book-reader')),
        menuItem("Evolution", tabName = "mod2",
            icon = icon('dna')),
        menuItem("Persistence", tabName = "mod3",
            icon= icon('seedling'))
      ),
      width=375
    ),
    ## Body content
    body=dashboardBody(
        class="text-center",
        tabItems(
          uiOutput('video')
        )
    ),
    footer=dashboardFooter(
      left='BLG315',
      right='Lab Section 1'
    ),
    skin='green'
)

# The application logic
server <- function(input, output) {

    tabUI <- reactiveVal()

    # Render the tab content based on the selected sidebar menu item
    observeEvent(input$sidebarmenu, {
      tabUI(switch(req(input$sidebarmenu),
        'mod1'=tabItem(
            tabName="mod1",
            fluidRow(
              column(width=12,
                box(
                  width=12,
                  title='Defining Intrasexual Dimorphism',
                  column(width=6, offset=3,
                    tags$div(
                      class='text-justify',
                      p('Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore
                        magna aliqua. Sed viverra tellus in hac habitasse platea
                        dictumst vestibulum rhoncus. Penatibus et magnis dis
                        parturient montes. Nullam non nisi est sit amet facilisis
                        magna. Bibendum neque egestas congue quisque egestas diam
                        in. Semper auctor neque vitae tempus quam pellentesque
                        nec nam aliquam. Mattis ullamcorper velit sed ullamcorper
                        morbi tincidunt ornare massa eget. Iaculis nunc sed augue
                        lacus viverra vitae congue eu. Porttitor massa id neque
                        aliquam vestibulum morbi blandit. Sed lectus vestibulum
                        mattis ullamcorper velit sed. Tincidunt nunc pulvinar
                        sapien et ligula ullamcorper malesuada proin. Non arcu
                        risus quis varius. Morbi tristique senectus et netus et
                        malesuada fames. Non quam lacus suspendisse faucibus.
                        Amet dictum sit amet justo donec enim diam vulputate ut.
                        Vitae et leo duis ut diam quam nulla porttitor. Orci
                        nulla pellentesque dignissim enim sit amet venenatis.
                        Feugiat nisl pretium fusce id velit ut tortor pretium.'),
                      p('Ut eu sem integer vitae. Venenatis lectus magna fringilla
                        urna porttitor rhoncus dolor purus. Vitae nunc sed velit
                        dignissim sodales ut eu sem. Cursus in hac habitasse
                        platea dictumst quisque. Morbi quis commodo odio aenean
                        sed. Arcu risus quis varius quam. Diam ut venenatis
                        tellus in metus. Tempor commodo ullamcorper a lacus
                        vestibulum sed arcu non. Urna molestie at elementum eu.
                        Est ullamcorper eget nulla facilisi etiam. Cursus in hac
                        habitasse platea dictumst quisque. Elementum nibh tellus
                        molestie nunc non blandit massa. Tincidunt id aliquet
                        risus feugiat. Lacinia quis vel eros donec ac odio.
                        Facilisi etiam dignissim diam quis enim lobortis
                        scelerisque fermentum dui.')
                  ))),
                box(
                  width=12,
                  title='Lecture 1 Video',
                  tags$iframe(
                      width='50%',
                      src="https://www.youtube.com/embed/wloPYg7576I",
                      scrolling='no',
                      style='height: 50vh'
                  )
                ),
                box(
                  width=12,
                  collapsible=TRUE,
                  collapsed=TRUE,
                  title='Interactive Quiz 1')
            ))),
        'mod2' = tabItem(
            tabName='mod2',
            fluidRow(
              column(width=12,
                box(
                  width=12,
                  title='Evolution of Intrasexual Dimorphism',
                  column(width=6, offset=3,
                    tags$div(
                      class='text-justify',
                      p('Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore
                        magna aliqua. Sed viverra tellus in hac habitasse platea
                        dictumst vestibulum rhoncus. Penatibus et magnis dis
                        parturient montes. Nullam non nisi est sit amet facilisis
                        magna. Bibendum neque egestas congue quisque egestas diam
                        in. Semper auctor neque vitae tempus quam pellentesque
                        nec nam aliquam. Mattis ullamcorper velit sed ullamcorper
                        morbi tincidunt ornare massa eget. Iaculis nunc sed augue
                        lacus viverra vitae congue eu. Porttitor massa id neque
                        aliquam vestibulum morbi blandit. Sed lectus vestibulum
                        mattis ullamcorper velit sed. Tincidunt nunc pulvinar
                        sapien et ligula ullamcorper malesuada proin. Non arcu
                        risus quis varius. Morbi tristique senectus et netus et
                        malesuada fames. Non quam lacus suspendisse faucibus.
                        Amet dictum sit amet justo donec enim diam vulputate ut.
                        Vitae et leo duis ut diam quam nulla porttitor. Orci
                        nulla pellentesque dignissim enim sit amet venenatis.
                        Feugiat nisl pretium fusce id velit ut tortor pretium.'),
                      p('Ut eu sem integer vitae. Venenatis lectus magna fringilla
                        urna porttitor rhoncus dolor purus. Vitae nunc sed velit
                        dignissim sodales ut eu sem. Cursus in hac habitasse
                        platea dictumst quisque. Morbi quis commodo odio aenean
                        sed. Arcu risus quis varius quam. Diam ut venenatis
                        tellus in metus. Tempor commodo ullamcorper a lacus
                        vestibulum sed arcu non. Urna molestie at elementum eu.
                        Est ullamcorper eget nulla facilisi etiam. Cursus in hac
                        habitasse platea dictumst quisque. Elementum nibh tellus
                        molestie nunc non blandit massa. Tincidunt id aliquet
                        risus feugiat. Lacinia quis vel eros donec ac odio.
                        Facilisi etiam dignissim diam quis enim lobortis
                        scelerisque fermentum dui.')
                  ))),
                box(
                  width=12,
                  title='Lecture 2 Video',
                  tags$iframe(
                    width='50%',
                    src="https://www.youtube.com/embed/7Ht9jkWXqlU",
                    scrolling='no',
                    style='height: 50vh'
                  )
                ),
                box(
                  width=12,
                  collapsible=TRUE,
                  collapsed=TRUE,
                  title='Interactive Quiz 2')
            ))),
        'mod3' = tabItem(
            tabName='mod3',
            fluidRow(
              column(width=12,
                box(
                  width=12,
                  title='Persistence of Intrasexusal Dimorphism in Populations',
                  column(width=6, offset=3,
                    tags$div(
                      class='text-justify',
                      p('Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore
                        magna aliqua. Sed viverra tellus in hac habitasse platea
                        dictumst vestibulum rhoncus. Penatibus et magnis dis
                        parturient montes. Nullam non nisi est sit amet facilisis
                        magna. Bibendum neque egestas congue quisque egestas diam
                        in. Semper auctor neque vitae tempus quam pellentesque
                        nec nam aliquam. Mattis ullamcorper velit sed ullamcorper
                        morbi tincidunt ornare massa eget. Iaculis nunc sed augue
                        lacus viverra vitae congue eu. Porttitor massa id neque
                        aliquam vestibulum morbi blandit. Sed lectus vestibulum
                        mattis ullamcorper velit sed. Tincidunt nunc pulvinar
                        sapien et ligula ullamcorper malesuada proin. Non arcu
                        risus quis varius. Morbi tristique senectus et netus et
                        malesuada fames. Non quam lacus suspendisse faucibus.
                        Amet dictum sit amet justo donec enim diam vulputate ut.
                        Vitae et leo duis ut diam quam nulla porttitor. Orci
                        nulla pellentesque dignissim enim sit amet venenatis.
                        Feugiat nisl pretium fusce id velit ut tortor pretium.'),
                      p('Ut eu sem integer vitae. Venenatis lectus magna fringilla
                        urna porttitor rhoncus dolor purus. Vitae nunc sed velit
                        dignissim sodales ut eu sem. Cursus in hac habitasse
                        platea dictumst quisque. Morbi quis commodo odio aenean
                        sed. Arcu risus quis varius quam. Diam ut venenatis
                        tellus in metus. Tempor commodo ullamcorper a lacus
                        vestibulum sed arcu non. Urna molestie at elementum eu.
                        Est ullamcorper eget nulla facilisi etiam. Cursus in hac
                        habitasse platea dictumst quisque. Elementum nibh tellus
                        molestie nunc non blandit massa. Tincidunt id aliquet
                        risus feugiat. Lacinia quis vel eros donec ac odio.
                        Facilisi etiam dignissim diam quis enim lobortis
                        scelerisque fermentum dui.')
                  ))),
                box(
                  width=12,
                  title='Lecture 3 Video',
                  tags$iframe(
                    width='50%',
                    src="https://www.youtube.com/embed/EKA5e7Glmh0",
                    scrolling='no',
                    style='height: 50vh'
              )
                ),
                box(
                  width=12,
                  collapsible=TRUE,
                  collapsed=TRUE,
                  title='Interactive Quiz 3')
            )))
        ))
    })

    # Pass the correct tab UI to the front-end
    output$video <- renderUI({ tabUI() })
}

# Run the application
shinyApp(ui, server)
