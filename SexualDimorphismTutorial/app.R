library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(shinydashboardPlus)
library(ggplot2)
library(data.table)
library(plotly)
library(magrittr)

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

    # Interactive plot for Evolution section
    set.seed(1990) # ensure reproducible samples
    reps <- 10000
    plotDT <- data.table(
        dimorphic_group=c(rep('Territorial Males', reps), rep('Satellite Males', reps)),
        body_size=c(rnorm(reps, mean=43.5, sd=2.0), rnorm(reps, mean=41.1, sd=2.1)),
        wing_length=c(rnorm(reps, mean=38.5, sd=1.3), rnorm(reps, mean=36.9, sd=1.5)),
        brown_patch=c(rnorm(reps, mean=15.8, sd=1.1), rnorm(reps, mean=15.0, sd=1.0)),
        white_patch=c(rnorm(reps, mean=11.4, sd=2.2), rnorm(reps, mean=8.7, sd=1.4))
    )
    DT <- melt(plotDT, id.vars='dimorphic_group', variable.name='feature',
        value.name='length_mm')

    output$evolution_plot <- renderPlotly({
        ggplotly(ggplot(DT, aes(length_mm, color=dimorphic_group)) +
            geom_density() +
            theme_bw() +
            theme(legend.position='bottom') +
            labs(x='Length (mm)', y='Density') +
            facet_wrap(~ feature)) %>%
        layout(legend = list(orientation = "h", x = 0.4, y = -0.2))
    })

    tabUI <- reactiveVal()

    # Render the tab content based on the selected sidebar menu item
    observeEvent(input$sidebarmenu, {
      tabUI(switch(req(input$sidebarmenu),
        'mod1'=tabItem(
            tabName='mod1',
            fluidRow(
              column(width=12,
                box(
                  width=12,
                  title=HTML('<h1>Introduction to Intrasexual and Intersexual Selection</h1>'),
                  column(width=6, offset=3,
                    tags$div(
                      class='text-justify',
                      h2('Objective'),
                      p('Learn the basis of the evolution of traits through
                          Darwin’s understanding of intrasexual selection.
                          Start at the very beginning of history.'),
                      p('Intrasexual selection occurs between members of the
                          same sex. Competition between males is common as they
                          would fight for dominance in order to mate with any
                          nearby females. For dragonflies the competition lies
                          within territory.'),
                      tags$div(
                          tags$iframe(
                              src="https://www.youtube.com/embed/DTUiR2ncWkc",
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
                      )),
                      tags$div(
                          class='text-left',
                          h2('References'),
                        tags$ol(
                          tags$li(' Brennan, P. (2010) Sexual Selection. Nature Education Knowledge 3(10):79'),
                          tags$li('Bilton, D. T., Thompson, A., & Foster, G. N. (2008).
                              Inter- and intrasexual dimorphism in the diving
                              beetle Hydroporus memnonius Nicolai
                              (Coleoptera: Dytiscidae). Biological Journal of
                              the Linnean Society, 94(4), 685–697.
                              https://doi.org/10.1111/j.1095-8312.2008.01029.x'),
                          tags$li('Moore, A. J. (1990). The Evolution of Sexual
                              Dimorphism by Sexual Selection: The Separate
                              Effects of Intrasexual Selection and Intersexual
                              Selection. Evolution, 44(2), 315. https://doi.org/10.2307/2409410'),
                          tags$li('Moore, A. J. (2010). The Behavioral Ecology
                            of Libellula luctuosa (Burmeister)
                            (Odonata: Libellulidae). Ethology, 80(1-4), 120–136.
                            https://doi.org/10.1111/j.1439-0310.1989.tb00734.x')
                        ))
                      )
                    )
            ))),
        'mod2' = tabItem(
            tabName='mod2',
            fluidRow(
              column(width=12,
                box(
                  width=12,
                  title=HTML('<h1>The Evolution of Intrasexaul Dimorphism</h1>'),
                  column(width=6, offset=3,
                    tags$div(
                      class='text-justify',
                      tags$div(
                          tags$iframe(
                              src="https://www.youtube.com/embed/uQvnjFSfaFI",
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
                      )),
                      tags$div(
                        HTML('<h2>Intrasexually Dimorphic Traits in Male <i>Libellula luctuosa</i></h2>'),
                        plotlyOutput('evolution_plot', height='90%', width='100%'),
                        style='height: 50vh'
                      ),
                      tags$div(
                          class='text-left',
                          h2('References'),
                          tags$ol(
                            tags$li('Campanella, P.J. (1975). The Evolution of
                                Mating Systems in Temperate Zone Dragonflies
                                (Odonata: Anisoptera) II: Libellula luctuosa
                                (Burmeister). Behaviour, 54(3/4), 278-310.
                                Retrieved April 4, 2021,
                                from http://www.jstor.org/stable/4533688'),
                            tags$li('Moore, A.J. (1990), THE EVOLUTION OF SEXUAL
                                DIMORPHISM BY SEXUAL SELECTION: THE SEPARATE
                                EFFECTS OF INTRASEXUAL SELECTION AND INTERSEXUAL
                                SELECTION. Evolution, 44: 315-331.
                                https://doi.org/10.1111/j.1558-5646.1990.tb05201.x'),
                            tags$li('Moore, Allen. (2010). The Behavioral
                                Ecology of Libellula luctuosa (Burmeister)
                                (Odonata: Libellulidae): III. Male Density, OSR,
                                and Male and Female Mating Behavior. Ethology.
                                80. 120 - 136. 10.1111/j.1439-0310.1989.tb00734.x.'),
                            tags$li('Jones A.G., Ratterman. N.L. (2009). Mate
                                choice and sexual selection: What have we
                                learned since Darwin? Proceedings of the
                                National Academy of Sciences, 106 (Supplement 1)
                                10001-10008; DOI: 10.1073/pnas.0901129106'),
                            tags$li('Buzatto B.A., Firman R.C. (2016)
                                Precopulatory Intrasexual Competition. In:
                                Weekes-Shackelford V., Shackelford T.,
                                Weekes-Shackelford V. (eds) Encyclopedia of
                                Evolutionary Psychological Science. Springer,
                                Cham. https://doi.org/10.1007/978-3-319-16999-6_64-1'),
                            tags$li('Malcom, K. (2016). The Dragonfly Life Cycle
                                Explained: A Brief Discussion On The Life Cycle
                                of The Common Dragonfly.')
                        ))
                      )
                    )
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
                              src="https://www.youtube.com/embed/WHvjaGBGeeQ",
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
                          investment into these dimorphisms?')),
                      tags$div(
                          class='text-left',
                          h2('References'),
                          tags$ol(
                            tags$li('Bilton, D. T., & Foster, G. N. (2016). Observed
                              shifts in the contact zone between two forms of
                              the diving beetle Hydroporus memnonius are
                              consistent with predictions from sexual conflict.
                              PeerJ, 2016(6), e2089.
                              https://doi.org/10.7717/peerj.2089'),
                            tags$li('Bilton, D. T., Thompson, A., & Foster, G. N. (2008).
                              Inter- and intrasexual dimorphism in the diving
                              beetle Hydroporus memnonius Nicolai
                              (Coleoptera: Dytiscidae). Biological Journal of
                              the Linnean Society, 94(4), 685–697.
                              https://doi.org/10.1111/j.1095-8312.2008.01029.x'),
                            tags$li('Jones, A. G., & Ratterman, N. L. (2009). Mate
                              choice and sexual selection: what have we learned
                              since Darwin? In Proceedings of the National
                              Academy of Sciences of the United States of
                              America: Vol. 106 Suppl 1 (Issue Supplement 1,
                              pp. 10001–10008). National Academy of Sciences.
                              https://doi.org/10.1073/pnas.0901129106'),
                            tags$li('Sexual Selection | Learn Science at Scitable.
                              (n.d.). Retrieved April 9, 2021, from
                              https://www.nature.com/scitable/knowledge/library/sexual-selection-13255240/')
                        ))
                      )
                    )
            )))))
    })

    # Pass the correct tab UI to the front-end
    output$video <- renderUI({ tabUI() })

}

# Run the application
shinyApp(ui, server)
