#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#---------------   App: Generación de Oficios   ------------------
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
library(shiny)
library(rmarkdown)
library(knitr)
# Datos




#!!!!!!!!!!!!!!!!  INTERFAZ DE USUARIO  !!!!!!!!!!!!!!!!!!!
ui <- navbarPage(title = tags$p(img(src='puce_logo.png',width='30px',align='center'),
                                'Instituto de Investigaciones Económicas'),
                 header = tags$h2("Header-Plataforma",tags$head(tags$link(rel='shortcut icon', href='epn.ico', type='image/x-icon'))),
                 position = "fixed-top",#theme=shinytheme('flatly'),#theme = 'estilo.css',
                 footer = fluidRow(column(12,img(src='puce_logo.png',width='30px',align='center'),
                                          ' Instituto de Investigaciones Económicas ' ,
                                          '-',tags$a('PUCE (2018)',href='http://www.puce.edu.ec'),
                                          tags$b('  ||  '),tags$b('Desarrollado por: '),
                                          tags$a('C. Pachacama ',href='http://www.linkedin.com/in/cristian-david-pachacama')
                 )
                 ),
                 #Header de la Pagina
                 #tags$head(tags$link(rel='shortcut icon', href='iconoEPN.ico', type='image/x-icon')),
                 #INTRODUCCION E INFORMACION DEL PROYECTO ----------------
                 tabPanel('Oficios IIE',icon=icon('archive'),
                          fluidRow(
                            
                            sidebarPanel(
                              # img(src='puce_logo2.jpg',width='100%',align='center' ),
                              #            fluidRow(' '),tags$hr(),
                              #            fluidRow(
                              #              column(3,tags$b('Proyecto:')),column(1),
                              #              column(8,'Modelo Predictivo para Reprobación de estudiantes.')
                              #            ),tags$hr(),
                                         tags$h3('Datos del Oficio'),
                                         dateInput(inputId = "fecha",label = "Fecha",value = Sys.Date() ),
                                         textInput(inputId = "codigo",label = "Código Oficio",placeholder =  "Ej: 2018-IIE-PUCE-008"),
                                         textInput(inputId = "asunto",label = "Asunto",placeholder = "Solicitud Auditorio"),
                                         
                                         column(6,tags$br(),tags$h3('Destinatario'),
                                                textInput(inputId = "destinoNomb",label = "Nombre"),
                                                textInput(inputId = "destinoCarg",label = "Cargo"),
                                                textInput(inputId = "destinoInstit",label = "Institución")
                                                ),
                                         column(6,tags$br(),tags$h3('Remitente'),
                                                textInput(inputId = "remitNomb",label = "Nombre"),
                                                textInput(inputId = "remitCarg",label = "Cargo"))
                                         
                            ),
                            
                            mainPanel(
                              #tags$h3('Contenido del Oficio'),
                              #tags$hr(),#tags$h4('Resumen'),
                              textAreaInput(inputId = "contenido",label = "Contenido del Oficio",width = '250%',height = "300px"),
                             
                              fluidRow(' '),
                              tags$p('El propósito de esta plataforma es el integrar en una sola interfaz
                                     un modelo que permita predecir el número de estudiantes que tomarán 
                                     determinada a análisis MACRO y MICRO del modelo.'),
                              tags$h4('Modelo MACRO'),
                              tags$p('La parte MACRO del modelo es en donde se aborda desde un
                                     enfoque general la reprobación de estudiantes, resumiendo esta 
                                     información (histórica y predicciones) en un reporte asociado a las 
                                     materias de cada Carrera. Se abordan dentro de este modelo dos 
                                     metodologías,la primera basada en el ', tags$i('Promedio') ,'de reprobación
                                     historíca de las materias, para realizar las predicciones.')
                            
                            ),
                            downloadButton("report", "Generar Oficio")
                            
                          ),tags$hr()
                          
                          
                 )
)


#!!!!!!!!!!!!!!!!  SERVIDOR  !!!!!!!!!!!!!!!!!!!

server <- function(input, output, session) {
  output$report <- downloadHandler(
    filename = 'report.pdf',
    
    content = function(file) {
      out = knit2pdf('report.Rnw', clean = TRUE)
      file.rename(out, file) # move pdf to file for downloading
    },
    
    contentType = 'application/pdf'
  )
  
}


#!!!!!!!!!!!!!!!!  RUN APP  !!!!!!!!!!!!!!!!!!!
shinyApp(ui, server)


