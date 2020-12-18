shinyUI(dashboardPage(
    dashboardHeader(title = "Pathfinder Character Creation"),
    dashboardSidebar(
        selectInput(
            "race",
            "Race:",
            list(
                "Humain",
                "Demi-Elfe",
                "Demi-Orque",
                "Elfe",
                "Nain",
                "Halfelin",
                "Gnome"
            ),
            selected = "Humain"
        ),
        selectInput(
            "classe",
            "Classe:",
            list(
                "Barbare",
                "Barde",
                "Druide",
                "Ensorceleur",
                "Magicien",
                "Moine",
                "Paladin",
                "Pretre",
                "Rodeur",
                "Roublard"
            ),
            selected = "Barbare"
        )
    ),
    dashboardBody(column(width = 8,
                         box(
                             htmlOutput("race_info"),
                             htmlOutput("classe_info")
                         )),
                  column(width = 4,
                         box(
                             actionButton("reroll_carac", "Reroll",
                                          icon = icon("dice")),
                             htmlOutput("caracteristiques")
                         )))
))
