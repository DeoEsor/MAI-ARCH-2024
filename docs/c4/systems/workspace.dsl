workspace {

    name "Сервис поиска попутчиков"
    description "Яндекс.Go, только на божественных шарпах"
    !adrs decisions
    !docs documentation
    !identifiers hierarchical

    model {
        user = person "User"
        softwareSystem = softwareSystem "Software System"

        user -> softwareSystem "Uses"
    }

    views {
        systemContext softwareSystem "Diagram1" {
            include *
            autolayout
        }
        theme https://static.structurizr.com/themes/microsoft-azure-2021.01.26/theme.json
    }

    configuration {
        scope softwaresystem
    }

    branding {
        logo https://mai.ru/press/brand/download/Inverse/ENG/Inverse%20eng.png
    }
}