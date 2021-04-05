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
        menuItem("Rarity", tabName = "mod3",
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
                  title=HTML('<h1>The Reason for the Rarity of Intrasexual Dimorphism</h1>'),
                  column(width=6, offset=3,
                    tags$div(
                      class='text-justify',
                      HTML('<p>This <b>entire</b> section should be prefaced with the
                          understanding that very little research and thus very
                          few conclusions have been drawn regarding the question
                          of why intrasexual dimorphism is not common in species
                          and further why it is more common in males.</p>'),
                      tags$h2('Why is it not common in all species?'),
                      p('In terms of why intrasexual selection arises in populations
                          we note that with secondary sexual characteristics, the
                          differences among lineages are due to different
                          intensities of sexual selection. However, the question
                          of why the intensity differs specially in some
                          populations, has not been answered yet even though it
                          was originally posed by Darwin.'),
                      p('One attempt to explain the deviation of intensity that
                          leads to general sexual selection can be the skewed sex
                          ratio. The operational sex ratio in a population is as
                          follows.'),
                      tags$h3('Males Ready to Mate: Receptive Females',
                        style='color:orange'),
                      p('The practise of polygamy, a pattern of mating where an
                        animal has more than one mate, only feeds this skewed
                        ratio further driving sexual selection.'),
                      HTML('<p>Alternatively, another source states that the higher
                        the reproductive variance, the <b>stronger</b> the
                        effects on sexual selection.</p>'),
                      HTML('<p>Generally speaking, strong sexual selection typically
                          results in sexually dimorphic traits that are
                          exaggerated in the sex with the <b>higher reproductive
                          variance.</b></p>'),
                      p('And this can be applied to intrasexual dimorphism as
                          well. Therefore, we can say that the male dragonflies
                          from the previous example experience stronger sexual
                          selection since they have a higher reproductive
                          variance due to the different phenotypes.'),
                      p('But can intrasexual dimorphism act on females within a
                          species? Yes, in some species/lineages the females
                          experience intrasexual dimorphism instead of males.'),
                      HTML('<p>An example of a female-female intrasexual
                          dimorphic species is in diving beetles, specifically
                          <i>Hydroporus memnonius</i>.</p>'),
                      tags$div(
                          tags$iframe(
                              src="https://www.youtube.com/embed/EKA5e7Glmh0",
                              scrolling='no',
                              style='height: 100%;
                                     width: 100%;
                                     frameboarder: 0;
                                     left: 0;
                                     top: 0;
                                     position: absolute;'
                          ),
                          style='overflow: hidden;
                                 padding-top: 56.25%;
                                 position: relative;'
                      ),
                      HTML('<h2>Why is it more common in males than females?</h2>'),
                      p('While this question also remains unanswered, we are able to
                          gain insight through the application of principles that
                          are already known.'),
                      p('For example, It was noted by Bateman that typically, female
                          reproduction is limited by their access to resources to
                          nourish their large gametes. However, male reproduction
                          is mainly limited by their access to females. This feeds
                          into the skewed sex ratio discussed above as well.'),
                      p('This statement could be applied to intrasexual dimorphism
                          to bring about the hypothesis that intrasexual dimorphism
                          is more common in males since they are less limited with
                          their reproduction and therefore have more energy to
                          invest into traits that will aid them in succeeding. The
                          opposite can be said for females.'),
                      p('This hypothesis then drives the question of: what is the
                          difference in male-male intrasexual dimorphic species and
                          female-female intrasexual dimorphic species in terms of
                          investment into these dimorphisms?'))
                      )
                    )
            )))))
    })

    # Pass the correct tab UI to the front-end
    output$video <- renderUI({ tabUI() })
}

# Run the application
shinyApp(ui, server)
