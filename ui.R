
shinyUI(pageWithSidebar(
  headerPanel("What is your weight on other planets?"),
  sidebarPanel(
    numericInput('earthWeight', 'Enter your weight on Earth', 100, min = 0, max = 1000, step = 1),
    #checkboxGroupInput("planetChoice", "'Planets'",
    radioButtons("planetChoice", "'Planets'",
                       c("Mercury" = "Mercury",
                         "Venus" = "Venus",
                         "Earth" = "Earth",
                         "Mars" = "Mars",
                         "Jupiter"="Jupiter",
                         "Saturn"="Saturn",
                         "Uranus"="Uranus",
                         "Neptune"="Neptune",
                         "The Moon"="The Moon",
                         "The Sun"="The Sun",
                         "Pluto"="Pluto")),

    submitButton("Submit")
  ),
  mainPanel(
  
    h2("Your weight on other planets/celestial bodies"),
    h4("Your weight is determined by your mass and the specific gravity of the planet you are standing on. Specific gravity varies as planet mass/radius^2\n"),
    h4("Enter your weight on earth, and select a planet. When you click the 'Submit' button, the shiny app will look up the specific gravity of earth and the planet you selected, and then divide your weight by Earth's specific gravity and then multiply by specific gravity for the appropriate planet/body"),
    h4(" "),
    h2('On Planet'),
    verbatimTextOutput("planet"),
    h2('Your weight would be:'),
    verbatimTextOutput("weight"),
    h4(" \n")
  )
))